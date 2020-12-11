/**
 * ajax.js
 */

// XMLHttpRequest 객체를 담아둘 변수(→ ajax 객체)
var ajax = null;

// AJAX 객체(XMLHttpRequest 객체) 생성 함수
function createAjax()
{
	/*
	// ※ 객체를 생성하는 방식의 차이일 뿐...
	//    모두 XMLHttpRequest 객체를 생성하는 구문이다.
	if (window.ActiveXObject)			//-- IE 7 이전 버전 
	{
		// return new ActiveXObject("Microsoft.XMLHTTP");
		return new ActiveXObject("Msxml2.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//   (ActiveXObject 객체 → XMLHttpRequest 객체를 대신하는 객체)
	}
	else								//-- 그 외 브라우저
	{
		if (window.XMLHttpRequest)		//-- XMLHttpRequest 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		}
		else							//-- 결과적으로 AJAX 를 지원하지 않는 브라우저
		{
			return null;
		}
	}
	*/
	
	
	if (window.ActiveXObject)			
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
	}
	else if (window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else
	{
		return null;
	}
}