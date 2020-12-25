<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EzoBank Main Page</title>
		<style type="text/css">
		
		/*(임시) 배경화면 적용이 잘 안됨.. */
		body{
		  background-image: url(resources/img/bank_building.jpg);
  		  background-size: cover;
		}
		</style>
		
	</head>
	
	<body>
		<div class="login" align="center">
			<jsp:include page="../bank_login/bank_login_logout.jsp"/>
		</div>
		<p>aa</p>
	</body>
</html>