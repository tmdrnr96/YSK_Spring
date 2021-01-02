<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EzoBank Main Page</title>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bank_main.css">
		<style type="text/css">
		
		body{
		  background-image: url(resources/img/bank_building.jpg);
  		  background-size: cover;
		}
		</style>
		
	</head>
	
	<body>
		<!-- 로그인, 로그 아웃 서브메뉴를 띄워줄 JSP  -->
		<div class="login" align="center">
			<jsp:include page="../bank_login/session/bank_login_logout.jsp"/>
		</div>
		
		<div align="center">
			<jsp:include page="../slide/auto_slide.jsp"/>
		</div>
		
    <!-- <div class="greeting">
        <h1>환영합니다.<br>EzoBank 입니다.</h1>
    </div>
    
    
    <div class="other_buttons">
        <span><a href="#" class="main_btn">이체 및 송금</a></span>
        <span><a href="#" class="main_btn">이조뱅크에 대해서</a></span>
    </div>  -->
	</body>
</html>