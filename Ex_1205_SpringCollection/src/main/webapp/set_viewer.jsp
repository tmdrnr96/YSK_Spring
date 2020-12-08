<%@page import="java.util.Set"%>
<%@page import="ex.MySet"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--ctrl + F11으로 실행을 해보기 위해서는 webapp에서 jsp를 만들어준다. -->  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	WebApplicationContext wc = WebApplicationContextUtils.getWebApplicationContext(application);

	//root-context에서 만들어 놨던 mySetBean의 정보를 가져온다
	MySet mySet = (MySet)wc.getBean("mySetBean");
	
	
	Set set = mySet.getSet();
	
	request.setAttribute("set", set);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:forEach var = "v" items="${set}">
			${v}<br>
		</c:forEach>
	
	</body>
</html>