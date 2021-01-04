<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function send(f) {
		var id = f.id.value;
		
		alert(id);
		f.action = "view.do?id="+id;
		f.method="post";
		f.submit();
		
	}

	
</script>
</head>
<body>
	
	<form>
	
	 <c:forEach var="m_list" items="${list}">
	
		<input name="id" value="${m_list.id}">
	
	</c:forEach>
		<input type="button" value="확인" onclick='send(this.form);'>
	</form>
	
	
</body>
</html>