package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao0730;

@WebServlet("/PoductBuyServlet")
public class PoductBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		int myPoint = Integer.parseInt(request.getParameter("myPoint"));
		int point = myPoint - price;
		System.out.println(id+" "+title+" "+price+" "+myPoint+ " " + point);
		
		MemberDao0730 dao = new MemberDao0730();
		
		try {
			dao.buy(id, title);
			dao.userPointUpdate(id, point);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
