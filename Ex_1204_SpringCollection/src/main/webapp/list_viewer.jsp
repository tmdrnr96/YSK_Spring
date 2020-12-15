<%@page import="ex.MyList"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
    <%
    WebApplicationContext wc = WebApplicationContextUtils.getWebApplicationContext(application);

    	MyList myList = (MyList)wc.getBean("myListBean");
    	List list = myList.getList();
    	
    	request.setAttribute("list", list);
    
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:forEach var = "fruit" items="${list}">
			${fruit} <br>
		</c:forEach>
	</body>
</html>