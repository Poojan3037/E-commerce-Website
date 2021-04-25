
<%@page import="com.farmToMart.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.farmToMart.helper.Factory"%>
<%@page import="com.farmToMart.Dao.CategoryDao"%>
<%@page import="com.farmToMart.entity.User"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	session.setAttribute("msg", "You are not logged in ....");
	response.sendRedirect("login.jsp");
} else {
	if (user.getRole().equals("normal")) {
		session.setAttribute("msg", "You are not logged in ....");
		response.sendRedirect("login.jsp");
	}
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
<title>admin</title>

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




<div class="container mt-3 ">
	<%@ include file="components/message.jsp" %>
</div>




	<!--
	///-----cards-----//// 
 -->
	<div class="container mt-4 admin">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" alt="" src="pic/seo-and-web.png"
								class="img-fluid rounded-circle">
						</div>
						
						<h2>5</h2>
						<h2 class="text-uppercase text-muted ">Users</h2>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" alt="" src="pic/list.png"
								class="img-fluid rounded-circle">
						</div>
						<h2>5</h2>
						<h2 class="text-uppercase text-muted ">Categories</h2>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" alt="" src="pic/product.png"
								class="img-fluid rounded-circle">
						</div>
						<h2>23</h2>
						<h2 class="text-uppercase text-muted ">Products</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container mt-5 admin">
		<div class="row">
			<div class="col-md-6">
				<div class="card " data-bs-toggle="modal"
					data-bs-target="#categoryModal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" alt="" src="pic/keys.png"
								class="img-fluid rounded-circle">
						</div>
						<p class="mt-3">Click here to add new Category</p>
						<h2 class="text-uppercase text-muted ">add category</h2>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#productModal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" alt="" src="pic/plus.png"
								class="img-fluid rounded-circle">
						</div>
						<p class="mt-3">Click here to add new Product</p>
						<h2 class="text-uppercase text-muted ">add Product</h2>
					</div>
				</div>
			</div>
		</div>
	</div>






	<!-- 
	////---category modal-----/////
 -->

	<div class="modal fade" id="categoryModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header background-primary text-white">
					<h5 class="modal-title " id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="AddCategoryServlet">
						<div class="mb-3">
							<input type="text" class="form-control" id="catTitle"
								name="catTitle" placeholder="Enter category title">
						</div>
						<div class="mb-3">
							<textarea class="form-control" rows="8"
								placeholder="Enter category description" name="catDetail"></textarea>
						</div>
						<div class="mb-3 text-center">
							<button type="submit" class="sbt-btn">Add Category</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>







	<!--
 	////----product modal-----///// 
  -->
	<div class="modal fade" id="productModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header background-primary text-white">
					<h5 class="modal-title" id="exampleModalLabel">Product details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="AddProduct" method="post" enctype="multipart/form-data">
						<div class="mb-3">
							<input type="text" class="form-control" id="proTitle"
								name="proTitle" placeholder="Enter title of product">
						</div>
						<div class="mb-3">
							<textarea class="form-control" rows="5"
								placeholder="Enter product description" name="proDetail"></textarea>
						</div>
						<div class="mb-3">
							<input type="number" class="form-control" id="proPrice"
								name="proPrice" placeholder="Enter product price (per Kg)">
						</div>
						<div class="mb-3">
							<input type="number" class="form-control" id="proDiscount"
								name="proDiscount" placeholder="Enter product discount">
						</div>
						<div class="mb-3">
							<input type="number" class="form-control" id="proQuantity"
								name="proQuantity" placeholder="Enter product Quantity (in Kg)">
						</div>
						<div class="mb-3">
							<select class="form-select" aria-label="Default select example"
								name="proCategory">
								<%
									CategoryDao dao=new CategoryDao(Factory.getFactory());
									List<Category> list=dao.getAllCategeroy();
									
									
									for(Category cat:list){
								%>
								<option value="<%= cat.getCatId()%>"><%= cat.getCatTitle() %></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="mb-3">
							<p>Select Picture of product</p>
							<input type="file" classs="form-control" name="proPic">
						</div>
						<div class="mb-3 text-center">
							<button type="submit" class="sbt-btn">Add Product</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>