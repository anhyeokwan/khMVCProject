package nbd.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MypageUpdateServlet
 */
@WebServlet(name = "MypageUpdate", urlPatterns = { "/mypageUpdate.do" })
public class MypageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		// 값추출
		int memberGrade = Integer.parseInt(request.getParameter("memberGrade"));
		// 비즈니스로직
		
		// 결과처리
		if(memberGrade == 2) { 	// 의사
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypageUpdate2.jsp");
			view.forward(request, response);
		}else if(memberGrade == 3) { // 일반인
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypageUpdate.jsp");
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

