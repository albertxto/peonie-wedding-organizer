<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="connect.jsp" %>

<%
	if(request.getParameter("hiddenId").equals("") || request.getParameter("hiddenId")==null){
		response.sendRedirect("../hall.jsp");
	}
	else{
		//Apabila ada hall id, maka hapus hall berdasarkan id tersebut dari database
		String hallId = request.getParameter("hiddenId");
		String query = "DELETE FROM hall WHERE hall_id = '"+hallId+"'";
		st.executeUpdate(query);
		response.sendRedirect("../hall.jsp");
	}
%>