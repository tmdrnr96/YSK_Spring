<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
		
		//비밀번호 수정(기존 비밀번호는 사용 x) 
		function change(f) {
						
			var ssn = f.ssn.value;
			var pwd = f.pwd.value.trim();
			var c_pwd=f.c_pwd.value.trim();
			
			//유효성체크
			if(pwd == "" || c_pwd == ""){
				alert("사용하실 Password를 입력해주세요.");
				return;
			}
			
			if(pwd != c_pwd){
				alert("비밀번호가 일치하지 않습니다.\n다시확인해주세요.");
				return;
			}
			
			var url = "change_password.do";
			var param = "ssn="+ssn+"&pwd="+encodeURIComponent(pwd);
			
			sendRequest(url, param, result, "post");			
		}
		
		function result() {
			
		if(xhr.readyState == 4 && xhr.status == 200){

			var data = xhr.responseText;
			
			if(data != "yes"){
				alert("Password 변경 실패..\n고객 센터로 연락바랍니다.");
			}else{
				alert("Password 변경 완료!\n");		
			}
			window.close();
			return;
			}
		}
			
		
	
		
		</script>
	</head>
	<body>
		<h2 align = "center" >Change Password</h2>
		<form>
			<input type = "hidden" name = "ssn" value = "${param.ssn}">
			<table align = "center">
				<tr>
					<th>New Password : </th>
					<td><input type = "password" id = "pwd" name = "pwd"></td>
				</tr>
				<tr>
					<th>Confirm Password : </th>
					<td><input type = "password" id = "c_pwd" name = "c_pwd"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type= "button" class = "btn" value = "Change" onclick = "change(this.form);">
						<input type= "button" class = "btn" value = "Cancel" onclick = window.close();>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>