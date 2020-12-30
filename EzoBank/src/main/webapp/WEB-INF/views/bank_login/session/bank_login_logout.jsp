<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
				
		ul, li{padding: 0; margin: 0;}	
			
		li{list-style: none;}
		
		a{text-decoration: none;}
		
		table{border-collapse:collapse;}
			
		img.title_icon{
				position:absolute;
				left:0px;
				top:0px;}
			
		#user_name{ font-weight: bold;}	
		
		#login{color: #fff;
				width: 200px;
				margin: 20px 0;}

		 
		.submenu{width: 1200px; 
				height: 45px; 
				text-align: left;
				padding: 6px 7px;
				margin: 0 auto;}
		 
		.submenu > li{float: right;
					position: relative;
					margin: 3px 10px;
					margin-left: 5px;
					width: 180px;
					margin-top: 40px;
					}
		
		.loglink{display: block;
				  font-weight: bold;
				  padding: 10px 10px;
				  color:#fff;
				  margin: 5px;
			   	  padding: 5px 15px;
			   	  border: 1px solid #fff;
			      border-radius: 15px;
			      transition:0.4s ease;
				  text-align: center;} 
		
		.submenu ul{position: absolute;
					left: 0; 
					top: 40px;
					width: 180px;
					display: none;}
					
		.loglink:hover{
				  font-weight:bold;
				  color: #000;
				  background-color: #fff;}	
				  
		.submenu li:hover ul{display: block;}	
					
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
	<!-- 로그인, 로그 아웃 서브메뉴를 띄워줄 JSP  -->
	<!-- 입금, 출금, 이체, 거래내역, 잔액 조회 등 모든 페이지 적용 (jsp:include)  -->	
	<c:if test="${empty sessionScope.user}">
		<div id = "main_list">
			<div class = "log">
				<ul class = "submenu">
					<li><a class="loglink" href = "login.do;">로그인</a></li>		
					<li><a class="loglink" href="#">이조뱅크?</a></li>			
				</ul>
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
					<ul class = "submenu">
						<li><a class="loglink" href = "logout.do;">로그아웃</a></li>			
						<li><a class="loglink" href="javascript:user_info_update('${user.idx}');">회원정보수정</a></li>
						<li>	
							<a class="loglink" href="#">계좌상세정보 </a>
						    <ul>
								<li><a class = "loglink" href = "#">입금</a></li>
								<li><a class = "loglink" href = "#">출금</a></li>
								<li><a class = "loglink" href = "#">이체</a></li>
								<li><a class = "loglink" href = "#">거래 내역</a></li>
								<li><a class = "loglink" href = "#">잔액 조회</a></li>								
							</ul>	
						</li>
						<li><span id = "login"><span id = "user_name">${user.name}</span>님 안녕하세요.</span></li>
					</ul>
				</div>
			</div>		
		</c:if>	
		<div class = "img">
			<a id = "img" href="main.do">
	            <img class="title_icon" src="${pageContext.request.contextPath}/resources/img/logo.png";>
	        </a>
	    </div>	
		
	</body>
</html>