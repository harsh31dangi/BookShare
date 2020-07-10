<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<h2>SignUp form</h2>
<f:form action="addUser" method="post" modelAttribute="SignupData">

Name : <f:input path="userName"/><br><br>
Contact Number : <f:input path="contactNumber"/><br><br>
College : <f:input path="college"/><br><br>
Email id : <f:input path="email"/><br><br>
Password : <f:input path="password"/><br><br>
<input type="submit" value="Save">
<input type="reset" value="Reset">


</f:form>
</body>
</html>