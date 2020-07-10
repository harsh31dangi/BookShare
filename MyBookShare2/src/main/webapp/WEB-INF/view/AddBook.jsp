<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="Head.jsp" %>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<style type="text/css">
	  .form-row {
	    margin-top: 15px;
	  }
	  h2 {
	    text-align: center;
	    margin-top: 10px;
	  }
	  .col input {
	  border: 1.2px solid #00a3cc;
	  }
	  .col select {
	  border: 1.2px solid #00a3cc;
	  }	
	  .custom-file input {
	  border: 1.2px solid #00a3cc;
	  }
	  .myButton {
		width: 49.5%;margin-top: 20px;border-width: 1px
	  }
	  .fileDiv {
	  	width: 49.5%;margin-top: 20px;border-width: 1px
	  }
	</style>

	<script type="text/javascript" src="resources/js/myScript.js"></script>
</head>
<body>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!-- ------------------------------------------------------------------------------------------------------- -->
<h2>Fill the details to add a book to sell</h2>
<div class="container">
  
  <f:form action="insertBook"  method="post" modelAttribute="Book" enctype="multipart/form-data" >
  
    <div class="form-row">
    	<div class="col">
	      <label for="uname">Bookname:</label>
	      <f:input type="text" class="form-control"  placeholder="Enter bookname" path="bookName" required="required"/>
	  	</div>	
	</div>
<!-- ---------------------------------------------------------------------------------------------------- -->
	<div class="form-row">
      
      <div class="col">
        <label for="semester">Semester :</label>
        <select id="semester" onchange="sort()" class="form-control" required>
            <option value="">--Select--</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>
      </div>
		<div class="col">
      		<label for="brach">Branch :</label>
			<select id="branch" onchange="sort()" class="form-control" required>
		         <option value="">--Select--</option>
		         <option value="11">GENERAL</option>
		         <option value="1">AUTOMOBILE</option>
		         <option value="2">BIOMEDICAL</option>
		         <option value="3">COMPUTER</option>
		         <option value="4">CIVIL</option>
		         <option value="5">EC</option>
		         <option value="5">IT</option>
		         <option value="6">MECHANICAL</option>
		         <option value="7">CHEMICAL</option>
		         <option value="8">PLASTIC</option>
		         <option value="9">RUBBER</option>
    		</select>
		</div>

		<div class="col">
      		<label for="subject">Subject :</label>
			<select id="subject" onchange="setSubject()" class="form-control" required>
        	<option>--Select--</option>
      		</select>
		</div>

	</div>
<!-- ---------------------------------------------------------------------------------------------------- -->
	<div class="form-row" style="margin-top: 10px;">
    	<div class="col">
	      <label for="subjectCode">Subject Code:</label>
	      <input type="number" class="form-control" id="subjectCode" placeholder="Subject Code" required>
	  	</div>	
    	<div class="col">
	      <label for="authorName">Author name:</label>
	      <f:input type="text" class="form-control" id="authorName" placeholder="Author name"  path="authorName" required="required"/>
	    </div>
	    <div class="col">
	      <label for="pwd">Edition</label>
	      <f:input type="number" class="form-control" id="edition" placeholder="Edition"  path="edition" required="required"/>
	    </div>
	</div>
<!-- ---------------------------------------------------------------------------------------------------- -->
   <div class="form-row" style="margin-top: 10px;">
      <div class="col">
        <label for="publication">Publication:</label>
        <f:input type="text" class="form-control" id="publication" placeholder="Publication" path="publication" required="required"/>
      </div>  
      <div class="col">
        <label for="totalPages">Total Pages</label>
        <f:input type="number" class="form-control" id="totalPages" placeholder="Total Pages" path="totalPages" required="required"/>
      </div>
      <div class="col">
          <label for="condition">Condition : </label>
          <f:select  class="form-control" id="condition" path="bookCondition" required="required">
            <option value="">--Select--</option>
            <option value="Best">Best</option>
            <option value="Good">Good</option>
            <option value="Average">Average</option>
            <option value="Bad">Bad</option>
            <option value="Worst">Worst</option>
          </f:select>
      </div>
    </div>
<!-- ---------------------------------------------------------------------------------------------------- -->
    <div class="form-row">
      <div class="col">
        <label for="sellingPrice">Selling Price :</label>
        <f:input type="number" class="form-control" id="sellingPrice" placeholder="Selling Price"  path="sellingPrice" required="required"/>
      </div>
      <div class="col">
        <label for="originalPrice">Original Price :</label>
        <f:input type="number" class="form-control" id="originalPrice" placeholder="Selling Price"  path="originalPrice" required="required"/>
      </div>
    </div>
<!-- ---------------------------------------------------------------------------------------------------- -->
    <div class="form-row">
      <label for="frontImage">Front Image :</label>
      <div class="custom-file">
        <input type="file" class="custom-file-input fileDiv " id="frontImage" name="front" required="required">
        <label class="custom-file-label" for="customFile">Choose file</label>
      </div>
    </div>
<!-- ------------------------------------------------------------------------------------------------------ -->
    <div class="form-row">
      <label for="frontImage">Back Image :</label>
      <div class="custom-file">
        <input type="file" class="custom-file-input fileDiv" id="backImage" name="back" required="required">
        <label class="custom-file-label" for="customFile">Choose file</label>
      </div>
    </div>
    
<script >
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
<!-- ----------------------------------------------------------------------------------------------------------- -->
   <button type="submit" class="btn btn-outline-primary btn-lg myButton">Submit</button>
  	<button type="reset" class="btn btn-outline-danger btn-lg myButton">Reset</button>
<!-- --------------------------------------------------------------------------------------------------------------- -->
	
	<f:hidden path="userVO.userId" value="${sessionScope.userID }"/>
	<f:hidden path="subjectVO.id" id="subjectVal"/>

  </f:form>
</div>
</body>
</html>