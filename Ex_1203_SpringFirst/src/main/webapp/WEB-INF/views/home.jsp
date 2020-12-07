<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
	<!--실행되면서 컨트롤러에서 받아온 값이 표시된다.  -->
<P>  The time on the server is ${serverTime}. </P>
<p>${hello}</p>
</body>
</html>
