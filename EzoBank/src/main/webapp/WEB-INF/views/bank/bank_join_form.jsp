<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>	
		h2{height: 30px;
		   margin: 40px 0 10px 0;}
		   
		p{height: 20px; color:grey;}
			
		th,td{padding : 8px;}
		
		#c_id, #view{width: 80px;
					 height: 25px;
					 font-weight: bold;
					 color : white;
					 background-color: grey;
					 border:0; 
					 outline: 0;}
				
		[type=button]:hover{background-color:black;}				 
		input[type=button]:hover{background-color:black;}			 
					 
		.btn{margin: 20px;
			 width: 200px;
			 height: 35px;
			 font-weight: bold;
			 color : white;
			 background-color: grey;
			 border:0; 
			 outline: 0;}
		
		#txt{resize:none;
			 margin-top: 30px;}
		
		</style>
		
	</head>
	<body>
		<form>
			<h2 align = "center">Online Banking Enrollment</h2>
			<p align = "center">* Please enter your account information.</p>
			<table  align = "center">
				<tr>
					<th> User ID : </th>
					<td><input name = "id"></td>
					<td class = "idpwd"><input type = "button" id = "c_id" name = "c_id" value = "Check"></td>
				</tr>
				<tr>
					<th> User Password : </th>
					<td><input type = "password" name = "pwd"></td>
					<td class = "idpwd"><input type = "button" id = "view" name = "view" value = "View" onclick = "view();"></td>		
				</tr>
				<tr>
					<th> Password Check : </th>
					<td><input type = "password" name = "c_pwd"></td>
				</tr>
				
				<tr>
					<th> User Name : </th>
					<td><input name = "name"></td>
				</tr>
				<tr>
					<th> Social Security Number : </th>
					<td><input name = "ssn1" size = "5" maxlength="6"> - <input type = "password" name = "ssn2" size = "7" maxlength="7"></td>
				</tr>
				<tr>
					<th> Phone Number : </th>
					<td colspan = "2">(<input name = "tel1" size = "3">) - <input name = "tel2" size = "4"> - <input name = "tel3" size = "4"></td>
				</tr>		
				<tr>
					<th> Email : </th>
					<td colspan = "2"><input name = "email1" size = "6"> @ <input name = "email2" size = "13"></td>
				</tr>		
				<tr>
					<th> Address : </th>
					<td colspan = "2"><input name = "addr" size = "29"></td>
				</tr>
				<tr>
					<td colspan = "3" align = "center">
						<textarea id = "txt" rows="10" cols="65" disabled="disabled">${content}</textarea>
					</td>				
				</tr>
				<tr>
					<td align = "right" colspan = "3">
						<input type = "checkbox" name ="checkbox" value = "y">Agree
					</td>
				</tr>
				<!-- 이름, 주민번호, 전화번호, 주소, 아이디, 
				
				계좌번호, 잔액 , 날짜 -->
			</table>
			<div align = "center">
				<input class = "btn" type = "button" value = "Sign up" onclick="join(this.form);">
				<input class = "btn" type = "button" value = "Cancel" onclick="history.go(-1);">
			</div>
		</form>
	</body>
</html>