
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
<title>normalUser</title>

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

	<!--
	///---- msg----///
 -->
	<div class="container mt-3 ">
		<%@ include file="components/message.jsp"%>
	</div>


	<!--
	///---- msg for product added to cart----///
 -->

	<div class="container mt-3" id="addedToCart"></div>


	<!--
	////---------Main Page------//// 
    -->

	<div class="container-fluid mt-3">
		<div class="row">

			<!-- 
				////------Category-------/////
			 -->

			<div class="col-md-2 mt-3">

				<div class="list-group">
					<a href="index.jsp?categoryId=-1"
						class="list-group-item list-group-item-action background-primary text-white"
						aria-current="true"> All Products</a>
					<%
					CategoryDao dao1 = new CategoryDao(Factory.getFactory());
					List<Category> cat = dao1.getAllCategeroy();

					for (Category category : cat) {
					%>
					<a href="index.jsp?categoryId=
						<%=category.getCatId()%>"
						class="list-group-item list-group-item-action"><%=category.getCatTitle()%></a>
					<%
					}
					%>
				</div>


			</div>


			<!--
				////--------Products-------//// 
			 -->

			<div class="col-md-9">
				<div class="row">
					<%
					ProductDao dao2 = new ProductDao(Factory.getFactory());

					String id = request.getParameter("categoryId");

					List<Product> list = null;
					if (id == null) {
						list = dao2.getAllProduct();
					} else if (id.equals("-1")) {
						list = dao2.getAllProduct();
					} else {
						int id2 = Integer.parseInt(id);
						list = dao2.getProductByCategoryId(id2);
					}

					for (Product product : list) {
					%>
					<div class="col-md-4 mt-3">
						<div class="card">
							<div class="container text-center mt-2">
								<img src="pic/products/<%=product.getpPhoto()%>"
									class="card-img-top" alt="..."
									style="width: 200px; height: 200px">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=product.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(product.getpDesc())%></p>

							</div>
							<div class="card-footer text-center">
								<button class="btn background-primary text-white"
									onclick="addToCart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getpPrice()%>,<%=product.getDiscountPrice()%>)">Add
									to cart</button>
								<button class="btn btn-outline-success">
									&#8377;<%=product.getDiscountPrice()%>/- <span
										style="font-size: 12px; font-style: italic">&#8377;<%=product.getpPrice()%>
										, <%=product.getpDiscount()%> %off
									</span>
								</button>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>







</body>
</html>