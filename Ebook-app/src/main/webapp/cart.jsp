<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.Cartdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="allcomponent/allcss.jsp"%>
<title>E-Book: Cart</title>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="allcomponent/navbar.jsp"%>

	<c:if test="${not empty succmsg }">
		<div class="alert alert-success text-center" role="alert">${succmsg }</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedmsg }">
		<div class="alert alert-danger text-center" role="alert">${failedmsg }</div>
			<c:remove var="failedmsg" scope="session" />
	</c:if>
	<c:if test="${not empty msg1 }">
		<div class="alert alert-danger text-center" role="alert">${msg1 }</div>
			<c:remove var="msg1" scope="session" />
	</c:if>
	
	

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");
								Cartdaoimpl dao = new Cartdaoimpl(DBconnect.getcon());
								List<Cart> list = dao.getbookbyuser(u.getId());
								double totalprice = 0;
								for (Cart c : list) {
									totalprice += c.getTotalprice();
								%>
								<tr>
									<th scope="row"><%=c.getBookname()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="Removebook?cid=<%=c.getCid() %>&&uid=<%=c.getUid() %>"
										class="btn btn-sm btn-danger">Remove </a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalprice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="Orderservlet" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" placeholder="Name" value="<%=u.getName() %>" name="name" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email"
										class="form-control" id="inputEmail4" placeholder="Email" value="<%=u.getEmail() %>" name="email" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="phno">Phone No.</label> <input type="number"
										class="form-control" id="phno" placeholder="Phone No." value="<%=u.getPhno() %>" name="phno" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" placeholder="Address" name="address" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark" placeholder="Landmark" name="landmark" >
								</div>
								<div class="form-group col-md-6">
									<label for="city">City</label> <input type="text"
										class="form-control" id="city" placeholder="City" name="city" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" placeholder="State" name="state" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="zip">Zip</label> <input type="text"
										class="form-control" id="zip" placeholder="Zip" name="zip" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="paytype">Payment Type</label> <select
									class="form-control" name="paytype" id="paytype">
									<option value="noselect">--Select--</option>
									<option value="cod">Cash on Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-success">Order Now</button>
								<a href="index.jsp" class="btn btn-warning">Continue Shoping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>