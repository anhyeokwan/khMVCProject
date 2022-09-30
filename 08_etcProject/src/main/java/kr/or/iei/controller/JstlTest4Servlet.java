package kr.or.iei.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JstlTest4Servlet
 */
@WebServlet(name="JstlTest4Servlet",urlPatterns = {"/jstlTest4.do"})
public class JstlTest4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JstlTest4Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		Member m1 = new Member("신짱구", 5, "떡잎마을");
		Member m2 = new Member("나루토", 28, "나뭇잎마을");
		Member m3 = new Member("강백호", 17, "상북고등학교");
		
		memberList.add(m1);
		memberList.add(m2);
		memberList.add(m3);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/jstl/jstlTest4.jsp");
		request.setAttribute("memberList", memberList);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
