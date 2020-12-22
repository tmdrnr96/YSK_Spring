<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign in to Personal Online Banking</title>
		
		<!-- bank_login_form.css 스타일 시트 참조  -->
		<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/css/bank_login_form.css">
		<!--제이쿼리 적용..?  -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>
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
		
		//아이디 찾기
		function f_id() {
					//크롬에서는 window지원이 잘 안됨..
					//창크기 고정 필요..
					
			var url = 'find_id_form.do'; 
			window.open(url, "_blank","width=500, height=250, left=400, top=190, scrollbars=no, resizable=no");
		
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
						<td align = "center">
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