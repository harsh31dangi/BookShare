<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
	
	<script type="text/javascript">
	
		function sort(){
			window.location.href="sort";
		}
		
	</script>
	
</head>
<body>
<div class="container-fluid  sticky-top">
	<span style="float: left;font-size: 30px;margin-top: 3px" ><strong>BookShare Application</strong></span>
	<button type="button" class="btn btn-primary" style="float: right;margin-top: 7.5px" onclick="sort()" >Sort</button>

	<div class="d2"></div>
	<div class="btn-group d1" role="group" aria-label="Basic example">
	  <button type="button" class="btn btn-info">Home</button>
	  <button type="button" class="btn btn-info">Wishlist</button>
	  <button type="button" class="btn btn-info">Cart</button>
	  <button type="button" class="btn btn-info">Profile</button>
	</div>
</div>
<div class="d2"></div>

<div class="d3 container">
	<div class="row">
		
		<div class="imgDiv col-md-4">
  			<img src="2.jpg" alt="BookImage">
  		</div>
		<div class="imgDiv col-md-7">

			<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 18px"><strong> Name of the book</strong></div> <br>
			<div style="margin-top: -25px;margin-left: 10px;">
				<strong>&#8377;350</strong> 
				<span style="color: grey;font-size: 13px"><del>500</del>
				<span style="color: rgb(7, 119, 249);font-size:15px"><strong>30% off</strong></span>
			</div>
		
			<span class="badge badge-primary">AJAVA</span>
			<span class="badge badge-primary">M.T.Savaliya</span>
			
			<span class="badge badge-primary">Dreampress Publication</span>
			<span class="badge badge-primary">NEW</span>
			
			<span class="badge badge-primary">NEW</span>

		</div>
		<div class="imgDiv col-sm-1" >
			<div style="height: 20px;width: 20px;margin: 5px">
				<span class="fa fa-heart"></span>
			</div>
		</div>
</div>

</div>
</body>
</html>