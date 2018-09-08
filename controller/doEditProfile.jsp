<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%@ include file="connect.jsp" %>

<%
	/*String empId = (String)session.getAttribute("sessionId");
	String empName = request.getParameter("txtName");
	String empDob = request.getParameter("txtDob");
	String empGender = request.getParameter("radGender");
	String empPass = request.getParameter("txtPass");
	String confPass = request.getParameter("txtConfPass");
	String empPhoto = request.getParameter("filePhoto");
	
	//Validasi data dari form
	if(empId.equals("") || empId == null){
		response.sendRedirect("../index.jsp");
	}
	else if(empName.equals("") || empName == null){
		session.setAttribute("errMsg","Name must be filled!");
	}
	else if(empDob.equals("") || empDob == null){
		session.setAttribute("errMsg","Date of birth must be filled!");
	}
	else if(empGender.equals("") || empGender == null){
		session.setAttribute("errMsg","Gender must be selected!");
	}
	else if(empPass.equals("") || empPass == null || confPass.equals("") || confPass == null){
		session.setAttribute("errMsg","Password must be filled!");
	}
	else if(!empPass.equals(confPass)){
		session.setAttribute("errMsg","Confirm password must be same with the inputted password!");
	}
	else if(empPhoto.equals("") || empPhoto == null){
		session.setAttribute("errMsg","Photo must be selected!");
	}
	else{
		//Apabila berhasil melewati semua validasi, update employee ke database
		String query = "UPDATE employee SET emp_name = '"+empName+"' , emp_dob = '"+empDob+"' , emp_gender = '"+empGender+"' , emp_password = '"+empPass+"' , emp_photo = '"+empPhoto+"' WHERE emp_id = '"+empId+"'";
		st.executeUpdate(query);
		session.setAttribute("sessionName",empName); //Update sessionName untuk mengganti nama employee di application
		session.setAttribute("msg","Update success!");
	}
	response.sendRedirect("../editProfile.jsp");*/

	// Initialize
	String empId = (String)session.getAttribute("sessionId");
	String empName = "";
	String empDob = "";
	String empGender = "";
	String empPass = "";
	String confPass = "";
	String empPhoto = "";
	int flag = 0;
	boolean exist = true;

	File file;
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
							empName = fileName;
						}
						else if(fieldName.equals("txtDob")){
							empDob = fileName;
						}
						else if(fieldName.equals("radGender")){
							empGender = fileName;
						}
						else if(fieldName.equals("txtPass")){
							empPass = fileName;
						}
						else if(fieldName.equals("txtConfPass")){
							confPass = fileName;
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
						exist = false;
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

						empPhoto = fileName;
					}
				}
			}
			//Cek password sama dengan confirm password
			if(!empPass.equals(confPass)){
				session.setAttribute("errMsg","Confirm password must be same with the inputted password!");
				flag = -1;
			}
			if(flag==0){
				if(exist==true){
					String query = "UPDATE employee SET emp_name = '"+empName+"' , emp_dob = '"+empDob+"' , emp_gender = '"+empGender+"' , emp_password = '"+empPass+"' , emp_photo = '"+empPhoto+"' WHERE emp_id = '"+empId+"'";
					st.executeUpdate(query);
				}
				else{
					String query = "UPDATE employee SET emp_name = '"+empName+"' , emp_dob = '"+empDob+"' , emp_gender = '"+empGender+"' , emp_password = '"+empPass+"' WHERE emp_id = '"+empId+"'";
					st.executeUpdate(query);
				}
				session.setAttribute("sessionName",empName); //Update sessionName untuk mengganti nama employee di application
				session.setAttribute("msg","Update profile success!");
			}
			else if(flag>0){
				session.setAttribute("errMsg","All input must be filled");
			}
			response.sendRedirect("../editProfile.jsp");

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