<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	if(session.getAttribute("sessionId")!=null){
		response.sendRedirect("index.jsp");
	}
	Integer active=5;
%>
<!DOCTYPE html>
<html>
<head>
	<title>Log In</title>
    <%@ include file="link.jsp" %>
</head>

<body>

    <%@ include file="header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Log In</h1>
				
                <form action="controller/doLogin.jsp" method="post">
                    <div class="form-group">
						<label>Employee ID:</label>
						<input type="text" class="form-control" name="txtId" autofocus/>
                    </div>
                    <div class="form-group">
						<label>Password:</label>
						<input type="password" class="form-control" name="txtPass" />
                    </div>
					<div class="form-group">
						<label style="font-weight:normal"><input type="checkbox" name="chkRmb" /> Remember Me</label>
					</div>
                    <div class="form-group">
	                    <input type="submit" class="btn btn-primary btn-block" value="Sign In" />
                    </div>
                </form>
				<% if(session.getAttribute("errMsg")!=null){ %>
					<div class="alert alert-danger"><%= session.getAttribute("errMsg") %></div>
				<% request.getSession().removeAttribute("errMsg"); } %>
            </div>
        </div>
		
        <hr>
		
        <%@ include file="footer.jsp" %>
		
    </div>

    <%@ include file="script.jsp" %>
</body>
</html>