package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BooksDaoimpl;
import com.db.DBconnect;

@WebServlet("/DeleteOldBook")
public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			boolean f = dao.deleteoldbook(id);
			HttpSession session = request.getSession();
			
			if (f) {
				session.setAttribute("succmsg1", "Book removed successfully...");
				response.sendRedirect("oldbook.jsp");
			}else {
				session.setAttribute("failedmsg1", "Something went wrong...");
				response.sendRedirect("oldbook.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
