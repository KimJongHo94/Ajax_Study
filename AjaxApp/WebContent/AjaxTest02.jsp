<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.short
	{
		width: 30px;
	}

</style>

<script src="<%=cp%>/js/ajax.js"></script>
<script>

	function sum()
	{
		// alert("호출 확인");
		
		// 데이터 수집
		var n1 = document.getElementById("num1").value;
		var n2 = document.getElementById("num2").value;
		
		// URL 구성
		var url = "test02.do?n1=" + n1 + "&n2=" + n2;
		
		// XMLHttpRequest 객체 생성(AJAX 객체)
		ajax = createAjax();		//-- ajax.js 참조하고 있어야 한다.
		
		// 『"GET"』 : 요청 방식(POST 사용 가능. POST 사용 시 헤더 추가)
		// 『url』   : AJAX 요청 페이지(데이터 수신 및 응답 페이지)
		// 『true』  : boolean → true(비동기), false(동기). 동기는 사용 안함.
		ajax.open("GET", url, true);
		//-- 실제 서버와의 연결이 아니고 일종의 환경 설정 부분으로 이해하는 것이 좋다.
		//   (실제 서버 연결은 나중에...)
		
		// ajax 객체(XMLHttpRequest 객체)의 readyState 속성은
		// 각 단계별로 변화되며 0부터 4까지 순차적으로 증가한다.
		// 그리고 이 값이 변화될 때 마다 readystatechange 이벤트가 발생하게 된다.
		ajax.onreadystatechange = function()
		{
			// 그 중에서... (0부터 4까지의 상태 중에서...)
			// 4가 되는 순간이
			// 요청했던 서버로부터 응답이 완료된 시점이기 때문에
			// 4인 경우 업무를 진행한다.
			if (ajax.readyState==4)
			{
				// 서버로부터 응답이 완료되었다 하더라도
				// 그 과정에서 데이터가 올바른 것인지 에러 메세지를 받은 것인지
				// 알 수 없기 때문에 서버로부터 응답 코드를 확인한 후
				// 업무를 진행할 수 있도록 처리(구성)한다.
				if (ajax.status==200)
				{
					// 업무 진행
					//-- 업무 코드를 외부로 추출(콜백 함수 호출)
					callBack();
					
					// var data = ajax.responseText;
					// document.getElementById("result").value = data;
				}
			}
		}
		
		// 실제 서버에서 AJAX 요청을 한다. (즉, 이 부분이 진짜 연결 작업이다.)
		// GET 방식으로 데이터를 전송하는 경우... 인자값이 ""
		// POST 방식으로 데이터를 전송하는 경우... 인자값에 데이터를 넣는다.
		// 현재는 GET 방식의 요청이다. (비워두는 것은 하지말자.)
		ajax.send("");
		
		
	}// end sum()
	
	
	
	
	
	// 추출된 업무 코드
	//-- AJAX 요청이 완료된 후 호출되는 최종 업무 처리 함수
	function callBack()
	{
		// 여기서는 두 가지 방법 중 하나로 데이터를 가져온다.
		
		// 1. 서버가 응답한 데이터가 텍스트일 경우(단일 데이터)
		var data = ajax.responseText;
		
		// 2. 서버가 응답한 데이터가 XML인 경우(다량의 데이터)
		// var data = ajax.responseXML;4
		
		// 받아온 데이터를 업무에 적용한다.
		document.getElementById("result").value = data;
	}

</script>

</head>
<body>

<div>
	<h1>AJAX 기본 실습</h1>
	<hr />
</div>

<input type="text" id="num1" class="txt" />
+
<input type="text" id="num2" class="txt" />
<input type="button" value=" = " class="btn" onclick="sum()"/>
<input type="text" id="result" class="txt" />

<br /><br />

<h2>같은 페이지에 있는 기타 다른 요소들</h2>

<input type="text" />
<br />

<input type="checkbox" name="check" value="check1" />
<input type="checkbox" name="check" value="check2" />
<br />

<input type="radio" name="rdo" value="rdo1" />
<input type="radio" name="rdo" value="rdo2" />
<br />

<select name="" id="sel">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
</select>

</body>
</html>