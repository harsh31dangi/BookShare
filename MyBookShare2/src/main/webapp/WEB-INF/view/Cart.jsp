<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="Head.jsp" %>
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
	<script type="text/javascript" src="resources/js/myScript.js"></script>		
</head>
<body>
	<div class="container-fluid p-3 my-3 bg-primary text-white rounded wow fadeInDown">
		<h1 style="text-align: center;">Shopping Cart</h1>
	</div>
	<div class="btn-group d1 wow fadeInDown" role="group" aria-label="Basic example" >
		 <button type="button" class="btn btn-info" onclick="location.href='home'"> <i class="fa fa-home"></i> Home</button>
		 <button type="button" class="btn btn-info" onclick="location.href='wishlist'"> <i class="fa fa-heart"></i> Wishlist</button>
		 <button type="button" class="btn btn-info" onclick="location.href='cart'"> <i class="fa fa-shopping-cart"></i> Cart</button>
		 <button type="button" class="btn btn-info" onclick="location.href='sell'"> <i class="fa fa-tag"></i> Sell</button>
		 <button type="button" class="btn btn-info" onclick="location.href='profile'"> <i class="fa fa-user"></i> Profile</button>
	</div>
	<div class="d2"></div>

	<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<x:if test="${fn:length(BooksInCart) == 0}">
		<div class="container wow fadeInUp" style="text-align:center;font-size:50px">
			You do not have added any book into cart yet <br>
			<button type="button" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;width: 35%" onclick="location.href='home'">Add one</button>
		</div>
	</x:if>

<x:if test="${fn:length(BooksInCart) != 0}">
	
	<x:forEach items="${BooksInCart }" var="i" varStatus="status">
	
		<x:if test="${status.getIndex() % 2 eq 0}">
			<div class="d3 container wow fadeInLeft"  id="div1">
				<div class="row">
					<div class="imgDiv col-md-4"  onclick="location.href='bookDetails?id=${i.bookVO.bookId}'">
			  			<img src="<%=request.getContextPath()%>/resources/docs/${i.bookVO.frontImage }" alt="${i.bookVO.frontImage }">
			  		</div>	
					<div class="imgDiv col-md-7"  onclick="location.href='bookDetails?id=${i.bookVO.bookId}'">
					
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> ${i.bookVO.bookName }</strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${i.bookVO.sellingPrice }</strong> 
							<span style="color: grey;font-size: 13px"><del>${i.bookVO.originalPrice}</del>
							<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.bookVO.discount}% off</strong></span>
						</div>
						
						<span class="badge badge-primary badge-lg">${i.bookVO.bookName }</span>
						<span class="badge badge-primary">${i.bookVO.authorName }</span>
						<span class="badge badge-primary">${i.bookVO.publication}</span>
						<span class="badge badge-primary">${i.bookVO.bookCondition}</span>
						<span class="badge badge-primary">Sem ${i.bookVO.subjectVO.semester}</span>
					</div>
					<div class="imgDiv col-sm-1" >
						<div style="height: 25px;width: 25px;margin-left:-30px;float:left"> <!-- Delete button -->
							<img src="resources/img/garbage.svg" style="height:20px;width:40px" data-toggle="tooltip" title="Delete from cart" onclick="location.href='deleteFromCart?bookId=${i.bookVO.bookId}'">
						</div>
						<div style="height: 20px;width: 20px;">
							<img src="resources/img/heart.svg" onclick="addToWishlist(${i.bookVO.bookId})" data-toggle="tooltip" title="Add to wishlist" onload="checkWishlist(${i.bookVO.bookId})" id="heart${i.bookVO.bookId }" style="height:20px;width:40px;cursor:pointer;margin-left:0px">
							<img src="resources/img/redheart.svg" onclick="removeFromWishlist(${i.bookVO.bookId})" data-toggle="tooltip" title="Remove from wishlist" id="redHeart${i.bookVO.bookId }" style="height:20px;width:20px;cursor:pointer;margin-left:10px;display:none">
						</div>
						<div style="height: 60px;width: 120px;margin-top: 100px;margin-left: -80px">
							<button type="button" class="btn btn-outline-primary btn-lg" style="margin-top: 10px" onclick="location.href='buyNow?bookId=${i.bookVO.bookId}'">Buy now</button>
						</div>
					</div>
				</div>
			</div>
			<div class="d2"></div>
		</x:if>
		
		<x:if test="${status.getIndex() % 2 ne 0 }">
			<div class="d3 container wow fadeInRight">
				<div class="row">
					<div class="imgDiv col-md-4"  onclick="location.href='bookDetails?id=${i.bookVO.bookId}'">
			  			<img src="<%=request.getContextPath()%>/resources/docs/${i.bookVO.frontImage }" alt="${i.bookVO.frontImage }">
			  		</div>	
					<div class="imgDiv col-md-7"  onclick="location.href='bookDetails?id=${i.bookVO.bookId}'">
					
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> ${i.bookVO.bookName }</strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${i.bookVO.sellingPrice }</strong> 
							<span style="color: grey;font-size: 13px"><del>${i.bookVO.originalPrice}</del></span>
							<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.bookVO.discount}% off</strong></span>
						</div>
						
						<span class="badge badge-primary badge-lg">${i.bookVO.bookName }</span>
						<span class="badge badge-primary">${i.bookVO.authorName }</span>
						<span class="badge badge-primary">${i.bookVO.publication}</span>
						<span class="badge badge-primary">${i.bookVO.bookCondition}</span>
						<span class="badge badge-primary">Sem ${i.bookVO.subjectVO.semester}</span>
					</div>
					<div class="imgDiv col-sm-1" >
						<div style="height: 25px;width: 25px;margin-left:-30px;float:left"> <!-- Delete button -->
							<img src="resources/img/garbage.svg" style="height:20px;width:40px" data-toggle="tooltip" title="Delete from cart" onclick="location.href='deleteFromCart?bookId=${i.bookVO.bookId}'">
						</div>
						<div style="height: 20px;width: 20px;">
							<img src="resources/img/heart.svg" onclick="addToWishlist(${i.bookVO.bookId})" data-toggle="tooltip" title="Add to wishlist" onload="checkWishlist(${i.bookVO.bookId})" id="heart${i.bookVO.bookId }" style="height:20px;width:40px;cursor:pointer;margin-left:0px">
							<img src="resources/img/redheart.svg" onclick="removeFromWishlist(${i.bookVO.bookId})" data-toggle="tooltip" title="Remove wishlist" id="redHeart${i.bookVO.bookId }" style="height:20px;width:20px;cursor:pointer;margin-left:10px;display:none">
						</div>
						<div style="height: 60px;width: 120px;margin-top: 100px;margin-left: -80px">
							<button type="button" class="btn btn-outline-primary btn-lg" style="margin-top: 10px" onclick="location.href='buyNow?bookId=${i.bookVO.bookId}'">Buy now</button>
						</div>
					</div>
				</div>
			</div>
			<div class="d2"></div>
		</x:if>
	</x:forEach>
</x:if>
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