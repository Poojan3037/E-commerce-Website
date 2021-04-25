
<%
HttpSession ses = request.getSession();

String message = (String) ses.getAttribute("msg");

if (message != null) {
%>

<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%= message %></strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
		ses.removeAttribute("msg");
	}
%>

