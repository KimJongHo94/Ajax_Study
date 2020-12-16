/* ====================
	SampleServlet.java
   ====================
*/

package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SampleServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자 요청이 GET 방식인 경우 Servlet Container 에 의해 자동으로 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	// 사용자 요청이 POST 방식인 경우 Servlet Container 에 의해 자동으로 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	// GET 방식이든 POST 방식이든 모두 호출되어 처리할 수 있도록 구성한 사용자 정의 메소드
	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

	}
}
