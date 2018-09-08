<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%@ include file="connect.jsp" %>

<%
	/*String hallName = request.getParameter("txtName");
	String hallDesc = request.getParameter("txtDesc");
	String hallImage = request.getParameter("fileImage");
	
	//Validasi data dari form
	if(hallName.equals("") || hallName == null){
		session.setAttribute("errMsg","Hall name must be filled!");
	}
	else if(hallDesc.equals("") || hallDesc == null){
		session.setAttribute("errMsg","Hall description must be filled!");
	}
	else if(hallImage.equals("") || hallImage == null){
		session.setAttribute("errMsg","Hall image must be selected!");
	}
	else{
		//Apabila berhasil melewati semua validasi, insert hall ke database
		String query = "INSERT INTO hall (hall_name, hall_description, hall_image) VALUES ('"+hallName+"', '"+hallDesc+"', '"+hallImage+"')";
		st.executeUpdate(query);
		session.setAttribute("msg","Success insert new hall!");
	}
	response.sendRedirect("../addHall.jsp");*/

	// Initialize
	String hallName = "";
	String hallDesc = "";
	String hallImage = "";
	int flag = 0;

	File file ;
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	ServletContext context = pageContext.getServletContext();
	String filePath = context.getInitParameter("file-upload");

	// Verify the content type
	String contentType = request.getContentType();

	if ((contentType.indexOf("multipart/form-data") >= 0)) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);

		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// maximum file size to be uploaded.
		upload.setSizeMax( maxFileSize );

		try { 
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();
			
			while ( i.hasNext () ) {
				FileItem fi = (FileItem)i.next();

				if ( fi.isFormField() ) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getString();

					if(fieldName.equals("") || fieldName==null || fileName.equals("") || fileName==null){
						flag++;
					}
					else{
						if(fieldName.equals("txtName")){
							hallName = fileName;
						}
						else if(fieldName.equals("txtDesc")){
							hallDesc = fileName;
						}
					}
				}

				else if ( !fi.isFormField () ) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

					if(fieldName.equals("") || fieldName==null || fileName.equals("") || fileName==null){
						flag++;
					}
					else{
						// Write the file
						if( fileName.lastIndexOf("\\") >= 0 ) {
							file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")) );
						} else {
							file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1) );
						}
						fi.write( file ) ;
						//out.println("Uploaded Filename: " + filePath + fileName + "<br>");

						hallImage = fileName;
					}
				}
			}

			if(flag==0){
				String query = "INSERT INTO hall (hall_name, hall_description, hall_image) VALUES ('"+hallName+"', '"+hallDesc+"', '"+hallImage+"')";
				st.executeUpdate(query);
				session.setAttribute("msg","Success insert new wedding hall!");
			}
			else{
				session.setAttribute("errMsg","All input must be filled");
			}
			response.sendRedirect("../addHall.jsp");

		} catch(Exception ex) {
			System.out.println(ex);
		}
	} else {
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet upload</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>No file uploaded</p>");
		out.println("</body>");
		out.println("</html>");
	}
%>