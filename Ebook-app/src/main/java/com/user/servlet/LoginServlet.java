package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImpl;
import com.db.DBconnect;
import com.entity.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			UserDaoImpl dao = new UserDaoImpl(DBconnect.getcon());
			HttpSession session = request.getSession();
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			//System.out.println(email+" "+password);
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				response.sendRedirect("admin/home.jsp");
			}else {
				
				User us = dao.login(email, password);
				if (us!=null) {
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedmsg", "Invalid Email or Password...");
					response.sendRedirect("login.jsp");
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
