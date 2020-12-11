<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1" align = "center">
			<caption><h2>:::고객정보:::</h2></caption>
			<tr>
				<th>고객 번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>주민번호</th>
				<th>담당자 번호</th>			
			</tr>
			<c:forEach var = "vo" items="${list}">
				<tr>
					<td>${vo.gobun }</td>
					<td>${vo.goname }</td>
					<td>${vo.goaddr }</td>
					<td>${vo.gojumin }</td>
					<td>${vo.godam }</td>					
				</tr>			
			</c:forEach>			
		</table>
	</body>
</html>