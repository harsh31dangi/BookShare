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

<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container-fluid text-primary rounded  wow fadeInDown" style="margin-top:-15px">
		<span style="font-size:60px">Bookshare Application</span>
		
		<img src="resources/img/sort.svg" style="height: 30px;width: 30px;float: right;margin-top: 43px;margin-right:10px;cursor:pointer" data-toggle="tooltip" title="Sort" data-placement:"bottom" onclick="location.href='sort'">
		
		
		<img src="resources/img/filter.svg" style="height:30px;width:30px;float:right;margin-right:35px;margin-top:43px;cursor:pointer" data-toggle="modal" data-toggle="tooltip" data-placement:"bottom" title="Filter" data-target="#exampleModalCenter" >
		
		
<!-- ----------------------------------------------------------------------------------------------------- -->

	<div class="btn-group d1" role="group" aria-label="Basic example" style="width:100%;margin-left:0px">
		 <button type="button" class="btn btn-info" onclick="location.href='home'"> <i class="fa fa-home"></i> Home</button>
		 <button type="button" class="btn btn-info" onclick="location.href='wishlist'"> <i class="fa fa-heart"></i> Wishlist</button>
		 <button type="button" class="btn btn-info" onclick="location.href='cart'"> <i class="fa fa-shopping-cart"></i> Cart</button>
		 <button type="button" class="btn btn-info" onclick="location.href='sell'"> <i class="fa fa-tag"></i> Sell</button>
		 <button type="button" class="btn btn-info" onclick="location.href='profile'"> <i class="fa fa-user"></i> Profile</button>
	</div>
</div>

<!------------------------------------------------------------ Modal box ----------------------------------------------------------------------------------->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-primary" id="exampleModalLongTitle" style="text-align:center">Sort By:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="modal-body">
	        	<div class="custom-control custom-radio">
				    <input type="radio" class="custom-control-input" id="customRadio" name="filter" value="priceLH" onclick="location.href='filter?flag=priceLH'">
				    <label class="custom-control-label" for="customRadio">Price : Low to High</label>
				</div>
	
	        	<div class="custom-control custom-radio">
				    <input type="radio" class="custom-control-input" id="customRadio1" name="filter" value="priceHL" onclick="location.href='filter?flag=priceHL'">
				    <label class="custom-control-label" for="customRadio1">Price : High to Low</label>
				</div>
	
	        	<div class="custom-control custom-radio">
				    <input type="radio" class="custom-control-input" id="customRadio2" name="filter" value="popularityHL" onclick="location.href='filter?flag=popularity'">
				    <label class="custom-control-label" for="customRadio2">Popularity : High to Low</label>
				</div>
	
	        	<div class="custom-control custom-radio">
				    <input type="radio" class="custom-control-input" id="customRadio3" name="filter" value="discountHL" onclick="location.href='filter?flag=discount'">
				    <label class="custom-control-label" for="customRadio3">Discount : High to Low</label>
				</div>
	      </div>
    </div>
  </div>
</div>
<!----------------------------- ------------------------------------------------------------------------------------------------------------------ -->

<div class="d2"></div>

<x:if test="${fn:length(BookList) == 0}">
	<div class="container wow fadeInUp" style="text-align:center;font-size:50px">
		No results found <br>
		<button type="button" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;width: 35%" onclick="location.href='addBook'">Add one</button>
	</div>
</x:if>

<x:if test="${fn:length(BookList) != 0}">
	
	<x:forEach items="${BookList }" var="i" varStatus="status">
	
		<x:if test="${status.getIndex() % 2 eq 0}">
			<div class="d3 container wow fadeInLeft"  id="div1">
				<div class="row">
					<div class="imgDiv col-md-4"  onclick="location.href='bookDetailsFromHome?id=${i.bookId}'">
			  			<img src="<%=request.getContextPath()%>/resources/docs/${i.frontImage }" alt="${i.frontImage }">
			  		</div>	
					<div class="imgDiv col-md-7"  onclick="location.href='bookDetailsFromHome?id=${i.bookId}'">
					
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> ${i.bookName }</strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${i.sellingPrice }</strong> 
							<span style="color: grey;font-size: 13px"><del>${i.originalPrice}</del>
							<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.discount}% off</strong></span>
						</div>
						
						<span class="badge badge-primary badge-lg">${i.bookName }</span>
						<span class="badge badge-primary">${i.authorName }</span>
						<span class="badge badge-primary">${i.publication}</span>
						<span class="badge badge-primary">${i.bookCondition}</span>
						<span class="badge badge-primary">Sem ${i.subjectVO.semester}</span>
					</div>
					<div class="imgDiv col-sm-1" >
						<div style="height: 20px;width: 20px;margin:5px">
							<img src="resources/img/heart.svg" onclick="addToWishlist(${i.bookId})" onload="checkWishlist(${i.bookId})" id="heart${i.bookId }" style="height:20px;cursor:pointer;margin-left:-80px">
							<img src="resources/img/redheart.svg" onclick="removeFromWishlist(${i.bookId})" id="redHeart${i.bookId }" style="height:20px;width:20px;cursor:pointer;margin-left:0px;display:none">
						</div>
					</div>
				</div>
			</div>
			<div class="d2"></div>
		</x:if>
		
		<x:if test="${status.getIndex() % 2 ne 0 }">
			<div class="d3 container wow fadeInRight">
				<div class="row">
					<div class="imgDiv col-md-4"  onclick="location.href='bookDetailsFromHome?id=${i.bookId}'">
			  			<img src="<%=request.getContextPath()%>/resources/docs/${i.frontImage }" alt="${i.frontImage }">
			  		</div>	
					<div class="imgDiv col-md-7"  onclick="location.href='bookDetailsFromHome?id=${i.bookId}'">
					
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> ${i.bookName }</strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${i.sellingPrice }</strong> 
							<span style="color: grey;font-size: 13px"><del>${i.originalPrice}</del>
							<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.discount}% off</strong></span>
						</div>
						
						<span class="badge badge-primary badge-lg">${i.bookName }</span>
						<span class="badge badge-primary">${i.authorName }</span>
						<span class="badge badge-primary">${i.publication}</span>
						<span class="badge badge-primary">${i.bookCondition}</span>
						<span class="badge badge-primary">Sem ${i.subjectVO.semester}</span>
					</div>
					<div class="imgDiv col-sm-1" >
						<div style="height: 20px;width: 20px;margin: 5px">
							<img src="resources/img/heart.svg" onclick="addToWishlist(${i.bookId})" onload="checkWishlist(${i.bookId})" id="heart${i.bookId }" style="height:20px;cursor:pointer;margin-left:-80px">
							<img src="resources/img/redheart.svg" onclick="removeFromWishlist(${i.bookId})" id="redHeart${i.bookId }" style="height:20px;width:20px;cursor:pointer;margin-left:0px;display:none">
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