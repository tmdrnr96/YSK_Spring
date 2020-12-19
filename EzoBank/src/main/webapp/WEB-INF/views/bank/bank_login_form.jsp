<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign in to Personal Online Banking</title>
		<style type="text/css">
		
		#title{width : 300px; margin : 20px 0;}
		
		#table{ margin:50px auto;
				width: 1000px; 
				height : 190px;
				text-align: center;}
				
		.btn_log {width : 260px;
				  height : 40px;
				  margin : 10px 0;
				  font-size: 15px;
				  font-weight: bold;
				  border:0; 
				  outline:0;
				  background-color: grey; 
				  color : white;}

		.log{width: 250px;
			height: 25px;}
		
		#find{margin-top: 80px;
			  margin-bottom: 25px;}
		
		.j{color: red;}
		
		.f{margin : 0 10px;  color: grey;}	  

			
		a{text-decoration: none;}
		
				
		#find a:hover{color: black; text-decoration: underline;}		
		#join a:hover{text-decoration: underline;}	
		
		/* 버튼 hover 효과  */	
		input[type=button]:hover{background-color:black; color: white;}
			
		</style>
		<script type="text/javascript">
		function sign(f) {
			
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			
			if(id == ""){
				alert("User ID를 입력해주세요.");
				return;
			}
			
			if(pwd == ""){
				alert("User Password를 입력해주세요.");
				return;
			}
			
//			f.method = "post";
//			f.action = "";
//			f.submit();
				
		}
		</script>
	</head>
	<body>
		<form>
			<div id = "table">
				<table align = "center">
				<caption id = "title" ><h2>Personal Online Banking</h2></caption>
					<tr>						
						<td><input class = "log" name = "id" placeholder="User ID" ></td>
					</tr>
					<tr>						
						<td><input class = "log" type = "password" name = "pwd" placeholder="User Password"></td>
					</tr>
					
					<tr>
						<td class = "buttons" align = "center">
							<input type = "button" class = "btn_log" value = "Sign up" onclick = "sign(this.form);" >					
						</td>
					</tr>	
				</table>
			</div>					
		</form>
		<div id = "find" align = "center">
			Forgot <a class = "f" href = "javascript:f_id();">Account ?</a> | 
				   <a  class = "f" href = "javascript:f_pwd();">Password ?</a>		
		</div>
		
		<div id = "join" align = "center">
			  <a class = "j" href = "join_form.do;"> Sign up for an Account </a>	
		</div>
	</body>
</html>