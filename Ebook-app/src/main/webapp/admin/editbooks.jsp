<%@page import="com.entity.Bookdetails"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.BooksDaoimpl"%>
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
	<div class="container">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-12">
				<div class="card mt-3 mb-2">
					<div class="card-body ">
						<h4 class="text-center">Edit Books</h4>

						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
						Bookdetails b = dao.getbookbyid(id);
						%>
						<form action="../Editbookservlet" method="post">
							<input type="hidden" name="id" value="<%=b.getBookid()%>">
							<div class="form-group">
								<label for="exampleInputbookname">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputbookname"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									name="bname" value="<%=b.getBookname()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputauthorname">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputauthorname"
									aria-describedby="emailHelp" placeholder="Enter Author Name"
									name="author" value="<%=b.getAuthor()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputbookprice">Price*</label> <input
									type="number" class="form-control" id="exampleInputbookprice"
									aria-describedby="emailHelp" placeholder="Enter Price"
									name="price" value="<%=b.getPrice()%>">

							</div>

							<div class="form-group">
								<label for="exampleInputstatus">Book Status*</label> <select
									id="exampleInputstatus" name="bstatus" class="form-control">
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>

								</select>

							</div>


							<button type="submit" class="btn btn-primary">Update</button>
							<a href="allbooks.jsp" class="btn btn-primary ">Back</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>