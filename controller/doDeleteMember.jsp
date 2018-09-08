<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="connect.jsp" %>

<%
	if(request.getParameter("hiddenId").equals("") || request.getParameter("hiddenId")==null){
		response.sendRedirect("../member.jsp");
	}
	else{
		//Apabila ada member id, maka hapus member berdasarkan id tersebut dari database
		String memberId = request.getParameter("hiddenId");
		String query = "DELETE FROM member WHERE member_id = '"+memberId+"'";
		st.executeUpdate(query);
		response.sendRedirect("../member.jsp");
	}
%>