<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Online Banking Enrollment</title>
		
		<!--bank_join_form.css 스타일 시트 참조  -->
		<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/css/bank_join_form.css">
		
		<!-- Ajax 사용 준비 -->
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	
		<script type="text/javascript">	
		
/*------------------------- id 중복 체크 ------------------------- */
		
		/* Ajax 사용(중복 ID Check) */
		var check = "no";
		
		function id_check() {

			var id = document.getElementById("id").value.trim();
		
			if(id == ""){
				alert("ID를 입력해주세요.");
				return;
			}
			
			var url = "id_check.do";
			var param = "id"+id;
			
			sendRequest(url, param, id_result, "post");
			
		}
		
		function id_result() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;

				if(data == "yes"){
					check = "yes";
					alert("사용 가능한 아이디 입니다.");
				}else{
					alert("이미 사용 중인 아이디 입니다.");
				}
			}
		}
/*------------------------- id 중복 체크 ------------------------- */
/*----------------------- 비밀번호 type 변경 ----------------------- */
	function pwd_view() {

	alert("업데이트 중...");
		
	
	
	
	}
/*----------------------- 비밀번호 type 변경 ----------------------- */
/*------------------------- 회원가입 ------------------------- */
	
	//회원 정보 추가
	function join(f) {
			//유효성체크
			var id = f.id.value.trim();			
			var pwd = f.pwd.value.trim();
			var c_pwd = f.c_pwd.value.trim();
			var name = f.name.value.trim();
			var ssn = f.ssn1.value.trim() + "-" + f.ssn2.value.trim();
			var tel = f.tel1.value.trim() +"-"+ f.tel2.value.trim() +"-"+ f.tel3.value.trim();
			var email = f.email1.value.trim() +"@"+ f.email2.value.trim();
			var addr = f.addr.value.trim();
		
			//아이디
			if(id == ""){
				alert("아이디를 입력해주세요");
				return;
			}
			
			//아이디 중복체크 여부
			if(check != "yes"){
				alert("아이디 중복체크를 해주세요.");
				return;
			}
			
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
			
			//주민등록번호
			var pattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;			
			if(!pattern.test(ssn)){
				alert("주민번호 13자리를 입력해주세요.");
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
						
			//약관 동의
			//선택된 라디오 값 받기(선택되면 true, 아니면 false)
			var radio_value = document.getElementById("checkbox").checked;

			if(radio_value == false){
				alert("약관에 동의해주세요.");
				return;
			}
			
		
			// f.action = "insert.do";
			//f.method = "post";
			//f.submit();
			
			//Ajax로 회원 정보 추가!
			var url = "insert.do";
			var param = "name="+name"&ssn="+ssn"&tel="+tel"&email="+email"&addr="+addr"&id="+id"&pwd="+pwd;
						
			sendRequest(url, param, resultFn, "post");
			
		}	
		
		
/*------------------------- 회원가입 ------------------------- */		
		
		</script>
		
	</head>
	<body>
		<form>
			<h2 align = "center">Online Banking Enrollment</h2>
			<p align = "center">* Please enter your account information.</p>

			<table  align = "center">
				<tr>
					<th> User ID : </th>
					<td><input id = "id" name = "id"></td>
					<td class = "idpwd"><input type = "button" id = "c_id" name = "c_id" value = "Check" onclick = "id_check();"></td>
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
					<td><input name = "name"></td>
				</tr>
				<tr>
					<th> Social Security Number : </th>
					<td><input name = "ssn1" size = "5" maxlength="6"> - <input type = "password" name = "ssn2" size = "7" maxlength="7"></td>
				</tr>
				<tr>
					<th> Phone Number : </th>
					<td colspan = "2">(<input name = "tel1" maxlength= "3"size = "3">) - <input name = "tel2" maxlength= "4" size = "4"> - <input name = "tel3" maxlength= "4" size = "4"></td>
				</tr>		
				<tr>
					<th> Email : </th>
					<td colspan = "2"><input name = "email1" maxlength= "9" size = "6"> @ <input name = "email2" size = "13"></td>
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
						<input type = "checkbox" id ="checkbox" value = "">Agree
						<!-- <input type = "radio" name ="agree" value = "N">DisAgree -->
					</td>
				</tr>
				
				<!-- 계좌번호, 잔액 , 날짜 -->
			</table>
			<div align = "center">
				<input class = "btn" type = "button" value = "Sign up" onclick="join(this.form);">
				<input class = "btn" type = "button" value = "Cancel" onclick="history.go(-1);">
			</div>
		</form>
	</body>
</html>