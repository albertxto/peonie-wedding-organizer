<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<%
	if(session.getAttribute("sessionId")==null){
		response.sendRedirect("index.jsp");
	}
	Integer active=7;
%>
<!DOCTYPE html>
<html>
<head>
	<title>New Member</title>
    <%@ include file="link.jsp" %>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<a href="member.jsp"><input type="button" class="btn btn-primary" value="Back" /></a>
            </div>
			<div class="col-sm-4 pull-right">
				<p>Welcome, <%= session.getAttribute("sessionName") %>, <%= application.getAttribute("jumlahUserOnline") %> user(s) online</p>
            </div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">New Member</h1>
				<form action="controller/doAddMember.jsp" method="post" class="form-horizontal" enctype="multipart/form-data">
				<% if(session.getAttribute("errMsg")!=null){ /*Tampilkan pesan error*/ %>
					<div class="alert alert-danger text-center"><%= session.getAttribute("errMsg") %></div>
				<%
					request.getSession().removeAttribute("errMsg"); }
					if(session.getAttribute("msg")!=null){ //Tampilkan pesan berhasil
				%>
					<div class="alert alert-success text-center"><%= session.getAttribute("msg") %></div>
				<% request.getSession().removeAttribute("msg"); } %>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Name:
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="txtName" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Date of birth:
						</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="txtDob" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Gender:
						</label>
						<div class="col-sm-10">
							<label class="radio-inline"><input type="radio" name="radGender" value="Male" /> Male</label>
							<label class="radio-inline"><input type="radio" name="radGender" value="Female" /> Female</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Status:
						</label>
						<div class="col-sm-10">
							<label class="radio-inline"><input type="radio" name="radStatus" value="Single" /> Single</label>
							<label class="radio-inline"><input type="radio" name="radStatus" value="Married" /> Married</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Photo:
						</label>
						<div class="col-sm-10">
							<input type="file" name="filePhoto" accept=".jpg,.png" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" />
							<input type="reset" class="btn btn-danger" /></a>
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