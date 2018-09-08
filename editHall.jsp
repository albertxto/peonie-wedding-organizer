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
	<title>Edit <%= rs.getString("hall_name") %></title>
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
				<h1 class="page-header">Edit <%= rs.getString("hall_name") %></h1>
				<form action="controller/doEditHall.jsp" method="post" class="form-horizontal" enctype="multipart/form-data">
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
							Name:
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="txtName" value="<%= rs.getString("hall_name") %>" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Description:
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="txtDesc" rows="4"><%= rs.getString("hall_description") %></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Image:
						</label>
						<div class="col-sm-10">
							<img src="img/<%= rs.getString("hall_image") %>" class="img-responsive" style="width:360px;height:240px;" id="change-image" />
							<input type="file" name="fileImage" accept=".jpg,.png" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" />
							<a href="hall.jsp"><input type="button" class="btn btn-danger" value="Back" /></a>
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
		else{
			response.sendRedirect("hall.jsp");
		}
	}
%>