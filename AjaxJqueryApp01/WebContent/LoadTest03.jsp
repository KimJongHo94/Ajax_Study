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

	.txtNum
	{
		width: 100px;
		text-align: right;
	}

</style>

<script src="http://code.jquery.com/jquery.min.js"></script>

<script>

	// $(document).ready();
	$(function()
	{
		$("#sendButton").click(function()
		{
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			var url = "LoadTest03_ok.jsp?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
			
			$("#result").load(url);		// responseText
		});	
	});
	
</script>

</head>
<body>

<div>
	<h1>jquery의 load() 활용 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="su1" class="txt txtNum" />
	<select name="" id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	<input type="text" id="su2" class="txt txtNum" />
	<input type="button" value=" = " id="sendButton" class="btn" />
</div>
<br />

<div id="result">
</div>
</body>
</html>