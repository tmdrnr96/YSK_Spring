<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function send(f) {
			
			var title = f.title.value;
			var photo = f.photo.value;
			
			//유효성 체크
			if(title == ''){
				alert("제목을 입력하세요");
				return;
			}
			
			if(photo == ''){
				alert("전송할 사진이 필요합니다.");
				return;
			}
			
			f.action = "upload.do";
			f.submit();
			
		}//send
		</script>
	</head>
	<body>
		<!-- 파일 전송을 위한 form  -->
	 	<form method = "post"
	 		 enctype = "multipart/form-data">
	 	
	 		제목 : <input name = "title"><br>
	 		사진 : <input type = "file" name = "photo"><br>
	 		<input type = "button" value = "전송" onclick = "send(this.form);">
	 	</form>
	</body>
</html>