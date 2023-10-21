<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4 col-12 ">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center">Registration Page</h5>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedmsg}">
							<p class="text-center text-danger">${failedmsg}</p>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputName">Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									aria-describedby="emailHelp" placeholder="Enter Full Name"
									required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputnumber">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputnumber"
									aria-describedby="emailHelp" placeholder="Enter Phone Number"
									required="required" name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and condition</label>
							</div>
							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>