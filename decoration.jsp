<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<% Integer active=3; %>
<!DOCTYPE html>
<html>
<head>
	<title>Decoration</title>
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Decoration</h1>
            </div>
		</div>
		<div class="row">
	<% if(session.getAttribute("sessionId")!=null){ %>
			<div class="col-sm-3 form-group">
				<a href="addDecoration.jsp"><button class="btn btn-primary">New decoration</button></a>
			</div>
	<% } %>
			<div class="col-lg-4 form-group pull-right">
				<form class="form-inline" action="decoration.jsp" method="get">
					<div class="input-group">
						<input type="text" class="form-control" name="search" value="<% if(request.getParameter("search")!=null){ out.print(request.getParameter("search")); } %>" placeholder="Decoration Name" />
						<span class="input-group-btn"><input type="submit" class="btn btn-primary" value="Search" /></span>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
<%
	//Penjelasannya sama seperti di hall.jsp
	String query = "SELECT * FROM decoration";
	String search = request.getParameter("search");
	if(search!=null){
		query += " WHERE dec_name LIKE '%"+search+"%'";
	}
	query += " ORDER BY dec_id DESC";
	ResultSet rs = st.executeQuery(query);
	rs.last();
	Integer totalData = rs.getRow();
	Integer dataPerPage = 6;
	Integer totalPage = (totalData%dataPerPage==0) ? totalData/dataPerPage : totalData/dataPerPage+1;
	Integer currPage = 1;
	if(request.getParameter("page")!=null){
		currPage = Integer.parseInt(request.getParameter("page"));
	}
	Integer limitStart = (currPage-1)*dataPerPage;
	query += " LIMIT " + limitStart + "," + dataPerPage;
	rs = st.executeQuery(query);
	rs.beforeFirst();
	for(int i=0; i<dataPerPage && rs.next(); i++){
%>
	<div class="col-sm-4 form-group">
				<img class="img-responsive" src="img/<%= rs.getString("dec_image") %>" alt="<%= rs.getString("dec_image") %>">
				<h3><%= rs.getString("dec_name") %></h3>
				<p><%= rs.getString("dec_description") %></p>
			<% if(session.getAttribute("sessionId")!=null){ %>
				<a href="editDecoration.jsp?id=<%= rs.getString("dec_id") %>"><button class="btn btn-success">Update</button></a>
				<a href="deleteDecoration.jsp?id=<%= rs.getString("dec_id") %>"><button class="btn btn-danger">Delete</button></a>
			<% } %>
			</div>
<% } %>
		</div>
		
<% if(totalData>0){ //Penjelasan paging sama seperti di hall.jsp %>
		<hr>
		<div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
				<%
					if(currPage>1){
				%>
					<li><a href="?page=<%=currPage-1%><%=(search!=null)?"&search="+search:""%>">&laquo;</a></li>
				<%
					}
					for(int i=0;i<totalPage;i++){
						if(i==currPage-1){
				%>
					<li class="active"><a href="#"><%=i+1%></a></li>
				<%
						}else{
				%>
					<li><a href="?page=<%=i+1%><%=(search!=null)?"&search="+search:""%>"><%=i+1%></a></li>
				<%
						}
					}
					if(currPage!=totalPage){
				%>
					<li><a href="?page=<%=currPage+1%><%=(search!=null)?"&search="+search:""%>">&raquo;</a></li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
<% }else{ %>
		<h1 class="text-center"><span class="label label-danger">No Data Found!</span></h1>
<% } %>
		<%@ include file="footer.jsp" %>
	</div>
	<%@ include file="script.jsp" %>
</body>
</html>