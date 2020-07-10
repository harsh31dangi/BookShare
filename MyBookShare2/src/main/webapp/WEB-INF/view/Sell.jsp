<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="Head.jsp" %>
<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	div.sticky {
			position: fixed;
			 right: 90px;
			 top: 650px;
			 height: 10px;
			 width: 10px;
		}
</style>

<script type="text/javascript">
	function deleteBook(bookId){
			
		var htp=new XMLHttpRequest();
		
		htp.onreadystatechange = function(){
			if(htp.readyState == 4){
				if(htp.responseText == "true"){
					document.getElementById("waiting"+bookId).innerHTML = "Book Deleted";
				}
				else{
					document.getElementById("waiting"+bookId).innerHTML = "Waiting for buyer.....";
				}
			}
		}
		htp.open("get","deleteBookFromSell?bookId="+bookId,"true");
		htp.send();
	}
	
	function checkIfOrdered(bookId){
		
		var htp=new XMLHttpRequest();
		console.log("checkOrderd called");
		console.log(htp.responseText);
		htp.onreadystatechange = function(){
			if(htp.readyState == 4){
				
				if(htp.responseText == "notDelivered"){
					console.log("notDelivered");
					document.getElementById("waiting"+bookId).style.fontSize = "20px";
					document.getElementById("waiting"+bookId).innerHTML = "Waiting for confirmation of delivery......";
					document.getElementById("deliveryBtn"+bookId).style.display = "";
				}
				else if(htp.responseText == "notOrdered"){
					console.log("notOrdered");
					document.getElementById("waiting"+bookId).innerHTML = "Waiting for buyer.....";
				}
				else{
					console.log("Delivered");
					document.getElementById("waiting"+bookId).innerHTML = "Delivered;)";
				}
			}
		}
		htp.open("get","checkIfOrdered?bookId="+bookId,"true");
		htp.send();
	}
	
	function bookDelivered(bookId){
		
		var htp=new XMLHttpRequest();
		htp.onreadystatechange = function(){
			if(htp.readyState == 4){
				if(htp.responseText == "true"){
					document.getElementById("waiting"+bookId).innerHTML = "Delivered;)";
				}
			}
		}
		htp.open("get","markBookAsDelivered?bookId="+bookId,"true");
		htp.send();
	} 
</script>
</head>
<body>

<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<x:if test="${fn:length(BookDetailsByUserID) == 0}">
	<div class="container" style="text-align:center;font-size:50px">
		You do not have added any book for sale yet <br>
		<button type="button" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;width: 35%" onclick="location.href='addBook'">Add one</button>
	</div>
</x:if>

<x:if test="${fn:length(BookDetailsByUserID) != 0}">

<div class="d2"></div>
	
	<x:forEach items="${BookDetailsByUserID }" var="i" varStatus="status">
		<x:if test="${status.getIndex() % 2 eq 0}">
			<div class="d3 container wow fadeInLeft">
				<div class="row">
					<div class="imgDiv col-md-4" onclick="location.href='bookDetails?id=${i.bookId}'">
			  			<img src="<%=request.getContextPath()%>/resources/docs/${i.frontImage }" alt="${i.frontImage }" onload="checkIfOrdered(${i.bookId})">
			  		</div>	
					<div class="imgDiv col-md-7" onclick="location.href='bookDetails?id=${i.bookId}'">
					
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> ${i.bookName }</strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${i.sellingPrice }</strong> 
							<span style="color: grey;font-size: 13px"><del>${i.originalPrice}</del>
							<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.discount}% off</strong></span>
						</div>
						
						<span class="badge badge-primary badge-lg">${i.bookName }</span>
						<span class="badge badge-primary">${i.publication}</span>
						<span class="badge badge-lg" id="waiting${i.bookId }" style="color:#ff8533;font-size:25px;margin-top:3px;margin-left:-1px">Waiting for buyer.....</span> <br>
						<span class="badge badge-info badge-lg"><i class=" fa fa-eye"></i> Views : ${i.views } </span>
					</div>
					<div class="imgDiv col-sm-1" >
						<div style="height: 25px;width: 25px;margin: 5px"> <!------------------------------- Delete button ---------------------->
							<div style="height: 25px;width: 25px;float:left"> 
								<img src="resources/img/garbage.svg" style="height:25px;width:40px;margin-left:-15px" data-toggle="tooltip" title="Delete book" onclick="deleteBook(${i.bookId})">
							</div>
						</div>
						<div style="height: 25px;width: 25px;margin: 5px;margin-top:30px"> <!----------------------------- Delivered button ------------------------------->
							<div style="height: 25px;width: 25px;float:left"> <!-- Delete button -->
								<img src="resources/img/check-mark.svg" id="deliveryBtn${i.bookId }" style="height:25px;width:40px;margin-left:-15px;display:none" data-toggle="tooltip" title="Confirm delivery" onclick="bookDelivered(${i.bookId})">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d2"></div>
		</x:if>
		<x:if test="${status.getIndex() % 2 ne 0 }">
			<div class="d3 container wow fadeInRight">
				<div class="row">
					<div class="imgDiv col-md-4" onclick="location.href='bookDetails?id=${i.bookId}'">
			  			<img src="<%=request.getContextPath()%>/resources/docs/${i.frontImage }" alt="${i.frontImage }" onload="checkIfOrdered(${i.bookId})">
			  		</div>	
					<div class="imgDiv col-md-7" onclick="location.href='bookDetails?id=${i.bookId}'">
					
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> ${i.bookName }</strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${i.sellingPrice }</strong> 
							<span style="color: grey;font-size: 13px"><del>${i.originalPrice}</del>
							<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.discount}% off</strong></span>
						</div>
						
						<span class="badge badge-primary badge-lg">${i.bookName }</span>
						<span class="badge badge-primary">${i.publication}</span>
						<span class="badge badge-lg" id="waiting${i.bookId }" style="color:#ff8533;font-size:25px;margin-top:3px;margin-left:-1px">Waiting for buyer.....</span> <br>
						<span class="badge badge-info badge-lg"><i class=" fa fa-eye"></i> Views : ${i.views } </span>
					</div>
						<div class="imgDiv col-sm-1" >
						<div style="height: 25px;width: 25px;margin: 5px"> <!------------------------------- Delete button ---------------------->
							<div style="height: 25px;width: 25px;float:left"> 
								<img src="resources/img/garbage.svg" style="height:25px;width:40px;margin-left:-15px" data-toggle="tooltip" title="Delete book" onclick="deleteBook(${i.bookId})">
							</div>
						</div>
						<div style="height: 25px;width: 25px;margin: 5px;margin-top:30px"> <!----------------------------- Delivered button ------------------------------->
							<div style="height: 25px;width: 25px;float:left"> <!-- Delete button -->
								<img src="resources/img/check-mark.svg" id="deliveryBtn${i.bookId }" style="height:25px;width:40px;margin-left:-15px;display:none" data-toggle="tooltip" title="Confirm delivery" onclick="bookDelivered(${i.bookId})">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d2"></div>
		</x:if>
	</x:forEach>
</x:if>
<div class="sticky wow fadeInRight">
		<i class="fa fa-plus-circle" data-toggle="tooltip" title="Add New Book" style="font-size: 70px;cursor:pointer" onclick="location.href='addBook'" ></i>
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