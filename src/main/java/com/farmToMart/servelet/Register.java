package com.farmToMart.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.farmToMart.entity.User;
import com.farmToMart.helper.Factory;
import com.mysql.cj.xdevapi.SessionFactory;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String password = request.getParameter("userPassword");
		String phone = request.getParameter("userPhone");
		String pic = "default.png";
		String address = request.getParameter("userAddress");
		String role = "normal";

		User user = new User(name, email, password, phone, pic, address, role);

		if (name.isEmpty()) {

		} else {

			Session session = Factory.getFactory().openSession();

			Transaction tx = session.beginTransaction();

			session.save(user);

			tx.commit();
			session.close();

			HttpSession session1 = request.getSession();

			session1.setAttribute("msg", "Register successfully...");

			response.sendRedirect("register.jsp");
		}

	}

}
