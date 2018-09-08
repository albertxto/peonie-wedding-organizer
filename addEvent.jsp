<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<%
	if(session.getAttribute("sessionId")==null){
		response.sendRedirect("event.jsp");
	}
	Integer active=4;
%>
<!DOCTYPE html>
<html>
<head>
	<title>New Wedding Event</title>
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
				<h1 class="page-header">New Wedding Event</h1>
				<form action="controller/doAddEvent.jsp" method="post" class="form-horizontal">
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
							Groom Name:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="selGroom">
								<option value="none">Select Groom</option>
							<%
								String groom = "SELECT * FROM member WHERE member_gender = 'Male' AND member_status = 'Single' ORDER BY member_name";
								ResultSet rsGroom = st.executeQuery(groom);
								while(rsGroom.next()){
							%>
								<option><%= rsGroom.getString("member_name") %></option>
							<%
								}
							%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Bride Name:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="selBride">
								<option value="none">Select Bride</option>
							<%
								String bride = "SELECT * FROM member WHERE member_gender = 'Female' AND member_status = 'Single' ORDER BY member_name";
								ResultSet rsBride = st.executeQuery(bride);
								while(rsBride.next()){
							%>
								<option><%= rsBride.getString("member_name") %></option>
							<%
								}
							%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Wedding Hall:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="selHall">
								<option value="none">Select Hall</option>
							<%
								String hall = "SELECT * FROM hall ORDER BY hall_name";
								ResultSet rsHall = st.executeQuery(hall);
								while(rsHall.next()){
							%>
								<option><%= rsHall.getString("hall_name") %></option>
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
							<input type="date" class="form-control" name="txtDate" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Decoration 1:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="selDec1">
								<option>No Decoration</option>
							<%
								String dec1 = "SELECT * FROM decoration ORDER BY dec_name";
								ResultSet rsDec1 = st.executeQuery(dec1);
								while(rsDec1.next()){
							%>
								<option><%= rsDec1.getString("dec_name") %></option>
							<%
								}
							%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Decoration 2:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="selDec2">
								<option>No Decoration</option>
							<%
								String dec2 = "SELECT * FROM decoration ORDER BY dec_name";
								ResultSet rsDec2 = st.executeQuery(dec2);
								while(rsDec2.next()){
							%>
								<option><%= rsDec2.getString("dec_name") %></option>
							<%
								}
							%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">
							Decoration 3:
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="selDec3">
								<option>No Decoration</option>
							<%
								String dec3 = "SELECT * FROM decoration ORDER BY dec_name";
								ResultSet rsDec3 = st.executeQuery(dec3);
								while(rsDec3.next()){
							%>
								<option><%= rsDec3.getString("dec_name") %></option>
							<%
								}
							%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" />
							<a href="event.jsp"><input type="button" class="btn btn-danger" value="Back" /></a>
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