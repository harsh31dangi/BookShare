<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Head.jsp" %>

<style type="text/css">
		.imgBook {
			height: 400px;
			width: 100%;
			border: 1.2px solid black;
		}
		.imgText{
			font-size: 20px;
			text-align: center;
		}
		tr:nth-child(odd) {
			background-color:#1ac6ff
		}
		tr:nth-child(even) {
			background-color:#99ddff
		}
		td {
		width:50%;
		}
		table {
		font-size:20px;
		}

</style>
<script type="text/javascript" src="resources/js/myScript.js"></script>
</head>
<body>
	<div class="container-fluid p-3 my-3 bg-primary text-white rounded wow fadeInDown">
		<h1 style="text-align: center;">Book Details</h1>
	</div>
<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>

<x:forEach items="${bookDetail }" var="i" >

	<div class="container wow fadeInDown" style="margin-top: 20px;margin-bottom: 5px">
		<h2 align="center">${i.bookName }</h2>
		<div class="container" align="center">
			<strong>&#8377;${i.sellingPrice }</strong> 
			<span style="color: grey;font-size: 13px"><del>${i.originalPrice}</del>
			<span style="color: rgb(7, 119, 249);font-size:15px" id="discount"><strong>${i.discount}% off</strong></span>
		</div>
	</div>
	<div class="container">
		
		<div class="row">
			
			<!--for front image-->
			<div class="col-3 wow fadeInLeft" style="margin-top: 30px">
				<span class="imgText">Front Image</span>
				<img src="<%=request.getContextPath()%>/resources/docs/${i.frontImage}" alt="Front image" class="imgBook">
			</div>
			<!--for book info -->
			<div class="col-6 wow fadeIn table-responsive" style="margin-top: 15px">
				<table class="table table-bordered">
				    <tbody>
				      <tr>
				     	<td align="right">Book name :</td>
				     	<td align="left">${i.bookName }</td>
				      </tr>
				      <tr>
				        <td align="right">Author name :</td>
				        <td align="left">${i.authorName }</td>
				      </tr>
				      <tr>
				        <td align="right">Publication :</td>
				        <td align="left">${i.publication }</td>
				      </tr>
				      <tr>
				        <td align="right">Condition :</td>
				        <td align="left">${i.bookCondition }</td>
				      </tr>
				      <tr>
				        <td align="right">Total Pages :</td>
				        <td align="left">${i.totalPages }</td>
				      </tr>
				      <tr>
				        <td align="right">Edition :</td>
				        <td align="left">${i.edition }</td>
				      </tr>
				      <tr>
				        <td align="right">Subject :</td>
				        <td align="left">${i.subjectVO.subjectName }</td>
				      </tr>
				      <tr>
				        <td align="right">Semester :</td>
				        <td align="left">${i.subjectVO.semester }</td>
				      </tr>
				      <tr>
				        <td align="right">Branch :</td>
				        <td align="left">${i.subjectVO.branchVO.branchName }</td>
				      </tr>
				      <tr>
				        <td align="right">Subject Code :</td>
				        <td align="left">${i.subjectVO.subjectCode }</td>
				      </tr>
				    </tbody>
				 </table>
			</div>
			<!--for back image-->
			<div class="col-3 wow fadeInRight" style="margin-top: 30px">
				<span class="imgText">Back Image</span>
				<img src="<%=request.getContextPath()%>/resources/docs/${i.backImage}" alt="Back image" class="imgBook">
			</div>
		
		</div>
		<div class="row">
			<div class="col-12 wow fadeInUp" style="text-align: center;font-size: 20px">
				Seller : ${i.userVO.userName } <br>
				College : ${i.userVO.college }
			</div>
		</div>
	
	</div>

	<button type="button" class="btn btn-outline-primary btn-lg wow fadeInUp" style="margin-top: 10px;margin-left: 32.5%;margin-bottom:15px;width: 35%" onclick="location.href='addToCart?bookId=${i.bookId}'">Add to cart</button>
</x:forEach>
<script src="resources/js/wow.js"></script>
	<script>
		new WOW().init();
	</script>

</body>
</html>