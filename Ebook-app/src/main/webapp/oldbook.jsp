<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.BooksDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>
<meta charset="ISO-8859-1">
<title>${userobj.name }:oldbook</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>

	<%@include file="allcomponent/navbar.jsp"%>
	<c:if test="${not empty succmsg1 }">
		<p class="text-center text-success">${succmsg1}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedmsg1}">
		<p class="text-center text-danger">${failedmsg1}</p>
		<c:remove var="failedmsg" scope="session" />
	</c:if>
	<div class="container p-1">
		<h3 class="text-center text-primary">Your Orders</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
				List<Bookdetails> list = dao.getoldbookbyuid(email, "old");
				for (Bookdetails b : list) {
				%>
				<tr>
					<th><%=b.getBookname().toUpperCase()%></th>
					<td><%=b.getAuthor().toUpperCase()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookcategory().toUpperCase()%></td>
					<td><a href="DeleteOldBook?id=<%=b.getBookid()%>"
						class="btn btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>