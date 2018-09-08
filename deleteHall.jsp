<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<%
	Integer active=2;
	if(session.getAttribute("sessionId")==null || request.getParameter("id")==null){
		response.sendRedirect("hall.jsp");
	}
	else{
		String hallId = request.getParameter("id");
		String query = "SELECT * FROM hall WHERE hall_id = '"+hallId+"'";
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
	<title>Delete <%= rs.getString("hall_name") %></title>
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
				<h1 class="page-header">Delete <%= rs.getString("hall_name") %></h1>
				<form action="controller/doDeleteHall.jsp" method="post" class="form-horizontal">
					<input type="hidden" name="hiddenId" value="<%= request.getParameter("id") %>" />
					<div class="form-group">
						<label class="control-label col-sm-2">
							Name:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= rs.getString("hall_name") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Description:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= rs.getString("hall_description") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Image:
						</label>
						<div class="col-sm-10">
							<img src="img/<%= rs.getString("hall_image") %>" class="img-responsive" style="width:360px;height:240px;" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							Are you sure want to delete <%= rs.getString("hall_name") %>?
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" value="Yes" />
							<a href="hall.jsp"><input type="button" class="btn btn-danger" value="No" /></a>
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
		}
	}
%>