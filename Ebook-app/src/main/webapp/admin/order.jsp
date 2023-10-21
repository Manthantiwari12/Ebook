<%@page import="java.util.List"%>
<%@page import="com.entity.Book_order"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.Bookorderdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>

	<table class="table table-striped mt-3">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone no</th>
				<th scope="col">Address</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Mode</th>
			</tr>
		</thead>
		<tbody>
			<%
			Bookorderdaoimpl dao = new Bookorderdaoimpl(DBconnect.getcon());
			List<Book_order> list = dao.getallorder();
			for (Book_order b : list) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderid()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getFulladdress()%></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaytype()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%@include file="footer.jsp"%>
</body>
</html>