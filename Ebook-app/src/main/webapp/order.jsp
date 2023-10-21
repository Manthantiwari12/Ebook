<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.Bookorderdaoimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Book</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container p-1">
		<h3 class="text-center text-primary">Your Orders</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			<%
			User u = (User)session.getAttribute("userobj");
			Bookorderdaoimpl dao = new Bookorderdaoimpl(DBconnect.getcon());
			List<Book_order> list = dao.getorder(u.getId());
			for(Book_order b:list){
			%>
				<tr>
					<th scope="row"><%=b.getOrderid() %></th>
					<td><%=b.getUsername() %></td>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaytype() %></td>
				</tr>
			<%} %>	
			</tbody>
		</table>
	</div>
	
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>