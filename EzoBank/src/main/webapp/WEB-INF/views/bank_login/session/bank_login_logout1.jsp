<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		
		body{
			background-color:grey;
   			background-size: cover;	
	   		height: 20px;
	   		 }
		
	   #main_list{
			width: 1200px;
			text-align: left;
			text-decoration: none;
			color: white;
			}
	
		#log{
			text-align: right;
			margin-top: 40px;
			
			}
		#img{
			margin-top: -10px;
			margin-left: 10px;
		}
		  	
		.loglink{
		  color: #fff;
   		  
   		  margin: 5px;
   		  padding: 5px 15px;
   		  border: 1px solid #fff;
    	  border-radius: 15px;
    	  transition:0.4s ease;
    	  text-decoration: none;

		}
				
		.loglink:hover{
		  font-weight:bold;
		  color: #000;
		  background-color: #fff;	  
		}
		
		#login{
			color: white;
		}
			
		</style>
		
	</head>
	<body>
	
	<!-- 입금, 출금, 계좌내역(잔금) - 메인 페이지를 제외한 모든 페이지 적용   -->	
		<div id = "main_list">
		<div id = log>
				<a class="loglink" href="#">이조뱅크?</a>			
			&nbsp;|&nbsp;
				<a class="loglink" href = "login.do">로그인</a>		
		</div>
			<a id = "img" href="main.do">
	            <img class="title_icon" src="${pageContext.request.contextPath}/resources/img/logo_1.png";>
	        </a>
		<div id = "menu">
			<!--메뉴 리스트 만들기.  -->
		</div>
		
		</div>
	</body>
</html>