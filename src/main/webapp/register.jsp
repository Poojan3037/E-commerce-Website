<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
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
						<img alt="" src="pic/add-friend.png" width="auto" height="100px">
						<h3 class="display-6">Register Here</h3>
						<%@ include file="components/message.jsp" %>
					</div>
					<div class="card-body">
						<form method="post" action="Register">
							<div class="mb-3">
								<input type="text" class="form-control" id="userName"
									name="userName" placeholder="Enter Name">
							</div>
							<div class="mb-3">
								<input type="email" class="form-control" id="userEmail"
									name="userEmail" placeholder="Enter Email">
							</div>
							<div class="mb-3">
								<input type="password" class="form-control" id="userPassword"
									name="userPassword" placeholder="Enter Password">
							</div>
							<div class="mb-3">
								<input type="number" class="form-control" id="userPhone"
									name="userPhone" placeholder="Enter Phone No.">
							</div>
							<div class="mb-3">
								<textarea class="form-control" rows="5"
									placeholder="Enter Address" name="userAddress"></textarea>
							</div>
							<div class="mb-3"></div>
							<button type="submit" class="sbt-btn">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>