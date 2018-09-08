<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<%
	Integer active=7;
	if(session.getAttribute("sessionId")==null){
		response.sendRedirect("index.jsp");
	}
	else if(request.getParameter("id")==null){
		response.sendRedirect("member.jsp");
	}
	else{
		String memberId = request.getParameter("id");
		String query = "SELECT * FROM member WHERE member_id = '"+memberId+"'";
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
	<title>Delete <%= rs.getString("member_name") %></title>
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
				<h1 class="page-header">Delete <%= rs.getString("member_name") %></h1>
				<form action="controller/doDeleteMember.jsp" method="post" class="form-horizontal">
					<input type="hidden" name="hiddenId" value="<%= request.getParameter("id") %>" />
					<div class="form-group">
						<label class="control-label col-sm-2">
							Name:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= rs.getString("member_name") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Photo:
						</label>
						<div class="col-sm-10">
							<img src="img/<%= rs.getString("member_photo") %>" class="img-responsive" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							Are you sure want to delete <%= rs.getString("member_name") %>?
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" value="Yes" />
							<a href="member.jsp"><input type="button" class="btn btn-danger" value="No" /></a>
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