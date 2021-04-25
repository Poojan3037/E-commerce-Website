package com.farmToMart.helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factory {
	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		if(factory==null) {
			factory=new Configuration().configure().buildSessionFactory();
		}
		return factory;
	}
}
