<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date" import="java.text.*" %>
<%@ include file="controller/connect.jsp" %>
<% Integer active=4; %>
<!DOCTYPE html>
<html>
<head>
	<title>Wedding Event</title>
	<%@ include file="link.jsp" %>
</head>

<body>
	
	<%@ include file="header.jsp" %>
	
	<div class="container">
<% if(session.getAttribute("sessionId")!=null){ %>
		<div class="row">
			<div class="col-sm-4 pull-right">
				<p>Welcome, <%= session.getAttribute("sessionName") %>, <%= application.getAttribute("jumlahUserOnline") %> user(s) online</p>
            </div>
		</div>
<% } %>
<% if(session.getAttribute("sessionId")!=null){ %>
		<div class="row" style="margin-bottom:20px;">
			<div class="col-lg-12">
				<a href="addEvent.jsp"><button class="btn btn-primary">Insert new wedding event</button></a>
			</div>
		</div>
<% } %>
        <div class="row">
            <div class="col-lg-12">
                <h2>Today's Wedding</h2>
            </div>
			<div>
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>Groom Name</th>
							<th>Bride Name</th>
							<th>Wedding Hall</th>
							<th>Date</th>
						<% if(session.getAttribute("sessionId")!=null){ %>
							<th>Action</th>
						<% } %>
						</tr>
					</thead>
<%
	Date date = new Date();
	String today = new SimpleDateFormat("yyyy-MM-dd").format(date);
	
	String query = "SELECT * FROM event WHERE event_date = '"+today+"' ORDER BY event_date";
	ResultSet rs = st.executeQuery(query);
	rs.last();
	Integer check = rs.getRow();
	if(check>0){
		rs.beforeFirst();
		while(rs.next()){
%>
					<tbody>
						<tr>
							<td><%= rs.getString("event_groom") %></td>
							<td><%= rs.getString("event_bride") %></td>
							<td><%= rs.getString("event_hall") %></td>
							<td><%= rs.getString("event_date") %></td>
						<% if(session.getAttribute("sessionId")!=null){ %>
							<td><a href="editEvent.jsp?id=<%= rs.getString("event_id") %>"><button class="btn btn-danger">Edit</button></a></td>
						<% } %>
						</tr>
					</tbody>
<%
		}
	}else{
		out.print("<tr><td class='text-center' colspan='5'>There's nothing to show!</td></tr>");
	}
%>
				</table>
			</div>
		</div>
		<div class="row">
            <div class="col-lg-12">
                <h2>Next Wedding Event</h2>
            </div>
			<div>
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>Groom Name</th>
							<th>Bride Name</th>
							<th>Wedding Hall</th>
							<th>Date</th>
						<% if(session.getAttribute("sessionId")!=null){ %>
							<th>Action</th>
						<% } %>
						</tr>
					</thead>
<%
	String query2 = "SELECT * FROM event WHERE event_date > '"+today+"' ORDER BY event_date";
	ResultSet rs2 = st.executeQuery(query2);
	rs2.last();
	Integer check2 = rs2.getRow();
	if(check2>0){
		rs2.beforeFirst();
		while(rs2.next()){
%>
					<tbody>
						<tr>
							<td><%= rs2.getString("event_groom") %></td>
							<td><%= rs2.getString("event_bride") %></td>
							<td><%= rs2.getString("event_hall") %></td>
							<td><%= rs2.getString("event_date") %></td>
						<% if(session.getAttribute("sessionId")!=null){ %>
							<td><a href="editEvent.jsp?id=<%= rs2.getString("event_id") %>"><button class="btn btn-danger">Edit</button></a></td>
						<% } %>
						</tr>
					</tbody>
<%
		}
	}else{
		out.print("<tr><td class='text-center' colspan='5'>There's nothing to show!</td></tr>");
	}
%>
				</table>
			</div>
		</div>
        <%@include file="footer.jsp"%>
	</div>
	<%@include file="script.jsp"%>
</body>
</html>