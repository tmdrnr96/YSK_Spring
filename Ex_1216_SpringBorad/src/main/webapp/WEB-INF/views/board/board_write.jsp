<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function send_check() {
			var f = document.f;
			
			if( f.subject.value == '' ){
				alert("제목을 입력하세요");
				return;
			}
			
			if( f.name.value == '' ){
				alert("작성자를 입력하세요");
				return;
			}
			
			if( f.content.value.trim() == '' ){
				alert("내용은 한 글자 이상 입력해야 합니다");
				return;
			}
			
			if( f.pwd.value.trim() == '' ){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			f.submit();
			
		}
	</script>

</head>
<body>
	<table border="1" align="center">
	
		<form name="f" method="post" action="insert.do">
		
			<tr>
				<td width="120">제목</td>
				<td>
					<input name="subject" style="width:250px;">
				</td>
			</tr>
		
			<tr>
				<td width="120">작성자</td>
				<td>
					<input name="name" style="width:250px;">
				</td>
			</tr>
		
			<tr>
				<td width="120">내용</td>
				<td>
					<textarea name="content" rows="10" cols="70"></textarea>
				</td>
			</tr>
		
			<tr>
				<td width="120">비밀번호</td>
				<td>
					<input name="pwd" type="password" style="width:250px;">
				</td>
			</tr>
		
			<tr>
				<td align="center" colspan="2">
					<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
					     onclick="send_check();"
					     style="cursor:pointer;">
					     
					<img src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
					     onclick="location.href='list.do'"
					     style="cursor:pointer;">
				</td>
			</tr>
		
		</form>
		
	</table>
</body>
</html>












