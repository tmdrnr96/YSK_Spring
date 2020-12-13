<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">		
		function send(f) {
			//유효성체크

			var url = "modify.do";
			var param ="idx=" + f.idx.value + 
					   "&name=" + f.name.value + 
					   "&context=" + encodeURIComponent(f.context.value) +
					   "&pwd=" + encodeURIComponent(f.pwd.value);
			sendRequest(url,param,myFn,"post");
			
		}
		
		function myFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				
				//yes, no로 넘어온다(제이슨 x)
				if(data == 'no'){
					alert("수정 실패");
					return;
				}
					alert("수정 성공");
					location.href = "list.do";
			}
		}
		
		</script>
	</head>
	<body>
		<form>
		
		<input type = "hidden" name = "idx" value = "${vo.idx}">
		 
			<table border = "1" align ="center">
				<caption>:::방명록 수정하기:::</caption>
				<tr>
					<th>작성자</th>
					<td><input name = "name" value = "${vo.name}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name ="context" rows="5" cols="50">${vo.context}</textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type = "password" name = "pwd" value = "${vo.pwd}"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "button" value= "수정완료 " onclick = "send(this.form);">
						<input type = "button" value= "목록으로" onclick = "location.href='list.do';">
					</td>
				</tr>		
			</table>
		</form>
	</body>
</html>