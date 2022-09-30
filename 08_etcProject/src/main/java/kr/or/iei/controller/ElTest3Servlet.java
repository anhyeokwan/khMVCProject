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
 * Servlet implementation class ElTest3Servlet
 */
@WebServlet(name="/ElTest3Servlet", urlPatterns = {"/elTest3.do"})
public class ElTest3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElTest3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int[] numArr = {100, 200};
		ArrayList<Integer> numList = new ArrayList<Integer>();
		numList.add(100);
		numList.add(200);
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		Member member1 = new Member("신짱구", 5, "떡잎마을");
		Member member2 = new Member("나루토", 25, "나뭇잎마을");
		
		memberList.add(member1);
		memberList.add(member2);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/el/elTest3.jsp");
		request.setAttribute("numArr", numArr);
		request.setAttribute("numList", numList);
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
