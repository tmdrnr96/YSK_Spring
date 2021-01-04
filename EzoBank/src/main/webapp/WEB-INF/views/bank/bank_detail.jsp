<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
	<script type="text/javascript">
	
		function find() {
			var detail = document.getElementById("detail").value;
			location.href="list.do?detail="+detail;		
		}
	
	</script>
</head>
<body>
	
	<div align="center">
			상세보기
			<select id="det">
				<option value="0">항목을 선택하십시오 </option>
				<option value="10">입∙출금 계좌</option>
				<option value="20">적금</option>
			</select>
			
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
							<td>${vo.sysdate}</td>				
							<td>${vo.content}</td>				
							<td>${vo.deposit}</td>				
							<td>${vo.withdraw}</td>	
							<td>${vo.balance }</td>			
						</tr>
					</c:forEach>
				</c:if>	
		
		</table>

</body>
</html>