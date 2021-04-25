package com.farmToMart.Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.NamedQuery;

import com.farmToMart.entity.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public List<Product> getAllProduct() {

		Session session = this.factory.openSession();

		String hql = "from Product";

		Query query = session.createQuery(hql);

		List<Product> product = query.list();

		return product;
	}
	
	

	public List<Product> getProductByCategoryId(int id) {

		Session session = this.factory.openSession();

		String hql = "from Product as p where p.category.catId =: cid";
		
		Query query = session.createQuery(hql);
		
		query.setParameter("cid", id);

		List<Product> product = query.list();

		return product;
	}
}
