package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Cartdaoimpl;
import com.db.DBconnect;

@WebServlet("/Removebook")
public class Removebook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Removebook() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cid = Integer.parseInt(request.getParameter("cid"));
		Cartdaoimpl dao = new Cartdaoimpl(DBconnect.getcon());
		boolean f = dao.deletebook(cid);
		HttpSession session = request.getSession();
		if (f) {
			session.setAttribute("succmsg", "Book removed from cart...");
			response.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("failedmsg", "Something went wrong...");
			response.sendRedirect("cart.jsp");
		}
	}

}
