package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05 extends HttpServlet
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
		// 서블릿 관련 코딩
		
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");

		// 사용자가 타이핑중인 단어 수신
		String search = request.getParameter("search");
		
		// DB 연결 및 액션 처리
		// 『~~~~ WHERE COLUMN LIKE 'search%'』와 같은 쿼리문 수행
		// 그에 따른 결과 수신
		
		// 위와 같이 조회한 결과를 가지고 자료구조 활용
		ArrayList<WordDTO> lists = new ArrayList<WordDTO>();
		
		if(search.equals("가"))
		{
			lists.add(new WordDTO("가"));
			lists.add(new WordDTO("가방"));
			lists.add(new WordDTO("가방끈"));
			lists.add(new WordDTO("가방끈 매듭"));
			lists.add(new WordDTO("가방끈 매듭 만드는 법"));
			lists.add(new WordDTO("가방끈 매듭 풀기"));
			lists.add(new WordDTO("가사"));
			lists.add(new WordDTO("가요"));
			lists.add(new WordDTO("가위"));
			lists.add(new WordDTO("가장자리 다듬기"));
		}
		else if(search.equals("가사"))
		{
			lists.add(new WordDTO("가사"));
			lists.add(new WordDTO("가사 듣기"));
			lists.add(new WordDTO("가사 보기"));
			lists.add(new WordDTO("가사 외우기"));
			lists.add(new WordDTO("가사 만드는 법"));
		}
		else if(search.equals("가위"))
		{
			lists.add(new WordDTO("가위"));
			lists.add(new WordDTO("가위 날카롭게 만드는 법"));
			lists.add(new WordDTO("가위 버릴 때 안전하게 버리는 방법"));
		}
		else if(search.equals("가방"))
		{
			lists.add(new WordDTO("가방"));
			lists.add(new WordDTO("가방 구매"));
			lists.add(new WordDTO("가방끈"));
		}
		else if(search.equals("가방끈"))
		{
			lists.add(new WordDTO("가방끈"));
			lists.add(new WordDTO("가방끈 만들기"));
			lists.add(new WordDTO("가방끈 매듭 만들기"));
			lists.add(new WordDTO("가방끈 매듭 만드는 방법"));
			lists.add(new WordDTO("가방끈 줄이기"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test05_ok.jsp");
		dispatcher.forward(request, response);
	}
}
