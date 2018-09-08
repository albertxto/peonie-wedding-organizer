<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.lang.*" errorPage="" %>
<%@ include file="controller/connect.jsp" %>
<% Integer active=2; %>
<!DOCTYPE html>
<html>
<head>
	<title>Wedding Hall</title>
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
                <h1 class="page-header">Wedding Hall</h1>
            </div>
		</div>
		<div class="row">
		<% if(session.getAttribute("sessionId")!=null){ %>
			<div class="col-sm-3 form-group">
				<a href="addHall.jsp"><button class="btn btn-primary">New wedding hall</button></a>
			</div>
		<% } %>
			<div class="col-lg-4 form-group pull-right">
				<form class="form-inline" action="hall.jsp" method="get">
					<div class="input-group">
						<input type="text" class="form-control" name="search" value="<% if(request.getParameter("search")!=null){ out.print(request.getParameter("search")); } %>" placeholder="Wedding Hall Name" />
						<span class="input-group-btn"><input type="submit" class="btn btn-primary" value="Search" /></span>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
<%
	String query = "SELECT * FROM hall";
	String search = request.getParameter("search");
	if(search!=null){ //Apabila ada get parameter search, tambahkan query
		query += " WHERE hall_name LIKE '%"+search+"%'";
	}
	query += " ORDER BY hall_id DESC";
	ResultSet rs = st.executeQuery(query);
	rs.last();
	Integer totalData = rs.getRow(); //Ambil total data setelah menjalankan query
	Integer dataPerPage = 6; //Jumlah data per page
	//Total page berasal dari total data dibagi data per page apabila total data merupakan kelipatan dari data per page, dan total data dibagi data per page tambah satu apabila total data bukan kelipatan dari data per page
	Integer totalPage = (totalData%dataPerPage==0) ? totalData/dataPerPage : totalData/dataPerPage+1;
	Integer currPage = 1; //Halaman sekarang bernilai satu
	if(request.getParameter("page")!=null){ //Apabila ada get parameter page di url, maka halaman sekarang merupakan halaman dari get parameter page di url
		currPage = Integer.parseInt(request.getParameter("page"));
	}
	Integer limitStart = (currPage-1)*dataPerPage; //Limit start berasal dari halaman sekarang dikurang satu lalu dikali data per page
	query += " LIMIT " + limitStart + "," + dataPerPage; //Query limit (data diambil mulai dari limitStart), (jumlah data yang diambil sebanyak data per page)
	rs = st.executeQuery(query);
	rs.beforeFirst();
	for(int i=0; i<dataPerPage && rs.next(); i++){ //Looping untuk menampilkan semua data dari query yang sudah dibuat
%>
			<div class="col-sm-4 form-group">
				<img class="img-responsive img-height" src="img/<%= rs.getString("hall_image") %>" alt="<%= rs.getString("hall_image") %>">
				<h3><%= rs.getString("hall_name") %></h3>
				<p><%= rs.getString("hall_description") %></p>
			<% if(session.getAttribute("sessionId")!=null){ %>
				<a href="editHall.jsp?id=<%= rs.getString("hall_id") %>"><button class="btn btn-success">Update</button></a>
				<a href="deleteHall.jsp?id=<%= rs.getString("hall_id") %>"><button class="btn btn-danger">Delete</button></a>
			<% } %>
			</div>
<% } %>
		</div>
<% if(totalData>0){ /*Apabila total data lebih dari nol, maka tampilkan pagination*/ %>
		<hr>
		<div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
				<% if(currPage>1){ /*Apabila halaman sekarang bukan halaman pertama, tampilkan panah kiri utk ke halaman sebelumnya*/ %>
					<li><a href="?page=<%=currPage-1%><%=(search!=null)?"&search="+search:""%>">&laquo;</a></li>
				<%
					}
					for(int i=0;i<totalPage;i++){ //Looping untuk menampilkan nomor paging sebanyak total halaman
						if(i==currPage-1){ //Apabila nomor paging sama dengan halaman sekarang, maka nomor paging active
				%>
					<li class="active"><a href="#"><%=i+1%></a></li>
				<%
						}else{ //Apabila nomor paging bukan halaman sekarang, maka tampilkan link sesuai looping
				%>
					<li><a href="?page=<%=i+1%><%=(search!=null)?"&search="+search:""%>"><%=i+1%></a></li>
				<%
						}
					}
					if(currPage!=totalPage){ //Apabila halaman sekarang bukan halaman terakhir, tampilkan panah kanan untuk ke halaman berikutnya
				%>
					<li><a href="?page=<%=currPage+1%><%=(search!=null)?"&search="+search:""%>">&raquo;</a></li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
<% }else{ /*Apabila tidak ada data, maka tampilkan pesan*/ %>
	<h1 class="text-center"><span class="label label-danger">No Data Found!</span></h1>
<% } %>
		<%@ include file="footer.jsp" %>
	</div>
	<%@ include file="script.jsp" %>
</body>
</html>