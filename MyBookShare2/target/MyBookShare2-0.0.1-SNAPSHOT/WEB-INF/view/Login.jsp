<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	function check() {
		var email=document.getElementById("email");
		var pass=document.getElementById("pass");
		
		var htp=new XMLHttpRequest();
		htp.onreadystatechange = function() {
			if(htp.readyState == 4){
				var status=htp.responseText;
				
				if(status=="true")
					window.location.href="home";
				else
					{
						document.getElementById("h3").style.display="";
						console.log("invalid");
					}
			}
		}
		htp.open("get","validateUser?em="+email.value+"&pw="+pass.value,true);
		htp.send();
	}
</script>

</head>
<body>

Email id : <input type="text" id="email"> <br>
Password : <input type="password" id="pass"><br>
<h3 id="h3" style="display:none">Invalid Credentials</h3>
<input type="submit" value="Save" onclick="check()">
<input type="reset" value="Reset">

</body>
</html>