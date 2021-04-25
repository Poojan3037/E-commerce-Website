
<%@page import="com.farmToMart.entity.Category"%>
<%@page import="com.farmToMart.Dao.CategoryDao"%>
<%@page import="com.farmToMart.helper.Factory"%>
<%@page import="com.farmToMart.Dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.farmToMart.entity.Product"%>
<%@page import="com.farmToMart.helper.Helper"%>
<%@page import="com.farmToMart.entity.User"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	session.setAttribute("msg", "You are not logged in ....");
	response.sendRedirect("login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>CheckOut</title>

<!--
	/// ----css js bootstrap ----/// 
 -->
<%@ include file="components/bootstrap_css_js.jsp"%>

</head>
<body>
	<!--
	///---- navbar----///
 -->
	<%@ include file="components/navbar.jsp"%>

	<div class="container mt-5">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h4 class="text-center mb-3 mt-3">Your Products</h4>
						</div>
						<div class="card-body">
							<table class="table  table-container2">

							</table>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h4 class="text-center mb-3 mt-3">Your Details For Order</h4>
						</div>
						<div class="card-body">
						
						<%
							if(user!=null){
						%>

							<div class="mb-3">
								<label for="userName" class="form-label">Your Name</label> <input
									type="text" class="form-control" id="userName" name="userName"
									readonly="readonly" value="<%=user.getUserName()%>">
							</div>
							<div class="mb-3">
								<label for="userEmail" class="form-label">Your Email</label> <input
									type="email" class="form-control" id="userEmail"
									name="userEmail" readonly="readonly"
									value="<%=user.getUserEmail()%>">
							</div>
							<div class="mb-3">
								<label for="userPhone" class="form-label">Your Phone</label> <input
									type="number" class="form-control" id="userPhone"
									name="userPhone" readonly="readonly"
									value="<%=user.getUserPhone()%>">
							</div>
							<div class="mb-3">
								<label for="userAdd" class="form-label">Your Shipping Address</label>
								<textarea class="form-control" rows="4" id="userAdd"
									placeholder="Enter Address" name="userAddress"></textarea>
							</div>
							<div class="mb-3 text-center">
								<button type="button" class="sbt-btn" onclick="order(<%= user.getUserid() %>,'<%= user.getUserName()%>','<%= user.getUserEmail() %>','<%= user.getUserPhone() %>')">Order Now</button>
							</div>
							
							<div id="od" style="display:none">
							</div>
						<%
							}
						%>
						</div>
					</div>
				</div>
			</div>
	</div>


	<script type="text/javascript" src="js/checkout.js"></script>
	<script type="text/javascript" src="js/order.js"></script>

</body>
</html>