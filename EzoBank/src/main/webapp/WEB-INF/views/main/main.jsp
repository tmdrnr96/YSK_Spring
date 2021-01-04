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
		
		<!--main 페이지1-->
		<div class = "main_box1">
			<!--main 1  -->
			<div class = "sub_box">
				<p id = "title" style="display: inline;">소상공인 금융지원 상품 안내</p><br>
				
				<p id = "sub_title" style="display: inline;">코로나19 피해를 입은 소상공인 여러분 응원합니다.</p>
				
				<img id = "main_img" alt="소상공인" src="${pageContext.request.contextPath}/resources/img/main_image.png"
					width="450px;" height="260px;">
				
				<div class="function_box1">
					<ul>
						<li class = "function1">
							<a href = "#">
								<img class = "bank_image1" alt="출금" src="${pageContext.request.contextPath}/resources/img/withdrawal_image.png" width="80px;" height="80px;" >
									출금
							</a>
						</li>
						<li class = "function1">
							<a href = "#">
								<img class = "bank_image1" alt="출금" src="${pageContext.request.contextPath}/resources/img/transfer_image.png" width="80px;" height="80px;" >
									이체
							</a>
						</li>
						<li class = "function1">
							<a href = "#">
								<img class = "bank_image1" alt="출금" src="${pageContext.request.contextPath}/resources/img/search_image.png" width="80px;" height="80px;" >
									잔액조회
							</a>
						</li>
					</ul>
				</div>	
			</div>				
		</div>
		
		<!--main2 -->
		<div class = "main_box2">
			
			<!--배너 JSP  -->
			 <div align="center">
				<jsp:include page="../slide/auto_slide.jsp"/>
			</div>
			<div class = "function2">
				<ul>
					<li class = "function2"><a href = "#"><img class = "bank_image2" alt="EzoBank" src="${pageContext.request.contextPath}/resources/img/bank.png" width = "100px;" height="100px;">
							EzoBank
						</a>
					</li>
					<li class = "function2"><a href = "#"><img class = "bank_image2" alt="EzoBank" src="${pageContext.request.contextPath}/resources/img/bank.png" width = "100px;" height="100px;">
							EzoBank
						</a>
					</li>					
					<li class = "function2"><a href = "#"><img class = "bank_image2" alt="EzoBank" src="${pageContext.request.contextPath}/resources/img/bank.png" width = "100px;" height="100px;">
							계좌생성
						</a>
					</li>
					<li class = "function2"><a href = "#"><img class = "bank_image2" alt="EzoBank" src="${pageContext.request.contextPath}/resources/img/bank.png" width = "100px;" height="100px;">
							EzoBank
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<%-- <footer>
			<div id = "footer" align="center">
				<%@include file="../footer/bank_footer.jsp"%>
			</div>
		</footer> --%>
	</body>		
		
    <!-- <div class="greeting">
        <h1>환영합니다.<br>EzoBank 입니다.</h1>
    </div>
    
    
    <div class="other_buttons">
        <span><a href="#" class="main_btn">이체 및 송금</a></span>
        <span><a href="#" class="main_btn">이조뱅크에 대해서</a></span>
    </div>  -->
</html>