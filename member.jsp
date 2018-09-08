<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date" import="java.text.*" %>
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
	<title>Member</title>
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
                <h1 class="page-header">Member</h1>
            </div>
		</div>
		<div class="row">
		<% if(session.getAttribute("sessionId")!=null){ %>
			<div class="col-sm-3 form-group">
				<a href="addMember.jsp"><button class="btn btn-primary">Insert new member</button></a>
			</div>
		<% } %>
			<div class="col-lg-4 form-group pull-right">
				<form class="form-inline" action="member.jsp" method="get">
					<div class="input-group">
						<input type="text" class="form-control" name="search" value="<% if(request.getParameter("search")!=null){ out.print(request.getParameter("search")); } %>" placeholder="Member Name" />
						<span class="input-group-btn"><input type="submit" class="btn btn-primary" value="Search" /></span>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
<%
	//Penjelasan awal sama seperti di hall.jsp
	String query = "SELECT * FROM member";
	String search = request.getParameter("search");
	if(search!=null){
		query += " WHERE member_name LIKE '%"+search+"%'";
	}
	query += " ORDER BY member_id DESC";
	ResultSet rs = st.executeQuery(query);
	rs.last();
	Integer totalData = rs.getRow();
	Integer dataPerPage = 3; //Member menampilkan tiga data per halaman
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
		//Menghitung umur member
		Date date = new Date();
		String thisYear = new SimpleDateFormat("yyyy").format(date); //Tahun sekarang
		String memberYear = new SimpleDateFormat("yyyy").format(rs.getDate("member_dob")); //Tahun lahir member
		String thisMonth = new SimpleDateFormat("MM").format(date); //Bulan sekarang
		String memberMonth = new SimpleDateFormat("MM").format(rs.getDate("member_dob")); //Bulan lahir member
		String thisDate = new SimpleDateFormat("dd").format(date); //Tanggal sekarang
		String memberDate = new SimpleDateFormat("dd").format(rs.getDate("member_dob")); //Bulan lahir member
		Integer age = Integer.parseInt(thisYear) - Integer.parseInt(memberYear); //Umur sama dengan tahun sekarang dikurang tahun lahir member
		if(Integer.parseInt(memberMonth) > Integer.parseInt(thisMonth)){ //Apabila bulan lahir member > bulan sekarang, maka umur - 1 (belum ulang tahun)
			age--;
		}
		else if(Integer.parseInt(memberMonth)==Integer.parseInt(thisMonth)){ //Apabila bulan lahir member sama dengan bulan sekarang, cek tanggal lahir member
			if(Integer.parseInt(memberDate)>Integer.parseInt(thisDate)){ //Apabila tanggal lahir member > tanggal sekarang, maka umur - 1 (belum ulang tahun)
				age--;
			}
		}
		if(age<0) age = 0; //Apabila umur bernilai negatif, umur jadi 0
%>
			<div class="col-sm-4 form-group">
				<img class="img-responsive" src="img/<%= rs.getString("member_photo") %>" alt="<%= rs.getString("member_photo") %>">
				<h3><%= rs.getString("member_name") %></h3>
				<p><%= age %> years</p>
				<p><%= rs.getString("member_status") %> | <%= rs.getString("member_gender") %></p>
			<% if(session.getAttribute("sessionId")!=null){ %>
				<a href="editMember.jsp?id=<%= rs.getString("member_id") %>"><button class="btn btn-success">Update</button></a>
				<a href="deleteMember.jsp?id=<%= rs.getString("member_id") %>"><button class="btn btn-danger">Delete</button></a>
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