<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
	<script type="text/javascript" src="resources/js/myScript.js"></script>	
	<%@include  file="Head.jsp" %>
	<style>
		td {
		font-size: 25px;
		width:50%;
		}
		tr:nth-child(odd) {
			background-color:#1ac6ff
		}
		tr:nth-child(even) {
			background-color:#99ddff
		}
	</style>
</head>
<body>
<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>

	<div class="container-fluid p-3 my-3 bg-primary text-white rounded wow fadeInDown ">
		<h1 style="text-align: center;">Checkout</h1>
	</div>
	<div class="btn-group d1 wow fadeInDown" role="group" aria-label="Basic example">
		 <button type="button" class="btn btn-info" onclick="location.href='home'"> <i class="fa fa-home"></i> Home</button>
		 <button type="button" class="btn btn-info" onclick="location.href='wishlist'"> <i class="fa fa-heart"></i> Wishlist</button>
		 <button type="button" class="btn btn-info" onclick="location.href='cart'"> <i class="fa fa-shopping-cart"></i> Cart</button>
		 <button type="button" class="btn btn-info" onclick="location.href='sell'"> <i class="fa fa-tag"></i> Sell</button>
		 <button type="button" class="btn btn-info" onclick="location.href='profile'"> <i class="fa fa-user"></i> Profile</button>
	</div>
	<div class="d2"></div>

<x:forEach items="${BuyBookDetails }" var="i">

	<div class="container wow fadeIn" style="margin-bottom: 5px">
		<h2 align="center">Review Order</h2>
	</div>
	<div class="row">
			<div class="container col table-responsive wow fadeIn"> 
				<div class="container  table-responsive"  style="margin-top: 15px;width: 50%">
					<table class="table table-bordered">
					    <tbody>
					      <tr>
					     	<td align="right">Book name :</td>
					     	<td> ${i.bookName }</td>
					      </tr>
					      <tr>
					        <td align="right">Semester :</td>
					        <td>${i.subjectVO.semester }</td>
					      </tr>
					      <tr>
					        <td align="right">Branch :</td>
					        <td>${i.subjectVO.branchVO.branchName }</td>
					      </tr>
					      <tr>
					        <td align="right">Subject :</td>
					        <td>${i.subjectVO.subjectName }</td>
					      </tr>
					      <tr>
					        <td align="right">Subject Code :</td>
					        <td>${i.subjectVO.subjectCode }</td>
					      </tr>
					      <tr>
					        <td align="right">Price :</td>
					        <td>${i.sellingPrice }</td>
					      </tr>
					    </tbody>
					 </table>
				</div>
			</div>
	</div>	
	<div class="row wow fadeInUp">
		<div class="col-12" style="text-align: center;font-size: 35px;margin-top:25px">
			Seller : ${i.userVO.userName } <br>
			Contact Number : ${i.userVO.contactNumber } <br>
			<p style="font-size:25px;margin-top:10px;color:gray"> Please contact the seller for further details </p> 
		</div>
		<button type="button" class="btn btn-outline-primary btn-lg wow fadeInUp" style="margin-top: 10px;margin-left: 32.5%;margin-bottom:15px;width: 35%" onclick="location.href='order?bookId=${i.bookId}'">Confirm Order</button>
	</div>
</x:forEach>
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