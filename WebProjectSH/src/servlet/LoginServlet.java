package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao0730;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao0730 dao = new MemberDao0730();
		
		boolean result = false;
		
		try {
			result = dao.loginCheck(id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(result) {
	        HttpSession session = request.getSession();
	        session.setAttribute("loginId", id);
	        
	        if(id.equals("admin")) {
	            RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
	            rd.forward(request, response);
	        } else {
	            RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
	            rd.forward(request, response);
	        }
	    } else {
	        response.getWriter().println("<script>alert('아이디/비밀번호를 다시 확인하세요.'); location.href='login.jsp';</script>");
	    }
	}

}
