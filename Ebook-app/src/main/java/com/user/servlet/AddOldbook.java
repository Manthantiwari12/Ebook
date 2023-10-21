package com.user.servlet;

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

@WebServlet("/addoldbooks")
@MultipartConfig
public class AddOldbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddOldbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String bookname = request.getParameter("bname");
			String Author = request.getParameter("author");
			String price = request.getParameter("price");
			String category = "old";
			String status = "active";
			Part part = request.getPart("photo");
			String filename = part.getSubmittedFileName();
			String usermail = request.getParameter("usermail");
			Bookdetails b = new Bookdetails(bookname,Author,price,category,status,filename,usermail);
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			
			
			
			
			boolean f=dao.addbooks(b);
			HttpSession session = request.getSession();
			if (f) {
				String path = getServletContext().getRealPath("")+"book";
				
				File f1 = new File(path);
				part.write(path+File.separator+filename);
				
				
				session.setAttribute("succMsg", "Book Add Successfully...");
				response.sendRedirect("sellbook.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong...");
				response.sendRedirect("sellbook.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
