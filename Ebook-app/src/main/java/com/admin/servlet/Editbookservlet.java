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
import com.entity.Bookdetails;

@WebServlet("/Editbookservlet")
public class Editbookservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Editbookservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookname = request.getParameter("bname");
			String Author = request.getParameter("author");
			String price = request.getParameter("price");
			String status = request.getParameter("bstatus");
			
			Bookdetails b = new Bookdetails();
			b.setBookid(id);
			b.setBookname(bookname);
			b.setAuthor(Author);
			b.setPrice(price);
			b.setStatus(status);
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			boolean f = dao.updatebook(b);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("succMsg", "Book Updated Successfully...");
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
