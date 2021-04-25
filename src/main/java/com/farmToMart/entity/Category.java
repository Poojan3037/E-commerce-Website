package com.farmToMart.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int catId;
	private String catTitle;
	private String catDetail;
	
	@OneToMany(mappedBy = "category")
	private List<Product> product;

	public Category(int catId, String catTitle, String catDetail, List<Product> product) {
		super();
		this.catId = catId;
		this.catTitle = catTitle;
		this.catDetail = catDetail;
		this.product = product;
	}

	public Category(String catTitle, String catDetail, List<Product> product) {
		super();
		this.catTitle = catTitle;
		this.catDetail = catDetail;
		this.product = product;
	}
	
	public Category(String catTitle, String catDetail) {
		super();
		this.catTitle = catTitle;
		this.catDetail = catDetail;
	}


	public Category() {
		super();
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatTitle() {
		return catTitle;
	}

	public void setCatTitle(String catTitle) {
		this.catTitle = catTitle;
	}

	public String getCatDetail() {
		return catDetail;
	}

	public void setCatDetail(String catDetail) {
		this.catDetail = catDetail;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	
	
}
