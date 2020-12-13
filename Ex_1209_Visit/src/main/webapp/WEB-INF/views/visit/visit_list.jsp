<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!--${pageContext.request.contextPath} : 스프링에서 webapp 폴더로 접근하는 경로!  -->
		<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/css/visit.css">
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
			function del(f) {
				var pwd = f.pwd.value;//원본비밀번호
				var c_pwd = f.c_pwd.value;//사용자가 방금 입력한 비밀번호
				
				if(pwd != c_pwd){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				//삭제 확인
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				}	
				
				//삭제하고 싶은 idx를 Ajax를 통해 전송
				var url = "delete.do";
				var param = "idx="+f.idx.value;
				
				sendRequest(url, param, resultFn, "post");
				
			}//del()
			
			//삭제결과를 돌려 받기 위한 콜백 메서드
				function resultFn() {
					
				if(xhr.readyState == 4 && xhr.status == 200){
					//도착한 데이터 읽어오기
					//[{'res':'yes'}]
					var data = xhr.responseText;
					var json = eval(data);
					
					if(json[0].res == 'no'){
						alert("삭제 실패");
						return;
					}
						alert("삭제 성공!");
						location.href="list.do";
					}
				
				}//resultFn()
			
			
			
				//수정
				function modify(f) {
					var pwd = f.pwd.value;//원본 비밀번호
					var c_pwd = f.c_pwd.value;//비교를 위한 비밀번호
				
					if(pwd != c_pwd){
						alert("비밀번호가 일치하지 않습니다.");
						return;
					}		
					f.action='modify_form.do';
					f.method="post";
					f.submit();
				}
			
		
		</script>
	</head>
	<body>
	<div id = "main_box">
		<h1>:::방명록 리스트:::</h1>
		
		<div align = "center"> 
			<input type = "button" value = "새글쓰기" onclick = "location.href='insert_form.do'">
		</div>
	
		<c:forEach var = "vo" items="${list}">
			<div class = "visit_box">
											<!--<pre>DB에서 들어온 엔터값이 그대로 들어온다.  -->
				<div class = "type_context"><pre>${vo.context}</pre></div>
				
				<div class = "type_name">작성자 : ${vo.name}(${ vo.ip})</div>
				<div class ="type_regdate">작성일 : ${vo.regdate}</div>
			<div>
				<form>
					<input type = "hidden" name = "idx" value = "${vo.idx}">
					<input type = "hidden" name = "pwd" value = "${vo.pwd}">
					
					<input type="password" name = "c_pwd">
					
					<input type ="button" value = "수정" onclick = "modify(this.form);">
					<input type ="button" value = "삭제" onclick = "del(this.form);">
				</form>
			</div>
			
			</div>
		</c:forEach>
	</div>
	</body>
</html>