<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<%@include file="Head.jsp" %>
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
	<script type="text/javascript" src="resources/js/myScript.js"></script>
</head>
<body>
	<div class="container-fluid p-3 my-3 bg-primary text-white rounded wow fadeInDown ">
		<h1 style="text-align: center;">Bookshare Application</h1>
	</div>
	<div class="btn-group d1 wow fadeInDown" role="group" aria-label="Basic example" >
		 <button type="button" class="btn btn-info" onclick="location.href='home'"> <i class="fa fa-home"></i> Home</button>
		 <button type="button" class="btn btn-info" onclick="location.href='wishlist'"> <i class="fa fa-heart"></i> Wishlist</button>
		 <button type="button" class="btn btn-info" onclick="location.href='cart'"> <i class="fa fa-shopping-cart"></i> Cart</button>
		 <button type="button" class="btn btn-info" onclick="location.href='sell'"> <i class="fa fa-tag"></i> Sell</button>
		 <button type="button" class="btn btn-info" onclick="location.href='profile'"> <i class="fa fa-user"></i> Profile</button>
	</div>
	<div class="d2"></div>
	
	<div class="container" style="text-align:center;font-size:50px">
		Congratulations your order has been sent to the seller. <br>
		Please contact the seller for further processing.
	</div>
	
	<script>
		$(document).ready(function(){
 		$('[data-toggle="tooltip"]').tooltip(); 
		});
	</script>
	<script src="resources/js/wow.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>