<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">

		
	   #main_list{
			width: 1200px;
			text-align: left;
			text-decoration: none;
			color: white;
			}
	
		.log{
			text-align: right;
			margin-top: 50px;
			margin-right: 20px;
			color:#fff;	
			}
			
		
		img.title_icon{
			position:absolute;
			left:30px;
			top:40px;
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
		
		#user{
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
	<c:if test="${empty sessionScope.user}">
		<div id = "main_list">
			<div class = "log">
				<a class="loglink" href="#">이조뱅크?</a>			
			&nbsp;|&nbsp;
				<a class="loglink" href = "login.do;">로그인</a>		
			</div>	
		</div>
	</c:if>    
	
	<c:if test = "${!empty sessionScope.user}">
		<!--회원 정보 수정을 위한 idx -->
		<form name = "post">
			<input type="hidden" value = "${user.idx}" name = "idx" >
		</form>			
			<div id = "main_list">
				<div class = "log">
					<span id = "login"><span id = "user">${user.name}</span>님 안녕하세요.</span>
					&nbsp;|&nbsp;
						<a class="loglink" href="#">계좌상세정보</a>	
					&nbsp;|&nbsp;
						<a class="loglink" href="javascript:user_info_update('${user.idx}');">회원정보수정</a>			
					&nbsp;|&nbsp;
						<a class="loglink" href = "logout.do;">로그아웃</a>			
				</div>
			</div>		
		</c:if>	
		<div class = "img">
			<a id = "img" href="main.do">
	            <img class="title_icon" src="${pageContext.request.contextPath}/resources/img/logo_1.png";>
	        </a>
	    </div>	
		
	</body>
</html>