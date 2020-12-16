<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// JsonTest01.ok.jsp
	
	/* {"num":"값1", "name":"값2", "content":"값3"} */
	/* ↑                                        ↑ */
	/*            ↑            ↑                  */
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	
	// JSON 데이터
	// {"이름1":"값1", "이름2":"값2"}
	
	
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("num", 100);
	jsonObj.put("name", name);
	jsonObj.put("content", content);
	
	result = jsonObj.toString();
	
	out.println(result);
	
	
	
	/*
	StringBuffer sb = new StringBuffer();
	
	// 따옴표 구성에 유의~!!! 
	sb.append("{\"num\":\"" + 1 + "\"");
	sb.append(",\"name\":\"" + name + "\"");
	sb.append(",\"content\":\"" + content + "\"}");
	
	
	
	result = sb.toString();
	
	out.println(result);
	*/
	
	
	
	
	
	/*
	
	■■■ JSON 라이브러리 ■■■
	
	① json-lib-x.x-jdkxx.jar			→ 핵심 기본 라이브러리
	② ezmorph-x.x.x.jar				→ 의존관계 필수 라이브러리
	③ commons-beanutils-x.x.x.jar		→ 의존관계 필수 라이브러리
	④ commons-collections-x.x.x.jar	→ 의존관계 필수 라이브러리
	⑤ commons-lang-x.x.x.jar			→ 의존관계 필수 라이브러리
	⑥ commons-logging-x.x.jar			→ 의존관계 필수 라이브러리
	
	※ 핵심 기본 라이브러리(json-lib-2.4-jdk15.jar)
	1. 『http://www.json.org』 요청 및 접근
	2. 페이지 하단의 『Java』 카테고리의 『Json-lib』클릭
	   → 『http://json-lib.sourceforge.net/』로 이동
	3. 페이지 왼편의 Download 클릭
	   → 『https://sourceforge.net/projects/json-lib/files/』로 이동
	4. 페이지 리스트 중 『json-lib』 클릭
	   → 『https://sourceforge.net/projects/json-lib/files/json-lib/』 로 이동
	5. 페이지 리스트 중 『json-lib-2.4』클릭
	   → 『https://sourceforge.net/projects/json-lib/files/json-lib/json-lib-2.4/』 로 이동
	6. 페이지 리스트 중 『json-lib-2.4-jdk15.jar』클릭
	   → 『json-lib-2.4-jdk15.jar』파일 다운로드
	   
	※ 의존관계 필수 라이브러리(commons-beanutils-1.9.4-bin.zip)
	1. 『http://www.json.org』 요청 및 접근
	2. 페이지 하단의 『Java』 카테고리의 『Json-lib』클릭
	   → 『http://json-lib.sourceforge.net/』로 이동
	3. 페이지 중앙 하단의 『Dependencies report』 클릭
	   → 『http://json-lib.sourceforge.net/dependencies.html』로 이동
	4. 페이지 스크롤 내리면 중간 정도에 『Dependency Tree』 항목 위치로 이동
	5. 페이지 내 『commons-beanutils:commons-beanutils:jar』 항목 클릭
	   → 『http://json-lib.sourceforge.net/dependencies.html#commons-beanutils:commons-beanutils:jar』로 이동(페이지 내 특정 위치 이동)
	6. 『http://commons.apache.org/beanutils/』 클릭
	   → 『http://commons.apache.org/proper/commons-beanutils/』로 이동
	7. 페이지 왼편의 Download 클릭
	   → 『http://commons.apache.org/proper/commons-beanutils/download_beanutils.cgi』로 이동
	8. 페이지 중간의 『commons-beanutils-1.9.4-bin.zip』 항목 클릭
	   → 『commons-beanutils-1.9.4-bin.zip』파일 다운로드
	   
	   
    ※ 의존관계 필수 라이브러리(commons-logging-1.2-bin.zip)
	1. 『http://www.json.org』 요청 및 접근
	2. 페이지 하단의 『Java』 카테고리의 『Json-lib』클릭
	   → 『http://json-lib.sourceforge.net/』로 이동
	3. 페이지 중앙 하단의 『Dependencies report』 클릭
	   → 『http://json-lib.sourceforge.net/dependencies.html』로 이동
	4. 페이지 스크롤 내리면 중간 정도에 『Dependency Tree』 항목 위치로 이동
	5. 페이지 내 『commons-logging:commons-logging:jar』 항목 클릭
	   → 『http://json-lib.sourceforge.net/dependencies.html#commons-logging:commons-logging:jar』로 이동(페이지 내 특정 위치 이동)
	6. 페이지 가장 하단의 『http://commons.apache.org/logging』항목 클릭
	   → 『http://commons.apache.org/proper/commons-logging/』 로 이동
	7. 페이지 왼편의 Download 클릭
	   → 『http://commons.apache.org/proper/commons-logging/download_logging.cgi』로 이동
	8. 페이지 중간의 『commons-logging-1.2-bin.zip』 항목 클릭
	   → 『commons-logging-1.2-bin.zip』파일 다운로드
	   
	 // check~!!!                  안정성 확보x 파일
	 ※ 의존관계 필수 라이브러리(commons-collections4-4.4-bin.zip → commons-collections-3.2.2.jar)
	 1. 『http://www.json.org』 요청 및 접근
	 2. 페이지 하단의 『Java』 카테고리의 『Json-lib』클릭
	    → 『http://json-lib.sourceforge.net/』로 이동
	 3. 페이지 중앙 하단의 『Dependencies report』 클릭
	    → 『http://json-lib.sourceforge.net/dependencies.html』로 이동
	 4. 페이지 스크롤 내리면 중간 정도에 『Dependency Tree』 항목 위치로 이동
	 5. 페이지 내 『commons-collections:commons-collections:jar』 항목 클릭
	    → 『http://json-lib.sourceforge.net/dependencies.html#commons-collections:commons-collections:jar』로 이동(페이지 내 특정 위치 이동)
	 6. 페이지 내 『http://commons.apache.org/collections/』 항목 클릭
	    → 『http://commons.apache.org/proper/commons-collections/』로 이동
	 7. 페이지 왼편의 Download 클릭
	    → 『http://commons.apache.org/proper/commons-collections/download_collections.cgi』로 이동
	 8. 페이지 중간의 『commons-collections4-4.4-bin.zip』 항목 클릭
	    → 『commons-collections4-4.4-bin.zip』파일 다운로드
	    
	    
	    // check~!!!                  안정성 확보x 파일
	 ※ 의존관계 필수 라이브러리(commons-lang3-3.11-bin.zip → commons-lang-2.6-bin.zip)
     1. 『http://www.json.org』 요청 및 접근
     2. 페이지 하단의 『Java』 카테고리의 『Json-lib』클릭
		→ 『http://json-lib.sourceforge.net/』로 이동
	 3. 페이지 중앙 하단의 『Dependencies report』 클릭
	    → 『http://json-lib.sourceforge.net/dependencies.html』로 이동
     4. 페이지 스크롤 내리면 중간 정도에 『Dependency Tree』 항목 위치로 이동
     5. 페이지 내 『commons-lang:commons-lang:jar』항목 클릭
        → 『http://json-lib.sourceforge.net/dependencies.html#commons-lang:commons-lang:jar』로 이동(페이지 내 특정 위치)
     6. 페이지 내 『http://commons.apache.org/lang/』 항목 클릭
        → 『http://commons.apache.org/proper/commons-lang/』로 이동
     7. 페이지 왼편의 Download 클릭
        → 『http://commons.apache.org/proper/commons-lang/download_lang.cgi』로 이동
     8. 페이지 중간의 『commons-lang3-3.11-bin.zip』항목 클릭
        → 『commons-lang3-3.11-bin.zip』 파일 다운로드
        
        
    ※ 의존관계 필수 라이브러리(ezmorph-1.0.6.jar)
    1. 『http://www.json.org』 요청 및 접근
    2. 페이지 하단의 『Java』 카테고리의 『Json-lib』클릭
   	   → 『http://json-lib.sourceforge.net/』로 이동
   	3. 페이지 중앙 하단의 『Dependencies report』 클릭
   	   → 『http://json-lib.sourceforge.net/dependencies.html』로 이동
    4. 페이지 스크롤 내리면 중간 정도에 『Dependency Tree』 항목 위치로 이동
    5. 페이지 내 『net.sf.ezmorph:ezmorph:jar』항목 클릭
       → 『http://json-lib.sourceforge.net/dependencies.html#net.sf.ezmorph:ezmorph:jar』로 이동(페이지 내 특정 위치)
    6. 페이지 내 『http://ezmorph.sourceforge.net』항목 클릭
       → 『http://ezmorph.sourceforge.net/』로 이동
    7. 페이지 왼편의 Download 클릭
       → 『https://sourceforge.net/projects/ezmorph/files/』로 이동
    8. 페이지 중앙의 『Download Latest Version (ezmorph-1.0.6.jar (86.5 kB))』 항목 클릭
       → 『ezmorph-1.0.6.jar』 파일 다운로드
    
	*/
%>