<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file= "../bank_login/session/bank_login_logout.jsp" %>
<meta charset="UTF-8">
<title>상세보기</title>
<link href="${ pageContext.request.contextPath}/resources/css/detail.css?after" rel="stylesheet">
	<script type="text/javascript">
	
		function find() {
			var detail = document.getElementById("det").value;
			//alert(detail);
			location.href="detail_view.do?detail="+detail;		
		}
	
	</script>
	<style type="text/css">
	
	body{
    background-image: url(resources/img/bank_building.jpg);
    background-size: cover;
    height: 1000px;
	}
	
	
	
	</style>
	
</head>
<body>
	
	<div align="center" class="box">
	
		<div>
			<h1>계좌 입∙출금 내역</h1>
			
			<div class="choice">
			<select id="det">
				<option value="0">계좌를 선택하십시오 </option>
				<option value="10">입∙출금 계좌</option>
				<option value="20">적금</option>
			</select>
			</div>
			
			<input type="button" value="검색" onclick="find();">
			
		
		</div>
	
		<hr>
	
		<table border="1" align="center">
			<caption>:::계좌 상세보기 :::</caption>
		
			<tr>
				<th>날짜</th>
				<th>항목</th>
				<th>입금</th>
				<th>출금</th>
				<th>항목잔액</th>
			</tr>
				
				<c:if test="${ empty list }">
					<td colspan="6">내역 없음</td>
				</c:if>	
				
				<c:if test="${ !empty list }">
					<c:forEach var="vo" items="${ list }">
						<tr>
							<td>${vo.usedate}</td>				
							<td>${vo.content}</td>				
							<td>${vo.deposit}</td>				
							<td>${vo.withdraw}</td>	
							<td>${vo.balance }</td>			
						</tr>
					</c:forEach>
				</c:if>	
		
		</table>
		
		<a href="main.do?idx=${ vo.idx }" style="text-decoration: none;">나가기</a>
</div>
	<div id = "footer"  align="center">
			<%@include file="../footer/bank_footer.jsp"%>
		</div>
</body>
</html>