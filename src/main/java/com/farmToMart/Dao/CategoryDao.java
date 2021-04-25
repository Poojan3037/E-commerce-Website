package com.farmToMart.Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.farmToMart.entity.Category;

public class CategoryDao {

	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory=factory;
	}
	
	public List<Category> getAllCategeroy() {
		
		
		SessionFactory factory=this.factory;
		Session session=factory.openSession();
		
		String hql="from Category";
		Query query=session.createQuery(hql);
		
		List<Category> result=query.list();
		return result;
	}
	
	
	public Category getCategoryById(int id) {
		
		Category cat=null;
		
		SessionFactory factory=this.factory;
		Session session=factory.openSession();
		
		cat=session.get(Category.class, id);
		
		
		return cat;
	}
	
}
