package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Bookorderdaoimpl;
import com.dao.Cartdaoimpl;
import com.db.DBconnect;
import com.entity.Book_order;
import com.entity.Cart;

@WebServlet("/Orderservlet")
public class Orderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String paymenttype = request.getParameter("paytype");
			
			String fulladdress = address+", "+landmark+", "+city+", "+state+", "+zip; 
			Cartdaoimpl dao = new Cartdaoimpl(DBconnect.getcon());
			List<Cart> blist = dao.getbookbyuser(id);
			HttpSession session = request.getSession();
			if (blist.isEmpty()) {
				session.setAttribute("msg1", "Your Cart is empty...");
				response.sendRedirect("cart.jsp");
			}else {
				Bookorderdaoimpl dao2 = new Bookorderdaoimpl(DBconnect.getcon());
				Book_order o = null;
				int i = dao2.getorderno();
				ArrayList<Book_order> order = new ArrayList<Book_order>();
				
				for(Cart c:blist) {
					o = new Book_order();
					o.setOrderid("BOOK-ORD-00"+i);
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladdress(fulladdress);
					o.setBookname(c.getBookname());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaytype(paymenttype);
					o.setUserid(id);
					order.add(o);
					i++;
					
				}
				
				
				
				if ("noselect".equals(paymenttype)) {
					session.setAttribute("msg1", "Please select Payment Type...");
					response.sendRedirect("cart.jsp");
				}else {
					boolean f = dao2.saveorder(order);
					if (f) {
						response.sendRedirect("ordersuccess.jsp");
					}else {
						session.setAttribute("msg1", "Something went wrong...");
						response.sendRedirect("cart.jsp");
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
