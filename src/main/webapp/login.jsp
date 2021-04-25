<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>

<!--
	/// ----css js bootstrap ----/// 
 -->
 <%@ include file="components/bootstrap_css_js.jsp"%>
</head>

<body>
	<!--
	///---- navbar----///
 -->
 
 <%@ include file="components/navbar.jsp" %>
	


	<!--
	///-----Register form----/// 
 -->
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card text-center">
					<div class="card-header">
						<img alt="" src="pic/login.png" width="auto" height="100px">
						<h3 class="display-6">Login Here</h3>
						<%@ include file="components/message.jsp"%>
					</div>
					<div class="card-body">
						<form method="post" action="LoginServlet">
							
							<div class="mb-3">
								<input type="email" class="form-control" id="userEmail"
									name="userEmail" placeholder="Enter Email">
							</div>
							<div class="mb-3">
								<input type="password" class="form-control" id="userPassword"
									name="userPassword" placeholder="Enter Password">
							</div>
							<div class="mb-3">
								<a href="register.jsp" style="text-decoration: none">if not registered click here</a>
							</div>
							<div class="mb-3"></div>
							<button type="submit" class="sbt-btn">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>