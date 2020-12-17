<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

	<script type="text/javascript">
		function reply() {
			
			location.href="reply_form.do?idx=${vo.idx}&page=${param.page}";
			
		}
		
		function del() {
			if( confirm("정말 삭제 하시겠습니까?") ){
				var pwd = document.getElementById("c_pwd").value;
			
				if( pwd != "${vo.pwd}" ){
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				var url = "del.do";
				var param = "idx=${vo.idx}";
				sendRequest(url, param, resultFn, "post");				
			}
		}//del()
		
		function resultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var data = xhr.responseText;
				if( data == 'yes' ){
					alert("글을 삭제했습니다");
					location.href = 'list.do?page=${param.page}';
				}
				
			}
		}
		
	</script>

</head>
<body>
	<form name="f" method="post">
		
		<table border="1" align="center">
			<caption>:::게시글 상세보기:::</caption>
			
			<tr>
				<td width="120" heigth="25">제목</td>
				<td width="250">${ vo.subject }</td>
			</tr>
			
			<tr>
				<td width="120" heigth="25">작성자</td>
				<td width="250">${ vo.name }</td>
			</tr>
			
			<tr>
				<td width="120" heigth="25">작성일</td>
				<td width="250">${ vo.regdate }</td>
			</tr>
			
			<tr>
				<td width="120" height="25">ip</td>
				<td width="250">${ vo.ip }</td>
			</tr>
			
			<tr>
				<td width="120">내용</td>
				<td width="250" height="250"><pre>${vo.content}</pre></td>
			</tr>
			
			<tr>
				<td width="120">비밀번호</td>
				<td width="250">
					<input type="password" id="c_pwd">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<!-- 목록으로 돌아가기 -->
					<img src="${pageContext.request.contextPath}/resources/img/btn_list.gif" 
					     onclick="location.href='list.do?page=${param.page}'">
					     
					<c:if test="${ vo.depth lt 1 }">     
						<!-- 답글 -->
						<img src="${pageContext.request.contextPath}/resources/img/btn_reply.gif" onclick="reply();">
					</c:if>
					
					<!-- 수정 -->
					<img src="${pageContext.request.contextPath}/resources/img/btn_modify.gif" onclick="modify();">
					
					<!-- 삭제 -->
					<img src="${pageContext.request.contextPath}/resources/img/btn_delete.gif" onclick="del();">     
				</td>
			</tr>
			
		</table>
		
	</form>
</body>
</html>















































