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
		
		<!--주소 찾기 API  -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
		<!--제이쿼리 적용..?  -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>
	
		<script type="text/javascript">	
	
/*------------------------- 주소 찾기 API ------------------------- */
		
    function DaumPostcode_API() {
        new daum.Postcode({
            oncomplete: function(data) {

                var extraRoadAddr = ''; // 참고 항목 변수

                // 참고 항목변수에 추가
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               		}
                
                // 건물명이 있고, 공동주택일 경우 참고 항목변수에 추가
                if(data.buildingName != '' && data.apartment == 'Y'){
                	extraRoadAddr += (extraRoadAddr != '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr != ''){
                    extraRoadAddr = '(' + extraRoadAddr + ')';
                }
             
                // 해당 주소에 대한 정보 저장
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddr").value = data.roadAddress + extraRoadAddr;
                document.getElementById("jibunAddr").value = data.jibunAddress + extraRoadAddr;                         

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr != ''){
                    document.getElementById("extraAddr").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddr").value = '';
                }                
            }
        }).open();
    }
/*------------------------- 주소 찾기 API ------------------------- */
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
			var param = "id="+id;
			
			sendRequest(url, param, id_result, "post");
			
		}
		
		function id_result() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
	
				if(data == "yes"){
					check = "yes";
					alert("사용 가능한 아이디 입니다.");
				}else{
					check = "no";
					alert("이미 사용 중인 아이디 입니다.");
				}
			}
		}
/*------------------------- id 중복 체크 ------------------------- */
/*----------------------- 비밀번호 type 변경 ----------------------- */
	var on_off = 'on';
		
	function pwd_view() {
		
		if(on_off == 'on'){
			pwd.type = 'text';
			c_pwd.type = 'text';			
			on_off = 'off';
			view.value = 'View Off';
			
		}else if(on_off == 'off'){
			pwd.type = 'password';
			c_pwd.type = 'password';			
			on_off = 'on';
			view.value = 'View On';
		}

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
		 	var postcode = f.postcode.value;
			var addr =  f.roadAddr.value +"/"+f.detailAddr.value.trim();  
		 	
			alert(postcode);
			
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
			
			//Ajax 사용(회원 정보 등록)
			var url = "insert.do";
			var param = "id="+id +"&pwd="+encodeURIComponent(pwd)+"&name="+name+"&ssn="+ssn+"&tel="+tel+"&email="+email+"&postcode="+postcode+"&addr="+addr; 
				
			sendRequest(url,param,join_result,"post")
			
		}	
		
		function join_result() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
			 	if(data != "yes"){
			 		alert("회원가입 실패..\n고객센터에 문의바랍니다.");
					return;				
			 	}
			 	 alert("회원가입 완료!");
				 location.href = "login.do";				
			 }
			 				 	
			}
	
/*------------------------- 회원가입 ------------------------- */		
		
		</script>
		
	</head>
	<body>
		<div class="login" align="center">
			<jsp:include page="../bank_login/session/bank_login_logout.jsp"/>
		</div>
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
					<td><input type = "password" id = pwd name = "pwd"></td> 
					<td class = "idpwd"><input type = "button" id = "view" name = "view" value = "View On" onclick = "pwd_view();"></td>		
				</tr>
				<tr>
					<th> Password Check : </th>
					<td><input type = "password" id = c_pwd name = "c_pwd"></td>
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
					<th rowspan ="3"> Address : </th>
					
				<!-- 주소 찾기 API --> 
					<td>
						<input type="text" id="postcode" placeholder="Postcode" readonly>
						<input type="button" id = "find_addr" onclick="DaumPostcode_API();" value="Find">
					</td>
				</tr>
				<tr>
					<td>						
						<input type="text" name = "roadAddr" id="roadAddr" placeholder="Address" size="30" readonly>
						<input type="hidden" name = "jibunAddr" id="jibunAddr" placeholder="Address"  size="30"readonly>
					</td>
				</tr> 
				<tr>
					<td>
						<input type="text" name = "detailAddr" id="detailAddr" placeholder="Detail Address"  size="30">
						<input type="hidden" name = "extraAddr" id="extraAddr" placeholder="참고항목"  size="30">
					</td>
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