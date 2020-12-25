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
		
		#name{
			font-weight: bold;
		}		
		</style>
		
		<script type="text/javascript">
		function user_info_update(idx) {

			var f = document.post;
			
			f.idx.value = idx;
			
			f.action = "user_info.do";
			f.method = "post";
			f.submit();
			
		}
		</script>
	</head>
	<body>
	
	<!-- 입금, 출금, 계좌내역(잔금) - 메인 페이지를 제외한 모든 페이지 적용   -->	
	<c:if test="${ empty sessionScope.user}">
			<script>
				alert("로그인 후 이용하세요");
				location.href="login.do";
			</script>
	</c:if>    
		
		<!--회원 정보 수정을 위한 idx -->
		<form name = "post">
			<input type="hidden" value = "${user.idx}" name = "idx" >
		</form>
			
			
		<div id = "main_list">
		<div id = log>
			<span id = "login"><span id = "name">${user.name}</span>님 안녕하세요.</span>
			&nbsp;|&nbsp;
				<a class="loglink" href="javascript:user_info_update('${user.idx}');">회원정보수정</a>			
			&nbsp;|&nbsp;
				<a class="loglink" href = "logout.do;">로그아웃</a>			
		</div>
			<a id = "img" href="#">
	            <img class="title_icon" src="${pageContext.request.contextPath}/resources/img/logo_1.png";>
	        </a>
		<div id = "menu">
			<!--메뉴 리스트 만들기.  -->
		</div>
		
		</div>
	</body>
</html>