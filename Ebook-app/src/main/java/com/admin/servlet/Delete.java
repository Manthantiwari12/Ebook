package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BooksDaoimpl;
import com.db.DBconnect;

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			boolean f = dao.deletebooks(id);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("succMsg", "Book Deleted Successfully...");
				response.sendRedirect("admin/allbooks.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong...");
				response.sendRedirect("admin/allbooks.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	
	

}
