package com.farmToMart.Dao;

import com.farmToMart.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.farmToMart.entity.User;

public class UserDao {
	private SessionFactory factory;
	
	public UserDao(SessionFactory factory) {
		this.factory=factory;
	}
	
	public User getUserByEmailPassword(String email,String pass) {
		
		User user=null;
		
		String query="from User where userEmail =: e and userPassword =: p";
		
		Session session=this.factory.openSession();
		Query q=session.createQuery(query);
		
		q.setParameter("e",email);
		q.setParameter("p", pass);
		
		user=(User) q.uniqueResult();
		session.close();
		
		return user;
	}
}
