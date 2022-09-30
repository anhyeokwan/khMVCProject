package kr.or.iei.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ElTest4Servlet
 */
@WebServlet(name="/ElTest4Servlet", urlPatterns = {"/elTest4.do"})
public class ElTest4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElTest4Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member1 = new Member("신짱구", 5, "떡잎마을");
		Member member2 = new Member("나루토", 25, "나뭇잎마을");
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/el/elTest4.jsp");
		request.setAttribute("m", member1);
		HttpSession session = request.getSession();
		session.setAttribute("m", member2);
		view.forward(request, response);
		// request와 session의 키값이 같을 경우 범위가 더 좁은 request를 불러온다
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
