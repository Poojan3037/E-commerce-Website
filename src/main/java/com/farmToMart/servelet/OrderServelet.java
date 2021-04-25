package com.farmToMart.servelet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.farmToMart.entity.OrderProducts;
import com.farmToMart.helper.Factory;

@WebServlet("/OrderServelet")
public class OrderServelet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid=request.getParameter("pid");
		String pname = request.getParameter("pname");
		String pquantity = request.getParameter("pquantity");
		String dprice =request.getParameter("dprice");
		int total =Integer.parseInt( request.getParameter("total"));
		int id=Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String add = request.getParameter("add");
		
		OrderProducts order=new OrderProducts(pid,pname,pquantity,dprice,total,id,name,email,phone,add);
		
		SessionFactory factory=Factory.getFactory();
		
		Session session=factory.openSession();
		
		Transaction tx=session.beginTransaction();
		
		session.save(order);
		
		tx.commit();
		session.close();
		
		response.sendRedirect("normal.jsp");
		HttpSession ses=request.getSession();
		ses.setAttribute("msg", "Your order has been placed successfully...");
	}

}
