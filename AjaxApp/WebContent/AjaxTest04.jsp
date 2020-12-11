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
	.doNot
	{
		background-color: #c0c0c0;
	}

</style>

<script src="<%=cp %>/js/ajax.js"></script>
<script>

	function check()
	{
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test04.do?id=" + id;
		
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
	
	
	function search()
	{
		// 데이터 수집
		var addr = document.getElementById("addr").value;
		
		// URL 준비
		var url = "test04.do?addr=" + addr;
		
		// XMLHttpRequest 객체 생성(AJAX 객체) → ajax.js
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4 && ajax.status==200)
				callBack2();
		}
		ajax.send("");
	}
	
	// 우편번호 검색 결과를 통보받아서 사용자에게 안내해 줄 수 있도록 처리.
	function callBack2()
	{
		// XML 문서 전체의 참조 객체. (흔히 XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트
		//-- 현재 우리가 수신한 문자는 『<list>』 엘리먼트
		var root = doc.documentElement;
		
		// root(즉, <list> 엘리먼트) 하위의
		// 모든 <item> 엘리먼트들 받아내기(반환받기)
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if(itemList.length==0)
		{
			document.getElementById("addrResult").innerHTML = "<option>주소를 검색하세요.</option>";
		}
		else
		{
			document.getElementById("addrResult").innerHTML = "<option value='0'>주소를 선택하세요.</option>";
		}
		
		// 검색 결과가 존재할 경우... 반복문을 순환하며 각 데이터 가져오기
		for(var i=0; i<itemList.length; i++)
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 태그가 가지는 텍스트는 태그의 첫 번째 자식이고
			//    텍스트 노드의 값은 nodeValue 로 가져온다.
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			// select box 에 아이템 추가
			document.getElementById("addrResult").innerHTML 
				+= "<option value='"+ zipcodeText + " / " + addressText 
					+ "'>[" + zipcodeText + "] " + addressText + "</option>";	
		}
	}
	
	function selZipCode(sel)
	{
		//alert(sel.value);
		
		if(sel.value != "0")
		{
			document.getElementById("addr1").value = sel.value.split("/")[0]; 
			document.getElementById("addr2").value = sel.value.split("/")[1];
			document.getElementById("addr3").focus();
		}
	}

</script>
</head>
<body>

<div>
	<h1>회원가입</h1>
	<h1>우편번호 검사</h1>
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
			<input type="text" id="addr" class="txt control" placeholder="동 입력" />
			<input type="button" value="검색하기" class="btn control" onclick="search()" />
			<br />
			<select name="" id="addrResult" class="control" onchange="selZipCode(this)">
				<option value="">주소를 입력하세요</option>
			</select>
		</td>
	</tr>

	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="doNot control" readonly="readonly" 
			style="width: 200px;"/>
			<input type="text" id="addr2" class="doNot control" readonly="readonly" 
			style="width: 400px;"/>
			<br />
			<input type="text" id="addr3" class="txt control" 
			placeholder="상세 주소를 입력하세요" style="width: 400px;"/>
		</td>
	</tr>
</table>

</body>
</html>