<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	
	<script type="text/javascript">
	
		function sort() {
			var sub=document.getElementById("subject");
			var branch=document.getElementById("branch");
			var sem=document.getElementById("semester");

			var htp=new XMLHttpRequest();	
			htp.onreadystatechange = function(){
				if(htp.readyState==4){
					sub.innerHTML="";
					var data=JSON.parse(htp.responseText);
					for(var i = 0;i < data.length;i++)
						{
							var op=document.createElement("option");
							op.value=data[i].subjectCode;
							op.text=data[i].subjectName;
							sub.options.add(op);
						}
					}
				}
			htp.open("get","getSubjects?sem="+sem.value+"&bran="+branch.value,true);
			htp.send();
		}
	
	</script>
</head>
<body>
    <div class="container" style="width: 100%;height:auto;margin: 30px;">
        Semester : <select id="semester" onchange="sort()">
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
        <br><br>
        Branch : <select id="branch" onchange="sort()">
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
        <br><br>
        Subject : <select id="subject">
            <option>--Select--</option>
            </select>
            <br><br>
        <button type="button" class="btn btn-block btn-info" onclick="sort()">Sort</button>
    </div> 
</body>
</html>