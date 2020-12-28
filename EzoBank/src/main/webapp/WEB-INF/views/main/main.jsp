<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EzoBank Main Page</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bank.css">
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
			<jsp:include page="../bank_login/session/bank_login_logout.jsp"/>
		</div>
		
    <div class="greeting">
        <h1>환영합니다,<br>EzoBank 입니다.</h1>
    </div>
    
    <div class="other_buttons">
        <ul>
            <li><a href="#" class="btn">이체 및 송금</a></li>
            <li><a href="#" class="btn">이조뱅크에 대해서</a></li>
        </ul>
    </div> 
	</body>
</html>