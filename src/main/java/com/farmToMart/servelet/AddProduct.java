package com.farmToMart.servelet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.farmToMart.Dao.CategoryDao;
import com.farmToMart.entity.Category;
import com.farmToMart.entity.Product;
import com.farmToMart.helper.Factory;

@WebServlet("/AddProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("proTitle");
		String description=request.getParameter("proDetail");
		int price=Integer.parseInt(request.getParameter("proPrice"));
		int discount=Integer.parseInt(request.getParameter("proDiscount"));
		int quantity=Integer.parseInt(request.getParameter("proQuantity"));
		int catid=Integer.parseInt(request.getParameter("proCategory"));
		Part part=request.getPart("proPic");
		
		CategoryDao dao=new CategoryDao(Factory.getFactory());
		Category cat=dao.getCategoryById(catid);
		
		Product product=new Product(title,description,part.getSubmittedFileName(),price,discount,quantity,cat);
		
//		----------save product in database----------------
		SessionFactory factory=Factory.getFactory();
		Session session=factory.openSession();
		
		Transaction tx=session.beginTransaction();
		
		session.save(product);
		
		HttpSession ses=request.getSession();
		
		ses.setAttribute("msg", "Your product has been added successfully...");
		response.sendRedirect("admin.jsp");
		
		tx.commit();
		session.close();
			
		
		
		
//		--------save product photo in product folder----------
		
		String path=request.getRealPath("pic")+File.separator+"products"+File.separator+part.getSubmittedFileName();
		
		System.out.println(path);
		
		FileOutputStream out=new FileOutputStream(path);
		InputStream is=part.getInputStream();
		
		byte data[]=new byte[is.available()];
		
		is.read(data);
		out.write(data);
		
		is.close();
		out.close();
	
		
	}

}
