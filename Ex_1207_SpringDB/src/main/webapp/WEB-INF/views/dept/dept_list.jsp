<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	 	<table border = "1" align = "center">
	 	<caption><h2>:::부서 목록:::</h2></caption>
	 		<tr>
	 			<th>부서번호</th>
	 			<th>부서명</th>
	 			<th>위치</th>			
	 		</tr>
 			<c:forEach var = "list" items="${list}">
	 		<tr>
				<td>${list.deptno}</td>
				<td>${list.dname}</td>
				<td>${list.loc}</td>						 			
	 		<tr>	 		
 			</c:forEach>
	 	</table>
	</body>
</html>