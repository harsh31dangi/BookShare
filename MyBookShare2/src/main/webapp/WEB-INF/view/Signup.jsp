<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="Head.jsp" %>

<style type="text/css">
	.col input {
		border: 1.2px solid #00a3cc
	}
	.myButton {
	width: 49.5%;margin-top: 20px;border-width: 1px
	}
</style>
<script type="text/javascript">
  var flag=0;
  function show(){
    console.log("show called");
    if(flag == 0)
    {
      document.getElementById('password').type='text';
      document.getElementById('eye').style.display="none";
      document.getElementById('slashEye').style.display="";
      flag=1;
    }
    else
    {
      document.getElementById('password').type='password';
      document.getElementById('eye').style.display="";
      document.getElementById('slashEye').style.display="none";
      flag=0;
    }
}
var flag2=0;
function show2(){
    console.log("show called");
    if(flag2 == 0)
    {
      document.getElementById('confirmPassword').type='text';
      document.getElementById('eye2').style.display="none";
      document.getElementById('slashEye2').style.display="";
      flag2=1;
    }
    else
    {
      document.getElementById('confirmPassword').type='password';
      document.getElementById('eye2').style.display="";
      document.getElementById('slashEye2').style.display="none";
      flag2=0;
    }
}
function matchPassword()
{
	var pass=document.getElementById('password').value;
	var conPass=document.getElementById('confirmPassword').value;
	if(pass == conPass)
	{
		document.getElementById('match').style.display="none";
		document.getElementById('submit').disabled=false;
	}
	else
	{
		document.getElementById('match').style.display="";
		document.getElementById('submit').disabled=true;
	}
}
function verifyOTP()
{
		
}
</script>
</head>
<body>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!-- ------------------------------------------------------------------------------------ -->
	<div class="container-fluid p-3 my-3 bg-primary text-white rounded ">
		<h1 style="text-align: center;">Bookshare Application</h1>
	</div>
<!-- ------------------------------------------------------------------------------------ -->
<div class="container">
<f:form action="addUser" method="post" modelAttribute="SignupData">
<!-- -------------------------------------------------------------------------------------- -->
<div class="form-row primary" style="margin-top: 10px">
    	<div class="col">
	      <label for="name">Name:</label>
	      <f:input type="text" class="form-control"  placeholder="Enter name" required="required" path="userName"/> 
	  	</div>	
	</div>

<!-- -------------------------------------------------------------------------------------------- -->
<div class="form-row primary" style="margin-top: 10px">
    	<div class="col">
	      <label for="conNumber">Contact Number:</label>
	      <f:input type="number" class="form-control"  placeholder="Enter conatct number" required="required" path="contactNumber" />
	  	</div>	
	  	<button onclick="location.href='verifyOTP'">Verify</button>
	</div>

<!-- ---------------------------------------------------------------------------------------------- -->
 <div class="form-row primary" style="margin-top: 10px">
    	<div class="col">
	      <label for="college">College:</label>
	      <f:input type="text" class="form-control"  placeholder="Enter college name" required="required" path="college"/>
	  	</div>	
	</div>
<!-- ------------------------------------------------------------------------------------------------ -->
<div class="form-row" style="margin-top: 20px">
		<div class="form-check-inline">
			<label class="form-check-label">Gender : </label>
		</div>
		<div class="form-check-inline">
      		<label class="form-check-label" for="radio1">
        	<f:radiobutton  class="form-check-input" id="radio1" name="gender" value="male" checked="checked" path="gender" />Male
      		</label>
    	</div>
    	<div class="form-check-inline">
      		<label class="form-check-label" for="radio1">
        	<f:radiobutton class="form-check-input" id="radio1" name="gender" value="female" path="gender"/>Female
      		</label>
    	</div>
    </div>
<!-- ----------------------------------------------------------------------------------------------------- -->
<div class="form-row" style="margin-top: 20px">
		<div class="form-check-inline">
			<label class="form-check-label">User Type : </label>
		</div>
		<div class="form-check-inline">
      		<label class="form-check-label" for="radio1">
        	<f:radiobutton class="form-check-input" id="radio1" name="userType" value="Student" checked="checked" path="userType"/>Student
      		</label>
    	</div>
    	<div class="form-check-inline">
      		<label class="form-check-label" for="radio1">
        	<f:radiobutton class="form-check-input" id="radio1" name="userType" value="Faculty" path="userType"/>Faculty
      		</label>
    	</div>
    </div>
<!-- ------------------------------------------------------------------------------------------------------ -->
<div class="form-row primary" style="margin-top: 10px">
    	<div class="col">
	      <label for="email">Email Id:</label>
	      <f:input type="email" class="form-control"  placeholder="Enter Email Id" required="required" path="email"/>
	  	</div>	
</div>
<!-- --------------------------------------------------------------------------------------------------------- -->
<div class="form-row" style="margin-top: 10px">
		 <label for="exampleInputPassword1">Password</label>
    	<div class="input-group mb-3">
      		<f:input type="password" class="form-control" placeholder="Password" id="password"  style="border: 1.2px solid #00a3cc" path="password"/>
      		<div class="input-group-append" id="passbtn">
        		<button class="btn btn-info" type="button" onclick="show()" id="eye"><i class="fa fa-eye" ></i></button>
        		<button class="btn btn-info" type="button" onclick="show()" id="slashEye" style="display: none;"><i class="fa fa-eye-slash"></i></button>
     	 	</div>
		</div>
	</div>

	<div class="form-row">
		 <label for="exampleInputPassword1">Confirm Password</label>
    	<div class="input-group mb-3">
      		<input type="password" class="form-control" placeholder="Re-enter Password" id="confirmPassword" style="border: 1.2px solid #00a3cc"  onkeyup="matchPassword()">
      		<div class="input-group-append" id="passbtn">
        		<button class="btn btn-info" type="button" onclick="show2()" id="eye2"><i class="fa fa-eye" ></i></button>
        		<button class="btn btn-info" type="button" onclick="show2()" id="slashEye2" style="display: none;"><i class="fa fa-eye-slash"></i></button>
     	 	</div>
		</div>
		<div style="color: red;text-align: center;font-size: 20px;display: none;" class="container" id="match">
        	The passwords do not match.
      </div>
	</div>
	
<f:hidden path="userId"/>
<button type="submit" class="btn btn-outline-primary btn-lg myButton" id="submit" disabled=true>Submit</button>
  	<button type="reset" class="btn btn-outline-danger btn-lg myButton">Reset</button>

</f:form>

</div>


</body>
</html>