<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		function send1(f) {
		//낱개로 파라미터 전송
		var name = f.name.value;
		var tel = f.tel.value;
		var age = f.age.value;
		
		var num_pattern = /^[0-9]{1,3}$/;
		//만약.. age가 정수타입이 아니라면..
		if( !num_pattern.test( age ) ){
			alert("나이는 정수로 입력하세요");
			return;
		}
		
		f.action ="insert1.do";
		f.method = "post";
		f.submit();
		
		}
		
		function send2(f) {
		//묶어서 객체로 파라미터 전송	
			
			f.action ="insert2.do";
			f.method = "post";
			f.submit();
			
		}
		</script>
	</head>
	<body>
		<form>
		 	<table border = "1" align = "center">
		 	<caption><h2>:::회원정보:::</h2></caption>
		 		<tr>
		 			<th>이름</th>
		 			<td><input name = "name"></td>
		 		</tr>
		 		<tr>
		 			<th>나이</th>
		 			<td><input name = "age"></td>
		 		</tr>
		 		<tr>
		 			<th>전화</th>
		 			<td><input name = "tel"></td>
		 		</tr>
		 		
		 		<!--Controller로 파라미터 보내기!  -->
		 		<tr>
		 			<td colspan = "2" align = "center">
		 				<input type = "button" value = "낱개로 전송" onclick = "send1(this.form);">
		 				<input type = "button" value = "객체(묶어서)로 전송" onclick = "send2(this.form);">		 				
		 			</td>
		 		</tr>
		 	</table>
		</form>
	</body>
</html>