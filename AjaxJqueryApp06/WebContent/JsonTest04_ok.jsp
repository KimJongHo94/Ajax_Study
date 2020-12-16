<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
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
	
	JSONArray jsonArr = new JSONArray();
	
	for(int i = 0; i <= 5; i++)		// 1 ~ 5
	{
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("num", i);
		jsonObj.put("name", name);
		jsonObj.put("content", content);
		
		jsonArr.add(jsonObj);
		
	}
	
	// 테스트
	System.out.println(jsonArr.toString());
	
	out.println(jsonArr.toString());
	
	
%>