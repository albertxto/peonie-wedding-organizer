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
		String query = "SELECT * FROM member WHERE member_id = '"+request.getParameter("id")+"'";
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit <%= rs.getString("member_name") %></title>
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
				<h1 class="page-header">Edit <%= rs.getString("member_name") %></h1>
				<form action="controller/doEditMember.jsp" method="post" class="form-horizontal" enctype="multipart/form-data">
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
							<input type="text" class="form-control" name="txtName" value="<%= rs.getString("member_name") %>" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Date of birth:
						</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="txtDob" value="<%= rs.getString("member_dob") %>" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Gender:
						</label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Male" <% if(rs.getString("member_gender")!=null){ if(rs.getString("member_gender").equals("Male")){ out.print("checked"); } } %> /> Male
							</label>
							<label class="radio-inline">
								<input type="radio" name="radGender" value="Female" <% if(rs.getString("member_gender")!=null){ if(rs.getString("member_gender").equals("Female")){ out.print("checked"); } } %> /> Female
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Status:
						</label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="radStatus" value="Single" <% if(rs.getString("member_status")!=null){ if(rs.getString("member_status").equals("Single")){ out.print("checked"); } } %> /> Single
							</label>
							<label class="radio-inline">
								<input type="radio" name="radStatus" value="Married" <% if(rs.getString("member_status")!=null){ if(rs.getString("member_status").equals("Married")){ out.print("checked"); } } %> /> Married
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Photo:
						</label>
						<div class="col-sm-10">
							<img src="img/<%= rs.getString("member_photo") %>" class="img-responsive" />
							<input type="file" name="filePhoto" accept=".jpg,.png" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" />
							<a href="member.jsp"><input type="button" class="btn btn-danger" value="Back" /></a>
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
			response.sendRedirect("member.jsp");
		}
	}
%>