<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-12">
				<div class="card mt-3 mb-2">
					<div class="card-body ">
						<h4 class="text-center">Add Books</h4>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<form action="../booksadd" method="post"
							enctype="multipart/form-data">
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
								<label for="exampleInputcategerios">Book Categories*</label> <select
									id="exampleInputcategerios" class="form-control" name="btype">
									<option selected="selected">--select--</option>
									<option value="new">New Book</option>
								</select>

							</div>
							<div class="form-group">
								<label for="exampleInputstatus">Book Status*</label> <select
									id="exampleInputstatus" name="bstatus" class="form-control">
									<option selected="selected">--select--</option>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
								</select>

							</div>
							<div class="form-group">
								<label for="exampleInputbimg">Upload Photo*</label> <input
									type="file" class="form-control-file" id="exampleInputbimg"
									aria-describedby="emailHelp" placeholder="Upload photo"
									name="photo">

							</div>

							<button type="submit" class="btn btn-primary">Add</button>
							<a href="home.jsp" class="btn btn-primary ">Back</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>