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
<f:form action="insertBook" method="post" modelAttribute="Book">
Book name : <f:input path="bookName"/> <br><br>
Author Name : <f:input path="authorName"/> <br><br>
Edition Name : <f:input path="edition"/><br><br>
Publication : <f:input path="publication"/><br><br>
Total pages : <f:input path="totalPages"/><br><br>
Condition : <f:input path="bookCondition"/><br><br>
Front image : <f:input path="frontImage"/><br><br>
Back Image : <f:input path="backImage"/><br><br>
Subject name : <f:input path="subjectVO.subjectName"/><br><br>
Subject Code : <f:input path="subjectVO.subjectCode"/><br><br>
Semester : <f:input path="subjectVO.semester"/>

<input type="submit" value="ADD"><input type="reset" value="Reset">

</f:form>
</body>
</html>