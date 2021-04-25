package com.farmToMart.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import com.farmToMart.Dao.UserDao;
import com.farmToMart.entity.User;
import com.farmToMart.helper.Factory;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email=request.getParameter("userEmail");
		String password=request.getParameter("userPassword");
		
		SessionFactory factory=Factory.getFactory();
		
		UserDao dao=new UserDao(factory);
		
		User user=dao.getUserByEmailPassword(email, password);
		
		if(user==null) {
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Invalied Detalis...");
			response.sendRedirect("login.jsp");
		}
		else {
			
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", user);
			
			if(user.getRole().equals("normal")) {
//				normal user
				response.sendRedirect("normal.jsp");
			}
			else {
//				admin user
				response.sendRedirect("admin.jsp");
			}
		}
		
		
			
	}

}
