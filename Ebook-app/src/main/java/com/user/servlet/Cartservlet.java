package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BooksDaoimpl;
import com.dao.Cartdaoimpl;
import com.db.DBconnect;
import com.entity.Bookdetails;
import com.entity.Cart;

@WebServlet("/Cartservlet")
public class Cartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Cartservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			String success = request.getParameter("pagename");
			BooksDaoimpl dao = new BooksDaoimpl(DBconnect.getcon());
			Bookdetails b = dao.getbookbyid(bid);
			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookname(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			
			Cartdaoimpl dao2 = new Cartdaoimpl(DBconnect.getcon());
			boolean f = dao2.addcart(c);
			
			HttpSession session = request.getSession();
			
			if (f) {
				session.setAttribute("addcart", "Book added to cart successfully...");
				response.sendRedirect(success);
			}else {
				session.setAttribute("failedmsg", "Something went wrong...");
				response.sendRedirect(success);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
