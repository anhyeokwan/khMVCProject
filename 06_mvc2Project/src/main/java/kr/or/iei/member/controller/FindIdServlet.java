package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet(name = "findId", urlPatterns = "/findId.do")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 인코딩하기
		request.setCharacterEncoding("utf-8");
		
		// 2. 값추출하기
		String memberId = request.getParameter("findId");
		
		// 3. 비즈니스 로직 만들기
		MemberService service = new MemberService();
		Member member = service.findMember(memberId);
		
		// 4. 화면에 나타내기
		// 4-1. 결과를 처리할 jsp를 지정
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/searchOneId.jsp");
		
		// 4-2. 화면구성에 필요한 데이터를 등록
		request.setAttribute("member", member);
		
		// 4-3. 페이지 이동
		view.forward(request, response); // 이거 안하면 백지상태 됨
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}














