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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String password = request.getParameter("password");
			String check = request.getParameter("check");
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session = request.getSession();
			if (check!=null) {
				UserDaoImpl dao = new UserDaoImpl(DBconnect.getcon());
				Boolean f = dao.checkuser(email);
				if (f) {
					boolean f2 = dao.userRegister(us);
					if (f2) {
						session.setAttribute("succMsg", "User Registered Successfully...");
						response.sendRedirect("register.jsp");
					}
					else {
						session.setAttribute("failedmsg", "Something went wrong...");
						response.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failedmsg", "User Already Exist try another email");
					response.sendRedirect("register.jsp");
				}
			}else {
				session.setAttribute("failedmsg", "Please Agree terms and conditions...");
				response.sendRedirect("register.jsp");	
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
