<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Deposit</title>
		
		<link href="${ pageContext.request.contextPath }/resources/css/bank.css" rel="stylesheet">
		
		<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
		
		<script type="text/javascript">
			function deposit(n) {
				var idx = n;
				var amount = document.getElementById("amount").value.trim();
				
				/* 금액 유효성 검사 */
				if(amount==''){
					alert("금액을 입력해 주세요");
					return;
				}
				
				if(amount<=0){
					alert("금액을 잘못 입력하셨습니다");
					document.getElementById("amount").value = "";
					return;
				}
				
				var amt = amount%1000;
				if(amt>0){
					alert("동전은 입금이 불가합니다");
					document.getElementById("amount").value = "";
					return;
				}
				
			
				if(!confirm(amount+"원을 입금하시겠습니까?")){
					document.getElementById("amount").value = "";
					return;
				}
				
				/* 입금 성공여부를 알 수 있는 Ajax */
				var url = "depositandwithdraw.do";
				var param = "idx="+idx+"&amount="+amount+"&check=1";
				sendRequest(url,param,resultFn,"post");
			}
			
			function resultFn() {
				if(xhr.readyState==4&&xhr.status==200){
					var data = xhr.responseText;
					
					if(data=='success'){
						alert("입금하였습니다");
						document.getElementById("amount").value = "";
						// 화면 앞쪽으로 돌아가기
						location.href="main.do";
					}
					else{
						alert("입금을 실패하였습니다");
						document.getElementById("amount").value = "";
						return;
					}
					
					
				}
			}
			
			/* 버튼 클릭 시 input text필드에 값 이동 */
			function transfer(n) {
				if(n>=0){
					document.getElementById("amount").value += n;
				}
				
				/* 값 초기화 */
				else if(n==-1){
					document.getElementById("amount").value = "";
				}
				
				/* 삭제 */
				else{
					var val = document.getElementById('amount').value;
			        val = val.substr(0,val.length - 1);
			        document.getElementById('amount').value = val;
				}
			}
		</script>
	</head>
	
	<body>
    
    <div class="title">
        <a href="main.do">
           <img class="title_icon" src="${ pageContext.request.contextPath }/resources/img/logo.png">
        </a>
       
           <ul>
                <li><a href="withdrawal_page.do?idx=${ vo.idx }">출금</a></li>
                <li><a href="account_info.do?idx=${ vo.idx }">계좌상세정보</a></li>
            </ul>
    </div>
    
    <div align="center" class="num">
			<h1>:::입금:::</h1>
			<p style="color: white">${ vo.name }님 계좌에 입금하실 금액을 입력해주세요</p>
			<div>
				<input type="button" value="1" onclick="transfer(1);">
				<input type="button" value="2" onclick="transfer(2);">
				<input type="button" value="3" onclick="transfer(3);">
			</div>
			<div>
				<input type="button" value="4" onclick="transfer(4);">
				<input type="button" value="5" onclick="transfer(5);">
				<input type="button" value="6" onclick="transfer(6);">
			</div>
			<div>
				<input type="button" value="7" onclick="transfer(7);">
				<input type="button" value="8" onclick="transfer(8);">
				<input type="button" value="9" onclick="transfer(9);">
			</div>
			<div>
				<input type="button" value="C" onclick="transfer(-1);">
				<input type="button" value="0" onclick="transfer(0);">
				<input type="button" value="del" onclick="transfer(-10);">
			</div>
			
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="text" id="amount">
			<input type="button" value="입금" onclick="deposit('${vo.idx}');"><br><br>
			<a href="main.do?idx=${ vo.idx }" style="text-decoration: none;">나가기</a>
		</div>
		
    
	</body>
</html>