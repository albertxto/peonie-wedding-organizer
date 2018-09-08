<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date" import="java.text.*" %>
<% Integer active=1; //Semua variabel active digunakan pada header.jsp %>
<!DOCTYPE html>
<html>
<head>
	<title>Peonie Wedding Organizer</title>
	<%@ include file="link.jsp" %>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-4">
				<%
					//Membuat tanggal hari ini
					Date date = new Date();
					String today = new SimpleDateFormat("EEEE, dd MMMM yyyy").format(date);
					out.print("<p>"+today+"</p>");
				%>
			</div>
			<div class="col-sm-offset-2 col-md-offset-4 col-sm-6 col-md-4 pull-right">
				<%
					//Apabila ada employee yang sedang login, tampilkan nama employee tersebut dan jumlah employee lain yang online
                	if(session.getAttribute("sessionId")!=null){
						out.print("<p>Welcome, "+session.getAttribute("sessionName")+", "+application.getAttribute("jumlahUserOnline")+" user(s) online</p>");
					}
				%>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<img class="img-responsive" src="img/wedding.jpg" />
				<h1>LOVE IS AN ADVENTURE</h1>
				<p>Since the beginning of time, the sea has romanced explorers, poets and lovers, alike. Now it can be awe-inspiring setting for your perfect wedding. On the beach, in a charming port or out at sea, start a new chapter of your love story with an unforgettable Royal Carribbean wedding ceremony. Discover the breathtaking possibilities onboard and across the world for a wedding that's unforgettable from beginning to end.</p>
				<h2>Bring it to Life:</h2>
				<p>Enhance your Royal Wedding with the extras you want more of - live musicians, custom floral accents, and photography packages - plus everything you need for a memorable reception.</p>
			</div>
		</div>
		<hr>
		<%@ include file="footer.jsp" %>
	</div>
	<%@ include file="script.jsp" %>
</body>
</html>