package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao0730;

@WebServlet("/UserInfoDeleteServlet")
public class UserInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		
		MemberDao0730 dao = new MemberDao0730();
		
		try {
			dao.userInfoDelete(id);
			response.getWriter().println("<script>alert(\"삭제되었습니다.\"); location.href=\"adminPage.jsp\";</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
