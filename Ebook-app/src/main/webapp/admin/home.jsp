<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center p-1">Hello Admin</h3>
	<div class="container mt-1">
		<div class="row p-5">
			<div class="col-lg-3 col-md-6 col-12">
				<a href="addbooks.jsp">
					<div class="card mt-1">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i>
							<h4>Add Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-3 col-md-6 col-12">
				<a href="allbooks.jsp">
					<div class="card mt-1">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-danger"></i>
							<h4>All Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-3 col-md-6 col-12">
				<a href="order.jsp">
					<div class="card mt-1">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i>
							<h4>Order</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-3 col-md-6 col-12">
				<a href="../Logoutservlet" data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card mt-1">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i>
							<h4>Log out</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- logout modal -->

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>Do you want to logout?</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a type="button" href="../Logoutservlet"
						class="btn btn-primary text-white">Logout</a>
				</div>

			</div>
		</div>
	</div>

	<!-- end logout modal -->
	<div style="margin-top: 200px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>