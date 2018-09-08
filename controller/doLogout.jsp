<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	session.invalidate(); //Hapus semua session
	
	Integer userOnline = (Integer)application.getAttribute("jumlahUserOnline"); //Ambil application jumlahUserOnline dan ditampung ke variabel userOnline
	
	//Apabila userOnline tidak sama dengan nol, maka userOnline dikurang satu
	if(userOnline!=0){
		//userOnline--;
		userOnline--;
	}
	
	application.setAttribute("jumlahUserOnline",userOnline); //Update application jumlahUserOnline setelah dikurang
	response.sendRedirect("../index.jsp");
%>