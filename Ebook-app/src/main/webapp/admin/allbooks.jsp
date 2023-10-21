<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
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
<title>Admin: All Books</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center">Hello Admin</h3>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			List<Bookdetails> list = dao.getallbooks();
			for (Bookdetails b : list) {
			%>
			<tr>
				<td><%=b.getBookid()%></td>
				<td><img alt="" src="../book/<%=b.getPhoto()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookcategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="editbooks.jsp?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
					<a href="../delete?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>
						Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<%@include file="footer.jsp"%>
</body>
</html>