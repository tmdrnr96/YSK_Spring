<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/view.css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

<style type="text/css">
	.box{
		background-image: url("https://imagescdn.gettyimagesbank.com/500/201607/a10517270.jpg");
	 	background-position: center;
        background-size: cover;
	 	
	 	width: 500px;
	 	height: 300px;
	 	margin: 150px auto;
	 	
	}
	
	#title{
		font-family: 'Do Hyeon', sans-serif;
		font-size: xx-large;
		padding-left: 40px;
		padding-top: 20px;
		
	}
	
	#con1{
		margin-left:220px;
		margin-top: 10px;
	}
	
	#con2{
		margin-top: 125px;
		margin-left: 75px;
	}
	
	#con3{
		margin-top: 40px;
		margin-left: 220px;
	}
	
	#content p{
		font-family: 'Nanum Gothic', sans-serif;
		
		font-size: large;
		margin-bottom: 0px;
		position: absolute; 
	}

	#det{
		margin-left: 230px;
		margin-top: 125px;
		border-radius: 10px;
		
	}
</style>

<script type="text/javascript">

	function detail(f) {
		
		f.action="det.do";
		f.method="post";
		f.submit();
		
	}

	
</script>


</head>
<body>
<%-- <%@ include file= "../bank_login/session/bank_login_logout.jsp" %> --%>
<form>

	<div class="box">
	
	 	<p id="title"> 입출금 계좌 </p>
	 	<input type = "hidden" value = ${vo.idx} name = "idx">
		 	<div id="content">
			 	
				<p id="con1"> 계좌번호 : ${vo.account }</p>
				<p id="con3"> 잔액 : ${vo.balance} 원</p>
				<p id="con2"> ${vo.name} 통장</p>
				<input id="det" type="button" value="상세정보" onclick="detail(this.form);"> 
			
			</div>
		
	</div>
	
</form>		
	
	
</body>
</html>