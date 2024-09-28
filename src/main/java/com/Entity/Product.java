package com.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Product {

	@Id
	private String Pid;
	@Column(nullable = false)
	private String pTitle;
	@Column(nullable = false)
	private String pQuantity;
	@Column(nullable = false)
	private String pPrize;
	private String pDiscount;
	@Column(nullable = false)
	private String pImage;
	@Column(length = 2000)
	private String pDescription;
	@Column(nullable = false)
	private String pCategory;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String pid, String pTitle, String pQuantity, String pPrize, String pDiscount, String pImage,
			String pDescription, String pCategory) {
		super();
		Pid = pid;
		this.pTitle = pTitle;
		this.pQuantity = pQuantity;
		this.pPrize = pPrize;
		this.pDiscount = pDiscount;
		this.pImage = pImage;
		this.pDescription = pDescription;
		this.pCategory = pCategory;
	}

	public String getPid() {
		return Pid;
	}

	public void setPid(String pid) {
		Pid = pid;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(String pQuantity) {
		this.pQuantity = pQuantity;
	}

	public String getpPrize() {
		return pPrize;
	}

	public void setpPrize(String pPrize) {
		this.pPrize = pPrize;
	}

	public String getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(String pDiscount) {
		this.pDiscount = pDiscount;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public int getDiscountedPrize() {
		int d = Integer.parseInt(this.getpDiscount());
		int p = Integer.parseInt(this.getpPrize());
		int discount = (int) ((d / 100.0) * p);
		int sellingPrize = p - discount;
		return sellingPrize;
	}

	// To cut String for 10 words
	public String get10Words(String title) {
		String[] obj = title.split(" ");
		if (obj.length > 10) {
			String res = "";
			for (int i = 0; i <= 10; i++) {
				res = res + obj[i] + " ";
				i++;
			}
			return res + " ...";
		} else {
			return title + " ...";
		}
	}

}
