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
			var addr = f.roadAddr.value +"/"+f.detailAddr.value.trim();
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
					<th rowspan = "3"> Address : </th>
					<!-- 주소 찾기 API --> 
					<td>
						<input type="text" id="postcode" placeholder="우편번호" readonly>
						<input type="button" id = "find_addr" onclick="DaumPostcode_API();" value="Find">
					</td>
				</tr>
				<tr>
					<td>						
						<input type="text" name = "roadAddr" id="roadAddr" placeholder="도로명주소" size="30" value = '${addr1}' readonly>
						<input type="hidden" name = "jibunAddr" id="jibunAddr" placeholder="지번주소"  size="30" value = '${addr1}' readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name = "detailAddr" id="detailAddr" placeholder="상세주소"  value = '${addr2}' size="30">
						<input type="hidden" name = "extraAddr" id="extraAddr" placeholder="참고항목"  size="30">
					</td>
				</tr>

			</table>
			
			<div align = "center">
				<input class = "btn" type = "button" value = "Update" onclick="user_info(this.form);">
				<input class = "btn" type = "button" value = "Cancel" onclick="history.go(-1);">
			</div>
		</form>	
		
	</body>
</html>