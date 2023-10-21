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

@WebServlet("/Updateuserprofile")
public class Updateuserprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String password = request.getParameter("password");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			UserDaoImpl dao = new UserDaoImpl(DBconnect.getcon());
			boolean f = dao.updateprofile(us);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("updated", "Your profile have been updated");
				response.sendRedirect("editprofile.jsp");
			} else {
				session.setAttribute("updatefailed", "something went wrong");
				response.sendRedirect("editprofile.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
