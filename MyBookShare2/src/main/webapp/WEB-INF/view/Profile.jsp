<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Head.jsp" %>
<title>Insert title here</title>
	<style type="text/css">
		tr:nth-child(odd) {
			background-color:#1ac6ff
		}
		tr:nth-child(even) {
			background-color:#99ddff
		}
		.myButton {
		width: 40%;margin-top: 20px;border-width: 1px;
	}
	</style>
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
</head>
<body>

<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div class="container-fluid p-3 my-3 bg-primary text-white rounded wow fadeInDown ">
		<h1 style="text-align: center;">Profile</h1>
	</div>
		
	<div class="btn-group d1 wow fadeInDown" role="group" aria-label="Basic example" >
		 <button type="button" class="btn btn-info" onclick="location.href='home'"> <i class="fa fa-home"></i> Home</button>
		 <button type="button" class="btn btn-info" onclick="location.href='wishlist'"> <i class="fa fa-heart"></i> Wishlist</button>
		 <button type="button" class="btn btn-info" onclick="location.href='cart'"> <i class="fa fa-shopping-cart"></i> Cart</button>
		 <button type="button" class="btn btn-info" onclick="location.href='sell'"> <i class="fa fa-tag"></i> Sell</button>
		 <button type="button" class="btn btn-info" onclick="location.href='profile'"> <i class="fa fa-user"></i> Profile</button>
	</div>
</div>
<div style="height:30px;width:100%"></div>

<x:forEach items="${UserDetails }" var="i" >
	
	<div class="container wow fadeIn">
		<x:if test="${fn:startsWith(i.gender,'m')}">
			<div class="row text-center">
				<img src="resources/img/man.svg" height="200px" width="200px">
			</div>
		</x:if>
		<x:if test="${fn:startsWith(i.gender,'f')}">
			<div class="row">
				<img src="resources/img/woman.svg" height="200px" width="200px">
			</div>
		</x:if>
		<div class="row">
		
				<div class="container wow fadeIn table-responsive"  style="margin-top: 15px;width: 40%">
					<table class="table table-bordered">
					    <tbody>
					      <tr>
					     	<td align="right">Name :</td>
					     	<td>${i.userName }</td>
					      </tr>
					      <tr>
					        <td align="right">User type:</td>
					        <td>${i.userType }</td>
					      </tr>
					      <tr>
					        <td align="right">Email</td>
					        <td>${i.email }</td>
					      </tr>
					      <tr>
					        <td align="right">Mobile No :</td>
					        <td>${i.contactNumber }</td>
					      </tr>
					      <tr>
					        <td align="right">College :</td>
					        <td>${i.college }</td>
					      </tr>
					    </tbody>
					 </table>
				</div>			
		</div>
		<div class="container text-center wow fadeInUp">
		   <button type="submit" class="btn btn-outline-primary btn-lg myButton" onclick="location.href='editProfile'">Edit Profile</button><br>
	  	   <button type="reset" class="btn btn-outline-danger btn-lg myButton" style="margin-bottom:20px" onclick="location.href='logout'">Logout</button>
	  	</div>
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