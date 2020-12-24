<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Find_User_Password</title>
		<!-- Ajax 사용 준비 -->
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			
			var name;
			var id;
			var ssn;
			
		function find_pwd(f) {
			
			name = f.name.value.trim();
			id = f.id.value.trim();
			ssn = f.ssn1.value +"-"+ f.ssn2.value;

			//유효성체크 
			//이름
			if(name == ""){
				alert("이름을 입력해주세요.");
				return;
			}
			
			//아이디
			if(id == ""){
				alert("USer ID를 입력해주세요.");
				return;
			}
			
			//주민등록번호
			var pattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;			
			if(!pattern.test(ssn)){
				alert("주민번호 13자리를 입력해주세요.");
				return;
			}
			
			var url = "find_pwd.do";
			var param = "name="+name+"&id="+id+"&ssn="+ssn;
			
			sendRequest(url, param, result,"post");			
		}
		
		function result() {
			
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			if(data != "yes"){
				alert("가입되어 있지 않은 정보입니다.\n회원가입을 진행해 주세요!");
				window.close();
				
			}else{				
				alert( name +"님,\n새로운 비밀번호를 설정해주세요.");
				
				window.close();
				
				//스크립트 POST 전송
				//유니크 값인 주민번호를 POST로 전송해서 해당 정보 검색 후 비밀번호 변경
				var form = document.createElement("form");

				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post"); // Get 또는 Post 입력
				form.setAttribute("action", "bank_new_pwd.do");
				
				var hiddenField = document.createElement("input");
				
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "ssn");
				hiddenField.setAttribute("value", ssn);
				form.appendChild(hiddenField);

				var url ="bank_new_pwd.do"

					var title = "Change Password"

					var status = "width=500, height=250, left=400, top=190, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no"

					window.open("", title,status); //팝업 창으로 띄우기. 원치 않으면 주석.
					 
					form.target = title;

					document.body.appendChild(form);
					 
					form.submit();

				
				}
			}
			
		}
		
		</script>
	</head>
	<body>
		<form>
			<h2 align = "center">Find User Password</h2>
			<table align = "center">
				<tr>
					<th>User Name : </th>
					<td><input id = "name" name = "name"></td>
				</tr>
					<th>User ID : </th>
					<td><input id = "id" name = "id"></td>
				<tr>
					<th>Social Security Number : </th>
					<td><input id = "ssn1" name = "ssn1" maxlength="6" size = "6"> - <input type = "password" id = "ssn2" name = "ssn2" maxlength="7" size = "7"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
					<input type = "button" class = "btn" value = "Find" onclick = "find_pwd(this.form);">
					<input type = "button" class = "btn" value = "Cancel" onclick = window.close();>
					</td>			
				</tr>
			</table>		
		</form>
	</body>
</html>