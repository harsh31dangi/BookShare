<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="Head.jsp" %>
	<title></title>
	<title>BookStore</title>
</head>
<body>
   <div class="container-fluid p-3 my-3 bg-primary text-white rounded ">
		<h1 style="text-align: center;">Bookshare Application</h1>
	</div>
	<div class="container" align="center" style="margin-top: 60px;font-size: 30px">
		<button type="button" class="btn btn-outline-primary btn-lg btn-block" onclick="location.href='login'">Login</button>
	</div>

	<div class="container" align="center" style="margin-top: 30px">
		<button type="button" class="btn btn-outline-primary btn-lg btn-block" onclick="location.href='signup'">Signup</button>
	</div>
</body>
</html>