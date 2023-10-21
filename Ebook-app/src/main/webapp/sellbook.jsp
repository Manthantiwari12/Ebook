<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-12">
				<div class="card mt-2 p-2">
					<div class="card-body">
						<h5 class="text-center text-primary p1">Sell Old Book</h5>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<form action="addoldbooks" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${userobj.email }" name="usermail">
							<div class="form-group">
								<label for="exampleInputbookname">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputbookname"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									name="bname">

							</div>

							<div class="form-group">
								<label for="exampleInputauthorname">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputauthorname"
									aria-describedby="emailHelp" placeholder="Enter Author Name"
									name="author">

							</div>
							<div class="form-group">
								<label for="exampleInputbookprice">Price*</label> <input
									type="number" class="form-control" id="exampleInputbookprice"
									aria-describedby="emailHelp" placeholder="Enter Price"
									name="price">

							</div>

							<div class="form-group">
								<label for="exampleInputbimg">Upload Photo*</label> <input
									type="file" class="form-control-file" id="exampleInputbimg"
									aria-describedby="emailHelp" placeholder="Upload photo"
									name="photo">

							</div>

							<button type="submit" class="btn btn-primary">Sell</button>
							<a href="setting.jsp" class="btn btn-primary ">Back</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>