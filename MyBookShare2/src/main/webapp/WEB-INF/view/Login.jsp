<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <%@include file="Head.jsp" %>

<script type="text/javascript" src="resources/js/myScript.js"></script>
<style type="text/css">
	.container input {
	 border: 1.2px solid #00a3cc;
	  }
</style>
</head>
<body>
	
	<%@taglib prefix="x" uri="http://java.sun.com/jstl/core_rt" %>
	
	<x:set value="${sessionScope.logoutFlag }" var="flag" ></x:set>
	
	<x:if test="${flag ne null }">
		<script>
			alert("You have been successfully logged out");
		</script>
	</x:if>
	
	<div class="container-fluid p-3 my-3 bg-primary text-white rounded ">
		<h1 style="text-align: center;">Bookshare Application</h1>
	</div>
	<div class="container" style="margin-top: 50px">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
	  
	    <label for="exampleInputPassword1">Password</label>
	    <div class="input-group mb-3">
	      
	      <input type="password" class="form-control" placeholder="Password" id="password">
	      <div class="input-group-append" id="passbtn">
	        <button class="btn btn-info" type="button" onclick="show()" id="eye"><i class="fa fa-eye" ></i></button>
	        <button class="btn btn-info" type="button" onclick="show()" id="slashEye" style="display: none;"><i class="fa fa-eye-slash"></i></button>
	      </div>
	
	      <button type="submit" class="btn btn-outline-primary btn-lg" style="width: 100%;margin-top: 30px" onclick="check()">Submit</button>
	    </div>
	
	</div>
	
	<h3 id="h3" style="display:none;text-align:center;color:red">Invalid Credentials</h3>
</body>

</html>