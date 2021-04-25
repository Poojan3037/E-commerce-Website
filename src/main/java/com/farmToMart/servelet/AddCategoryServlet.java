package com.farmToMart.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.farmToMart.entity.Category;
import com.farmToMart.helper.Factory;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title=request.getParameter("catTitle");
		String description=request.getParameter("catDetail");
		
		
		Category category=new Category(title,description);
		
		SessionFactory factory=Factory.getFactory();
		
		Session session=factory.openSession();
		
		Transaction tx=session.beginTransaction();
		
		session.save(category);
		
		HttpSession ses=request.getSession();
		
		ses.setAttribute("msg", "Your category has been added successfully...");
		response.sendRedirect("admin.jsp");
		
		tx.commit();
		session.close();
	}

}
