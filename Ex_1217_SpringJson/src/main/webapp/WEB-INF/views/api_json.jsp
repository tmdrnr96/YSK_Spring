<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>		
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
		//자동으로 가장먼저 실행
		window.onload=function(){
			//웹페이지 로드시 가장 먼저 호출되는 메서드
		 	visit_list();			
			}
		
		function visit_list() {
			//api를 가져올 경로 지정
			var url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
			var param = "key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";
			
			sendRequest(url, param, resultFn, "get")
			
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = eval("[" + data + "]");
				
				alert(json[0].boxOfficeResult.dailyBoxOfficeList[0].movieNm);
			}
		}
		
		</script>	
	</head>
	<body>
		안녕하세요
	</body>
</html>