<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<%
	Integer active=4;
	if(session.getAttribute("sessionId")==null || request.getParameter("id")==null){
		response.sendRedirect("event.jsp");
	}
	else{
		String eventId = request.getParameter("id");
		String query = "SELECT * FROM event WHERE event_id = '"+eventId+"'";
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
			session.setAttribute("sessionGroom",rs.getString("event_groom"));
			session.setAttribute("sessionBride",rs.getString("event_bride"));
			session.setAttribute("sessionHall",rs.getString("event_hall"));
			session.setAttribute("sessionDate",rs.getString("event_date"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Wedding Event</title>
	<%@ include file="link.jsp" %>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 pull-right">
				<p>Welcome, <%= session.getAttribute("sessionName") %>, <%= application.getAttribute("jumlahUserOnline") %> user(s) online</p>
            </div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Update Wedding Event</h1>
				<form action="controller/doEditEvent.jsp" method="post" class="form-horizontal">
				<% if(session.getAttribute("errMsg")!=null){ %>
					<div class="alert alert-danger text-center"><%= session.getAttribute("errMsg") %></div>
				<%
					request.getSession().removeAttribute("errMsg"); }
					if(session.getAttribute("msg")!=null){
				%>
					<div class="alert alert-success text-center"><%= session.getAttribute("msg") %></div>
				<% request.getSession().removeAttribute("msg"); } %>
					<input type="hidden" name="hiddenId" value="<%= request.getParameter("id") %>" />
					<div class="form-group">
						<label class="control-label col-sm-2">
							Groom Name:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= session.getAttribute("sessionGroom") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Bride Name:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= session.getAttribute("sessionBride") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Wedding Hall:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="txtHall">
								<option value="none">Select Hall</option>
							<%
								String hall = "SELECT * FROM hall ORDER BY hall_name";
								ResultSet rsHall = st.executeQuery(hall);
								while(rsHall.next()){
							%>
								<option <% if(session.getAttribute("sessionHall").equals(rsHall.getString("hall_name"))){ out.print("selected"); } %>>
									<%= rsHall.getString("hall_name") %>
								</option>
							<%
								}
							%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Date:
						</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="txtDate" value="<%= session.getAttribute("sessionDate") %>" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" />
							<a href="event.jsp"><input type="button" class="btn btn-danger" value="Cancel" /></a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
	<%@ include file="script.jsp" %>
</body>
</html>
<%
			request.getSession().removeAttribute("sessionGroom");
			request.getSession().removeAttribute("sessionBride");
			request.getSession().removeAttribute("sessionHall");
			request.getSession().removeAttribute("sessionDate");
		}
		else{
			response.sendRedirect("event.jsp");
		}
	}
%>