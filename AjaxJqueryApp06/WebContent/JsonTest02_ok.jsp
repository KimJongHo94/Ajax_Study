<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// JsonTest02_ok.jsp

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	
	// JSON 데이터(배열)
	/* [{"num":"값1", "name":"값2", "content":"값3"}, {"num":"값1", "name":"값2", "content":"값3"}, {"num":"값1", "name":"값2", "content":"값3"} ] */
	
	// [{"num":"1", "name":"홍길동", "content":"내용"},
	// {"num":"2", "name":"홍길동", "content":"내용"},
	// {"num":"3", "name":"홍길동", "content":"내용"},
	// {"num":"4", "name":"홍길동", "content":"내용"},
	// {"num":"5", "name":"홍길동", "content":"내용"},]
											   //    ↑   	
											   // check
											   
	// 최종적으로
	// [{"num":"1", "name":"홍길동", "content":"내용"},
	// {"num":"2", "name":"홍길동", "content":"내용"},
	// {"num":"3", "name":"홍길동", "content":"내용"},
	// {"num":"4", "name":"홍길동", "content":"내용"},
	// {"num":"5", "name":"홍길동", "content":"내용"}]
	// 이 모양이 만들어진다.
	
	for(int i = 0; i <= 5; i++)		// 1 ~ 5
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"num\":\"" + i + "\"");
		sb.append(",\"name\":\"" + name + "\"");
		sb.append(",\"content\":\"" + content + "\"},");		// check~!!! 『,』
		
		result += sb.toString();	// 차곡차곡 쌓기
		
	}
	
	result = result.substring(0, result.length()-1);	// 콤마가 빠져있는데까지 추출
	result = "[" + result + "]";						// 콤마 뺀 result 값에 배열 [] 감싸주기
	
	out.println(result);
	
	
%>