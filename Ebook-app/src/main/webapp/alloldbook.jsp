<%@page import="com.entity.User"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.BooksDaoimpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Bookdetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}


</style>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<c:if test="${not empty addcart }">
		<div id="toast">${addcart }</div>
		<c:remove var="addcart"/>
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
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid">
		<h3 class="text-center">Old Books</h3>
		<hr>
		<div class="row p-3">
			<%
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			List<Bookdetails> list = dao.getalloldbook();
			for (Bookdetails b : list) {
			%>
			<div class="col-lg-3 col-sm-12 col-md-6  " style="margin-left: 0px">
				<div class="card crd-ho mt-2" style="width: 270px">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p style="padding: 0px; margin-bottom: 5px">
							<b><%=b.getBookname().toUpperCase()%></b><br>
							<%=b.getAuthor().toUpperCase()%>
						</p>

						<p>
							Category:<%=b.getBookcategory().toUpperCase()%></p>
						<div class="row text-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a
								href="Cartservlet?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>&&pagename=alloldbook.jsp"
								class="btn btn-danger ml-1 btn-sm"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>

							<a href="viewbook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success ml-1 btn-sm">View Details</a> <a
								href="" class="btn btn-danger ml-1 btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>