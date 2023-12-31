<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Settings</title>
<%@include file="allcomponent/allcss.jsp"%>
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
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="allcomponent/navbar.jsp"%>

	<div class="contianer">

		<h3 class="text-center">Hello, ${userobj.name }</h3>

		<div class="row p-5">
			<div class="col-md-4 mt-3">
				<a href="sellbook.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="oldbook.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="editprofile.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>

			
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card mt-2">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track your order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card mt-2">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 service</p>
						</div>
					</div>
				</a>
			</div>
		</div>

	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>