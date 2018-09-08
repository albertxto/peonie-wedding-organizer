<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ include file="connect.jsp" %>

<%
	String eventGroom = request.getParameter("selGroom");
	String eventBride = request.getParameter("selBride");
	String eventHall = request.getParameter("selHall");
	String eventDate = request.getParameter("txtDate");
	String eventDec1 = request.getParameter("selDec1");
	String eventDec2 = request.getParameter("selDec2");
	String eventDec3 = request.getParameter("selDec3");
	
	//Validasi data dari form
	if(eventGroom.equals("none") || eventGroom == null){
		session.setAttribute("errMsg","Groom must be selected!");
	}
	else if(eventBride.equals("none") || eventBride == null){
		session.setAttribute("errMsg","Bride must be selected!");
	}
	else if(eventHall.equals("none") || eventHall == null){
		session.setAttribute("errMsg","Hall must be selected!");
	}
	else if(eventDate.equals("") || eventDate == null){
		session.setAttribute("errMsg","Date must be picked!");
	}
	//Apabila ada dua atau lebih No Decoration, maka langsung insert data event ke database
	else if((eventDec1.equals("No Decoration")&&eventDec2.equals("No Decoration")) || (eventDec1.equals("No Decoration")&&eventDec3.equals("No Decoration")) || (eventDec2.equals("No Decoration")&&eventDec3.equals("No Decoration")) || (eventDec1.equals("No Decoration")&&eventDec2.equals("No Decoration")&&eventDec3.equals("No Decoration"))){
		String query1 = "UPDATE member SET member_status = 'Married' WHERE member_name LIKE '"+eventGroom+"'";
		st.executeUpdate(query1);
		String query2 = "UPDATE member SET member_status = 'Married' WHERE member_name LIKE '"+eventBride+"'";
		st.executeUpdate(query2);
		String query3 = "INSERT INTO event (event_groom, event_bride, event_hall, event_date, event_dec1, event_dec2, event_dec3) VALUES ('"+eventGroom+"', '"+eventBride+"', '"+eventHall+"', '"+eventDate+"', '"+eventDec1+"', '"+eventDec2+"', '"+eventDec3+"')";
		st.executeUpdate(query3);
		session.setAttribute("msg","Success insert new event!");
	}
	else{
		//Selain itu, apabila ada data decoration yang sama, maka tampilkan pesan error
		if(eventDec1.equals(eventDec2) || eventDec1.equals(eventDec3) || eventDec2.equals(eventDec3)){
			session.setAttribute("errMsg","Decoration must not same with other decoration");
		}
		//Apabila semua data berbeda, insert data event ke database
		else{
			String query1 = "UPDATE member SET member_status = 'Married' WHERE member_name LIKE '"+eventGroom+"'";
			st.executeUpdate(query1);
			String query2 = "UPDATE member SET member_status = 'Married' WHERE member_name LIKE '"+eventBride+"'";
			st.executeUpdate(query2);
			String query3 = "INSERT INTO event (event_groom, event_bride, event_hall, event_date, event_dec1, event_dec2, event_dec3) VALUES ('"+eventGroom+"', '"+eventBride+"', '"+eventHall+"', '"+eventDate+"', '"+eventDec1+"', '"+eventDec2+"', '"+eventDec3+"')";
			st.executeUpdate(query3);
			session.setAttribute("msg","Success insert new event!");
		}
	}
	response.sendRedirect("../addEvent.jsp");
%>