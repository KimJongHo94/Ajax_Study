<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp =request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XmlTest02.jsp</title>
<link rel ="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   
   $(function()
   {
      $("#sendBtn").click(function()
      {
         //alert("호출확인");
         
         /*
         var params = "title=" + $.trim($("#title").val())
            + "&content=" + $.trim($("#content").val());
         */
         
         var params = "title=" + $("#title").val()
               + "&content=" + $("#content").val();
         
         $.ajax(
         {
            /*
            type : "POST"
            , url : "XmlTest02_ok.jsp"
            , data : params
            , success : function(args)
            {
               var out = "";
               
               $(args).find("comment").each(function()
               {
                  var item = $(this);
                  var num = item.attr("num");
                  var title = item.find("title").text();
                  var content = item.find("content").text();
                  
                  out +="<br> >>id=" + num;
                  out +="<br> - title = " + title;
                  out +="<br> - content = " + content;
               });
               
               $("#resultDiv").html(out);
               
               $("#title").val("");
               $("#content").val("");
               $("#title").focus();
            }
            , beforeSend : showRequest
            , error : function(e)
            {
               alert(e.responseText);
            }
            */
            
            //선생님 풀이
            type : "POST"
            , url : "XmlTest02_ok.jsp"
            , data : params
            , dataType : "xml"
            , success : function(xml)
            {
               //status엘리먼트 접근
               $(xml).find("status").each(function()
               {
                  var status = $(this).text();
                  alert(status);               //--확인(true)
               });
               
               var str = "";
               
               $(xml).find("records").each(function()
               {
                  var records = $(this);         //records엘리먼트 전부 다
                  var id = records.attr("id");   
                  var title = $(this).find("title").text();
                  var content = $(this).find("content").text();
                  
                  str +=">> id=" + id + "<br>- title=" + title
                     + "<br>- content=" + content + "<br>";
               });
               
               $("#resultDiv").html(str);
               
               
            }
            , beforedSend : showRequest
            , error : function(e)
            {
               alert(e.responseText);
            }
         });
         
      });
   });
   
   function showRequest()
   {
      /*
      if(!$.trim($("#title").val()))
      {
         alert("제목을 입력해야 합니다.");
         $.trim("#title").focus();
         return false;
      }
      if(!$.trim($("#content").val()))
      {
         alert("내용을 입력해야 합니다.");
         $.trim("#content").focus();
         return false;
      }
      return true;   
      */
      
      var flag = true;
      
      if(!$("#title").val())
      {
         alert("제목을 입력해야 합니다.");
         $("#title").focus();
         flag = false;
         
      }
      if(!$("#content").val())
      {
         alert("내용을 입력해야 합니다.");
         $("#content").focus();
         flag = false;
      }
   }
</script>
</head>
<body>

<div>
   <h1>jQuery AJAX XML 관련 실습</h1>
   <hr>
</div>

<div>
   제목 : <input type="text" id="title" class="txt"><br>
   내용 : <input type="text" id="content" class="txt"><br>
   <br>
   <input type="button" id="sendBtn" value="전송확인">
</div>
<br><br>

<div id="resultDiv">
<!-- 
>>id = 1<br>
- title = aaa<br>
- content = bbb<br>
>>id = 2<br>
- title = aaa<br>
- content = bbb<br> 
-->
</div>
</body>
</html>