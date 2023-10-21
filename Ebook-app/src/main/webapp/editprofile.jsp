<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>
<title>${userobj.name }:Edit Profile</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-12">
				
				<div class="card mt-2 p-2">
					
					<div class="card-body">
						<h4 class="text-center text-primary p-1">Edit Profile</h4>
						<c:if test="${not empty updated }">
							<p class="text-center text-success">${updated}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty updatefailed}">
							<p class="text-center text-danger">${updatefailed}</p>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<form action="Updateuserprofile" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="exampleInputName">Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									aria-describedby="emailHelp" placeholder="Enter Full Name"
									required="required" name="fname" value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Email"
									required="required" name="email" value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputnumber">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputnumber"
									aria-describedby="emailHelp" placeholder="Enter Phone Number"
									required="required" name="phno" value="${userobj.phno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password" value="${userobj.password}">
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
							<a href="setting.jsp" class="btn btn-primary">Back</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>