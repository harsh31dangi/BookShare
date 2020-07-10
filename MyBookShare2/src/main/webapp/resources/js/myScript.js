//for book
		function addToWishlist(id){
			var htp=new XMLHttpRequest();
			
			htp.onreadystatechange = function() {
				if(htp.responseText == "true"){
					console.log("true");
					document.getElementById("heart"+id).style.display="none";
					document.getElementById("redHeart"+id).style.display="";
				}
				else{
					console.log("else");
					document.getElementById("heart"+id).style.display="";
					document.getElementById("redHeart"+id).style.display="none";	
				}
			}
			htp.open("get","addToWishList?bookID="+id,true);
			htp.send();
		}
		
			function removeFromWishlist(id){
			
				var htp=new XMLHttpRequest();
				
				htp.onreadystatechange = function() {
					if(htp.responseText == "true"){
						console.log("true");
						document.getElementById("heart"+id).style.display="";
						document.getElementById("redHeart"+id).style.display="none";
					}
					else{
						console.log("else");
						document.getElementById("heart"+id).style.display="none";
						document.getElementById("redHeart"+id).style.display="";	
					}
				}
				htp.open("get","removeFromWishList?bookID="+id,true);
				htp.send();
		}
		
		function checkWishlist(id){
			console.log("checkwishlist called");
			var htp=new XMLHttpRequest();
			
			htp.onreadystatechange = function() {
				if(htp.responseText == "true"){
					console.log("checkWishlist true");
					document.getElementById("heart"+id).style.display="";
					document.getElementById("redHeart"+id).style.display="none";
				}
				else{
					console.log("checkWishlist false");
					document.getElementById("heart"+id).style.display="none";
					document.getElementById("redHeart"+id).style.display="";
				}
			}
			htp.open("get","checkInWishList?bookID="+id,true);
			htp.send();
		}
		
		function check() {
			var email=document.getElementById("email");
			var pass=document.getElementById("password");
			
			var htp=new XMLHttpRequest();
			htp.onreadystatechange = function() {
				if(htp.readyState == 4){
					var status=htp.responseText;
					console.log("in fun");
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
		
//for login
	  
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
		
//for sort and AddBook
		
		function sort() {
			var sub=document.getElementById("subject");
			var branch=document.getElementById("branch");
			var sem=document.getElementById("semester");
			var htp=new XMLHttpRequest();	
			htp.onreadystatechange = function(){
				if(htp.readyState==4){
					sub.innerHTML="";
					var op=document.createElement("option");
					op.text="--Select--";
					op.value="";
					sub.options.add(op);
					console.log(htp.responseText);
					
					var data=JSON.parse(htp.responseText);
					for(var i = 0;i < data.length;i++)
						{
							var op=document.createElement("option");
							op.value=data[i].id + "_" + data[i].subjectCode;
							op.text=data[i].subjectName;
							sub.options.add(op);
						}
					}
				}
			htp.open("get","getSubjects?sem="+sem.value+"&bran="+branch.value,true);
			htp.send();
		}
		
		function setSubject(){
			console.log("setSubject called");
			var sub=document.getElementById("subject").value.split("_");
			document.getElementById("subjectVal").value=sub[0];
			document.getElementById("subjectCode").value=sub[1];
		}
	