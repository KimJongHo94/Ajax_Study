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
	
	int cnt = 5;
	
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("count", cnt);
	
	// JSON 데이터(배열)
	/* [{"num":"값1", "name":"값2", "content":"값3"}, {"num":"값1", "name":"값2", "content":"값3"}, {"num":"값1", "name":"값2", "content":"값3"} ] */
	
	JSONArray jsonArr = new JSONArray();
	
	for(int i = 1; i <= cnt; i++)		// 1 ~ 5
	{
		JSONObject jsonObj2 = new JSONObject();
		
		jsonObj2.put("num", i);
		jsonObj2.put("name", name);
		jsonObj2.put("content", content);
		
		jsonArr.add(jsonObj2);
		
	}
	
	// 테스트
	jsonObj.put("data", jsonArr);
	
	out.println(jsonObj.toString());
	
	
%>