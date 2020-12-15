<%@page import="java.util.Map"%>
<%@page import="ex.MyMap"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	WebApplicationContext wc = WebApplicationContextUtils.getWebApplicationContext(application);

	MyMap myMap = (MyMap)wc.getBean("myMapBean");
	
	Map<String, Integer> map = myMap.getMap();
	
	request.setAttribute("map", map);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		${map.hong}<br>
		${map.kim }<br>
		${map.park}<br>
		
	</body>
</html>