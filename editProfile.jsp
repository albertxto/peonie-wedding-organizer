<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<%
	Integer active=6;
	if(session.getAttribute("sessionId")==null){
		response.sendRedirect("index.jsp");
	}
	else{
		String empId = (String)session.getAttribute("sessionId");
		String query = "SELECT * FROM employee WHERE emp_id = '"+empId+"'";
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
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
				<h1 class="page-header">Edit Profile</h1>
				<form action="controller/doEditProfile.jsp" method="post" class="form-horizontal" enctype="multipart/form-data">
				<% if(session.getAttribute("errMsg")!=null){ %>
					<div class="alert alert-danger text-center"><%= session.getAttribute("errMsg") %></div>
				<%
					request.getSession().removeAttribute("errMsg"); }
					if(session.getAttribute("msg")!=null){
				%>
					<div class="alert alert-success text-center"><%= session.getAttribute("msg") %></div>
				<% request.getSession().removeAttribute("msg"); } %>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Employee ID:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= session.getAttribute("sessionId") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Email:
						</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= rs.getString("emp_email") %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Name:
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="txtName" value="<%= rs.getString("emp_name") %>" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Date of Birth:
						</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="txtDob" value="<%= rs.getString("emp_dob") %>" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Gender:
						</label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Male" <% if(rs.getString("emp_gender")!=null){ if(rs.getString("emp_gender").equals("Male")){ out.print("checked"); } } %> /> Male
							</label>
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Female" <% if(rs.getString("emp_gender")!=null){ if(rs.getString("emp_gender").equals("Female")){ out.print("checked"); } } %> /> Female
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Password:
						</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="txtPass" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Confirm Password:
						</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="txtConfPass" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Photo:
						</label>
						<div class="col-sm-10">
							<img src="img/<%= rs.getString("emp_photo") %>" />
							<input type="file" name="filePhoto" accept=".jpg,.png" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" />
							<a href="index.jsp"><input type="button" class="btn btn-danger" value="Back" /></a>
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
			response.sendRedirect("index.jsp");
		}
	}
%>