<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="connect.jsp" %>

<%
	String eventId = request.getParameter("hiddenId");
	String eventHall = request.getParameter("txtHall");
	String eventDate = request.getParameter("txtDate");
	
	//Validasi data dari form
	if(eventId.equals("") || eventId == null){
		response.sendRedirect("../edit.jsp");
	}
	else if(eventHall.equals("none") || eventHall == null){
		session.setAttribute("errMsg","Wedding hall must be filled!");
	}
	else if(eventDate.equals("") || eventDate == null){
		session.setAttribute("errMsg","Event date must be filled!");
	}
	else{
		//Apabila berhasil melewati semua validasi, update event ke database
		String query = "UPDATE event SET event_hall = '"+eventHall+"' , event_date = '"+eventDate+"' WHERE event_id = '"+eventId+"'";
		st.executeUpdate(query);
		session.setAttribute("msg","Update wedding event success!");
	}
	response.sendRedirect("../editEvent.jsp?id="+eventId);
%>