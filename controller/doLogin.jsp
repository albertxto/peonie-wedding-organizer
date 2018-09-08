<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="connect.jsp" %>

<%
	//Semua data dari form dimasukkan ke variabel
	String empId = request.getParameter("txtId");
	String empPass = request.getParameter("txtPass");
	String chkRmb = request.getParameter("chkRmb");
	Integer userOnline = 0;
	
	//Validasi variabel
	if(empId.equals("") || empId == null){
		session.setAttribute("errMsg","Employee ID must be filled!");
		response.sendRedirect("../login.jsp");
	}
	else if(empPass.equals("") || empPass == null){
		session.setAttribute("errMsg","Password must be filled!");
		response.sendRedirect("../login.jsp");
	}
	else{
		//Apabila berhasil melewati validasi maka select data dari database
		String query = "SELECT * FROM employee WHERE emp_id = '"+empId+"' AND emp_password = '"+empPass+"'";
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
			//Apabila data yang dimasukkan cocok dengan data di database (berhasil login) maka buat session, cookie, dan application
			
			//Buat session untuk menampung data login
			session.setAttribute("sessionId",rs.getString("emp_id"));
			session.setAttribute("sessionName",rs.getString("emp_name"));
			
			//Buat cookie untuk menampung masa hidup login
			if(chkRmb!=null){
				Cookie c = new Cookie("cookieId",rs.getString("emp_id"));
				c.setMaxAge(3600); //Masa hidup cookie selama satu jam
				c.setPath("/");
				response.addCookie(c);
			}
			
			//Buat application untuk menampung jumlah user online
			if(application.getAttribute("jumlahUserOnline") == null){
				userOnline = 0;	//Apabila tidak ada data pada application, masukkan nilai awal nol
			}
			else{
				userOnline = (Integer)application.getAttribute("jumlahUserOnline"); //Apabila ada data pada application, ambil datanya
			}
			//Tambahkan jumlah user online dan update ke application
			userOnline++;
			application.setAttribute("jumlahUserOnline",userOnline);
			response.sendRedirect("../index.jsp");
		}
		else{
			//Apabila data tidak ditemukan tampilkan pesan error
			session.setAttribute("errMsg","Log In failed!");
			response.sendRedirect("../login.jsp");
		}
	}
%>