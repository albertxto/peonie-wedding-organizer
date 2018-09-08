<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="connect.jsp" %>

<%
	if(request.getParameter("hiddenId").equals("") || request.getParameter("hiddenId")==null){
		response.sendRedirect("../decoration.jsp");
	}
	else{
		//Apabila ada decoration id, maka hapus decoration berdasarkan id tersebut dari database
		String decId = request.getParameter("hiddenId");
		String query = "DELETE FROM decoration WHERE dec_id = '"+decId+"'";
		st.executeUpdate(query);
		response.sendRedirect("../decoration.jsp");
	}
%>