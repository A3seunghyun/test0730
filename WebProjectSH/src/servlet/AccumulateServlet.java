package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao0730;


@WebServlet("/AccumulateServlet")
public class AccumulateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int mPoint = Integer.parseInt(request.getParameter("point"));
		int myPoint = Integer.parseInt(request.getParameter("myPoint"));
		int point = mPoint + myPoint;
		
		MemberDao0730 dao = new MemberDao0730();
		
		try {
			dao.userPointUpdate(id, point);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
