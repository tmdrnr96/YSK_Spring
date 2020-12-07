<%@page import="vo.PersonVO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	//application Scope영역 안에 저장된  참조값을 얻어와야 한다.
 	//application Scope영역으로 접근!
 	//wc를 사용하면 application Scope에 있는 값을 가져올 수 있다.
 	WebApplicationContext wc = WebApplicationContextUtils.getWebApplicationContext(application);
	//p1 -> rootcontext에서 지정한 bean의 name
	//반환이 오브젝트로 되기 때문에 형변환을 통해 PersonVO로 바꿔준다.
	PersonVO p1 = (PersonVO)wc.getBean("p1");
	
	//둘 중 하나로!!
	//PersonVO p2 = (PersonVO)wc.getBean("p2");
	PersonVO p2 = wc.getBean("p2",PersonVO.class);

	request.setAttribute("p1", p1);
	request.setAttribute("p2", p2);
	
	PersonVO p3 = (PersonVO)wc.getBean("p3"); 
	PersonVO p4 = (PersonVO)wc.getBean("p4"); 

	request.setAttribute("p3", p3);
	request.setAttribute("p4", p4);

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<P>${p1.name} / ${p1.age} / ${p1.tel}</P>
		<P>${p2.name} / ${p2.age} / ${p2.tel}</P>
		
		<hr>
		<!--p3,p4는 같은 값이 나온다..  -->
		<P>${p3.name} / ${p3.age} / ${p3.tel}</P>
		<P>${p4.name} / ${p4.age} / ${p4.tel}</P>
	</body>
</html>