<%@page import="com.entity.User"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.BooksDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int id = Integer.parseInt(request.getParameter("bid"));
BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
Bookdetails b = dao.getbookbyid(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book: <%=b.getBookname()%></title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="allcomponent/navbar.jsp"%>
	<c:if test="${not empty addcart }">
		<div id="toast">${addcart }</div>
		<c:remove var="addcart" />
		<script type="text/javascript">
		showToast();
		function showToast(content) {
			$('#toast').addClass("display");
			$('#toast').html(content);
			setTimeout(() => {
				$("#toast").removeClass("display");
			}, 2000);
		}
		
		</script>
	</c:if>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book/<%=b.getPhoto()%>"
					style="height: 200px; width: 150px;">
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookname().toUpperCase()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor().toUpperCase()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookcategory().toUpperCase()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname().toUpperCase()%></h2>
				<div class="row mt-2">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<div class="text-center p-3">
					<%
					if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-primary ml-1 btn-sm"><i
						class="fas fa-cart-plus"></i> Add Cart</a>
					<%
					} else {
					%>
					<a
						href="Cartservlet?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>&&pagename=index.jsp"
						class="btn btn-primary ml-1 btn-sm"><i class="fas fa-cart-plus"></i>
						Add Cart</a>
					<%
					}
					%>
					<a href="" class="btn btn-danger"><i
						class="fas fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>