<%@page import="com.entity.User"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BooksDaoimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook - index</title>
<%@include file="allcomponent/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/ebook.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}


</style>
</head>
<body style="background-color: #f7f7f7;">
	<c:if test="${not empty addcart }">
		<div id="toast">${addcart }</div>
		<c:remove var="addcart"/>
		<script type="text/javascript">
		showToast();
		function showToast(content) {
			$('#toast').addClass("display");
			$('#toast').html(content);
			setTimeout(() => {
				$("#toast").removeClass("display");
			}, 2000);
		}
		
		</script>
	</c:if>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">Ebook Management System</h2>

	</div>

	<!-- start recent book -->
	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			List<Bookdetails> list = dao.getrecentbooks();
			for (Bookdetails b : list) {
			%>
			<div class="col-lg-3 col-sm-12 col-md-6 mt-2 "
				style="margin-left: 0px">
				<div class="card crd-ho " style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p style="padding: 0px; margin-bottom: 5px">
							<b><%=b.getBookname().toUpperCase()%></b><br>
							<%=b.getAuthor().toUpperCase()%>
						</p>

						<p>
							Category:<%=b.getBookcategory().toUpperCase()%></p>
						<div class="row text-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a
								href="Cartservlet?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>&&pagename=index.jsp"
								class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>


							<a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success ml-1 btn-sm">View Details</a> <a href=""
								class="btn btn-danger ml-1 btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="allrecentbook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- end recent book -->
	<hr>
	<!-- start New book -->
	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<%
			BooksDaoimpl dao2 = new BooksDaoimpl(DBconnect.getcon());
			List<Bookdetails> list2 = dao2.getnewbook();
			for (Bookdetails b : list2) {
			%>
			<div class="col-lg-3 col-sm-12 col-md-6 mt-2 "
				style="margin-left: 0px">
				<div class="card crd-ho " style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p style="padding: 0px; margin-bottom: 5px">
							<b><%=b.getBookname().toUpperCase()%></b><br>
							<%=b.getAuthor().toUpperCase()%>
						</p>

						<p>
							Category:<%=b.getBookcategory().toUpperCase()%></p>
						<div class="row text-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a
								href="Cartservlet?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>&&pagename=index.jsp"
								class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>


							<a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success ml-1 btn-sm">View Details</a> <a href=""
								class="btn btn-danger ml-1 btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="allnewbook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- end New book -->
	<hr>
	<!-- start old book -->
	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			BooksDaoimpl dao3 = new BooksDaoimpl(DBconnect.getcon());
			List<Bookdetails> list3 = dao3.getoldbooks();
			for (Bookdetails b : list3) {
			%>
			<div class="col-lg-3 col-sm-12 col-md-6 mt-2 "
				style="margin-left: 0px">
				<div class="card crd-ho " style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p style="padding: 0px; margin-bottom: 5px">
							<b><%=b.getBookname().toUpperCase()%></b><br>
							<%=b.getAuthor().toUpperCase()%>
						</p>

						<p>
							Category:<%=b.getBookcategory().toUpperCase()%></p>
						<div class="row text-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a
								href="Cartservlet?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>&&pagename=index.jsp"
								class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>

							<a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success ml-1 btn-sm">View Details</a> <a href=""
								class="btn btn-danger ml-1 btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="alloldbook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- end old book -->
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>