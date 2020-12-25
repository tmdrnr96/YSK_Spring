<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
		
		function user_info(f) {

			var pwd = f.pwd.value.trim();
			var c_pwd = f.c_pwd.value.trim();
			var name = f.name.value.trim();
			var ssn = f.ssn1.value + "-" + f.ssn2.value;
			var account = f.account1.value + "-" + f.account2.value + "-" + f.account3.value;
			var tel = f.tel1.value.trim() +"-"+ f.tel2.value.trim() +"-"+ f.tel3.value.trim();
			var email = f.email1.value.trim() +"@"+ f.email2.value.trim();
			var addr = f.addr.value.trim();
			var idx = f.idx.value;
			
			//변경 가능한 것들에 대한 유효성 체크			
			//비밀번호
			if(pwd == ""){
				alert("비밀번호를 입력해주세요.");								
				return;
			}
			
			//비밀번호 체크
			if(c_pwd != pwd){
				alert("Password Check를 다시 확인해주세요.");
				return;
			}
			
			//이름
			if(name == ""){
				alert("이름을 입력해주세요.");
				return;
			}
			
			//전화번호
			var pattern = /^\d{3}-\d{3,4}-\d{4}$/;
			if(!pattern.test(tel)){
				alert("전화 번호를 다시 입력해주세요.");
				return;
			}
			
			//이메일
			var pattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
			if(!pattern.test(email)){
				alert("이메일 형식이 올바르지 않습니다.");
				return;
			}
			
			//주소
			if(addr == ""){
				alert("주소를 입력해주세요.");
				return;
			}
			
			var param = "idx="+idx+"&pwd="+encodeURIComponent(pwd)+"&name="+name+"&ssn="+ssn+"&account="+account+"&tel="+tel+"&email="+email+"&addr="+addr;
			var url = "user_modified.do";
			
			sendRequest(url,param,result,"post");
		}
		
		function result() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
				if(data != "yes"){
					alert("회원 정보 수정 실패..\n고객센터에 문의하세요.");
					return;
				}
				
				alert("회원 정보 수정 성공!");
				location.href="main.do";
				
			}
		}
		
		</script>
	
	</head>
	
	<body>
		<!--로그인 없이 이용 불가능  -->
		<!--아이디, 주민번호, 계좌번호 수정 불가 이외 수정 가능  -->
		<!-- 수정시 비밀번호를 입력   -->
		<div class="login" align="center">
			<jsp:include page="../bank_login/session/bank_login_logout.jsp"/>
		</div>
		<form>		
			<h2 align = "center">Online Banking Modified</h2>
			<input type = "hidden" name = "idx" value = ${user.idx}>
			<table  align = "center">
				<tr>
					<th> User ID : </th>
					<td><input id = "id" name = "id" value = ${user.id} readonly></td>
				</tr>
				<tr>
					<th> User Password : </th>
					<td><input type = "password" name = "pwd"></td>
					<td class = "idpwd"><input type = "button" id = "view" name = "view" value = "View" onclick = "pwd_view();"></td>		
				</tr>
				<tr>
					<th> Password Check : </th>
					<td><input type = "password" name = "c_pwd"></td>
				</tr>				
				<tr>
					<th> User Name : </th>
					<td><input name = "name" value = ${user.name}></td>
				</tr>
				<tr>
					<th> Social Security Number : </th>
					<td><input name = "ssn1" size = "5" maxlength="6" value=${ssn1} readonly> - <input type = "password" name = "ssn2" size = "7" maxlength="7" value =${ssn2} readonly></td>
				</tr>
				<tr>
					<th> Account Number : </th>
					<td colspan = "2"><input name = "account1" maxlength= "3"size = "3" value =${account1} readonly> - <input name = "account2" maxlength= "2" size = "2" value =${account2} readonly> - <input name = "account3" maxlength= "6" size = "6" value =${account3} readonly></td>
				</tr>
				<tr>
					<th> Phone Number : </th>
					<td colspan = "2">(<input name = "tel1" maxlength= "3"size = "3" value =${tel1}>) - <input name = "tel2" maxlength= "4" size = "4" value =${tel2}> - <input name = "tel3" maxlength= "4" size = "4" value =${tel3}></td>
				</tr>		
				<tr>
					<th> Email : </th>
					<td colspan = "2"><input name = "email1" maxlength= "9" size = "6" value =${email1}> @ <input name = "email2" size = "13" value =${email2}></td>
				</tr>		
				<tr>
					<th> Address : </th>
					<td colspan = "2"><input name = "addr" size = "29" value = "${user.addr}"></td>
				</tr>

			</table>
			
			<div align = "center">
				<input class = "btn" type = "button" value = "Update" onclick="user_info(this.form);">
				<input class = "btn" type = "button" value = "Cancel" onclick="history.go(-1);">
			</div>
		</form>	
		
	</body>
</html>