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
<link rel="stylesheet" href="css/main.css" />

<style>

	#result
	{
		display: inline-block;
		width: 250px;
		color: #f33;
	}

</style>

<script src="<%=cp %>/js/ajax.js"></script>
<script>

	function check()
	{
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id=" + id;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 환경 설정( 『open("메소드방식", "URL", 동기/비동기)』 )
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4)
			{
				if (ajax.status == 200)
				{
					callBack();
				}
			}
		}
		
		ajax.send("");
		
	}// end check()
	
	
	// 아이디 중복 검사의 결과를 통보받아 사용자에게 메세지 출력
	// → span
	function callBack()
	{
		var result = ajax.responseText;
		
		result = parseInt(result);
		
		if(result == 0)
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		else 
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다..";
	}

</script>
</head>
<body>

<div>
	<h1>회원가입</h1>
	<p> - AjaxTest03.jsp</p>
	<p> - ajax.js</p>
	<p> - main.css</p>
	<p> - com.test.ajax.Test03.java</p>
	<p> - Test03_ok.jsp</p>
	<p> - web.xml</p>
	<br />
	<p> - URL : test03.do</p>
	<p> - DB 연동 → 자료구조 대체 활용 → superman, batman, admin</p>
	<hr>
</div>

<table>

	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="txt control" />
			<input type="button" value="중복 검사" class="btn control" onclick="check()" />
			<span>
				<!-- 사용 가능한 아이디 입니다. -->
				<!-- 이미 사용중인 아이디 입니다. -->
				<span id="result"></span>
			</span>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<input class="txt control" />
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input class="txt control" />
		</td>
	</tr>

</table>

</body>
</html>