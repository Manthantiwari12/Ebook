package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BooksDaoimpl;
import com.db.DBconnect;
import com.entity.Bookdetails;

@WebServlet("/booksadd")
@MultipartConfig
public class Booksadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Booksadd() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String bookname = request.getParameter("bname");
			String Author = request.getParameter("author");
			String price = request.getParameter("price");
			String category = request.getParameter("btype");
			String status = request.getParameter("bstatus");
			Part part = request.getPart("photo");
			String filename = part.getSubmittedFileName();
			
			Bookdetails b = new Bookdetails(bookname,Author,price,category,status,filename,"admin");
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			
			
			
			
			boolean f=dao.addbooks(b);
			HttpSession session = request.getSession();
			if (f) {
				String path = getServletContext().getRealPath("")+"book";
				
				File f1 = new File(path);
				part.write(path+File.separator+filename);
				
				
				session.setAttribute("succMsg", "Book Add Successfully...");
				response.sendRedirect("admin/addbooks.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong...");
				response.sendRedirect("admin/addbooks.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
