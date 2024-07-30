package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao0730;

@WebServlet("/UserInfoEditServlet")
public class UserInfoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int point = Integer.parseInt(request.getParameter("point"));
		
		MemberDao0730 dao = new MemberDao0730();
		
		try {
			dao.userInfoUpdate(id, pw, name, point);
			response.getWriter().println("<script>alert(\"수정되었습니다.\"); location.href=\"adminPage.jsp\";</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
