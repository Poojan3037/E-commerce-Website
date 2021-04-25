<%@page import="com.farmToMart.entity.User"%>
<%
User user1 = (User) session.getAttribute("currentUser");
%>


<nav class="navbar navbar-expand-lg navbar-dark background-primary">
	<div class="container">
		<a class="navbar-brand" href="#"><span><i style='font-size:24px' class='fas'>&#xf06c;</i></span> Farm To Mart</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><span><i class='fas fa-home' style='font-size:18px'></i></span> Home</a></li>
			</ul>
			<%
			if (user1 == null) {
			%>
			<ul class="navbar-nav ml-autp">
				<li class="nav-item cart-btn"><a class="nav-link active"
					aria-current="page" data-bs-toggle="modal"
					data-bs-target="#cartModal" onclick="showCart()"><span></span><i class="fa fa-shopping-cart" style="font-size:20px"></span></i></a></li>
				<li class="nav-item"><a class="nav-link active "
					aria-current="page" href="login.jsp"><span><i class='fas fa-user-alt' style='font-size:18px'></i></span> Login</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="register.jsp"><span><i class='fas fa-user-plus' style='font-size:18px'></i></span> Register</a></li>
			</ul>
			<%
			} else {
			%>

			<ul class="navbar-nav ml-autp">
				<li class="nav-item cart-btn"><a class="nav-link active"
					aria-current="page" data-bs-toggle="modal"
					data-bs-target="#cartModal" onclick="showCart()"><span><i class="fa fa-shopping-cart" style="font-size:20px"></span></i></a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href=<%= user1.getRole().equals("admin")?"admin.jsp":"normal.jsp" %>><%=user1.getUserName()%></a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="LogoutServlet"><span><i class='fas fa-unlock-alt' style='font-size:18px'></i></span> Logout</a></li>

			</ul>

			<%
			}
			%>
		</div>
	</div>
</nav>



<!--
		///------cart modal---------///// 
	 -->

<div class="modal fade" id="cartModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="max-width:750px">
			<div class="modal-header background-primary text-white">
				<h5 class="modal-title " id="exampleModalLabel">Your Cart</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body ">
				<div>
					<table class="table  table-container">
					
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<a class="btn background-primary text-white" href="checkout.jsp">Check Out</a>
			</div>
		</div>
	</div>
</div>