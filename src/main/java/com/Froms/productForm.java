package com.Froms;

import org.springframework.web.multipart.MultipartFile;

public class productForm {

	private String productName;
	private String productQuantity;
	private String productPrize;
	private String productDiscount;
	private MultipartFile productImage;
	private String productCategory;
	private String productDescription;

	public productForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public productForm(String productName, String productQuantity, String productPrize, String productDiscount,
			MultipartFile productImage, String productCategory, String productDescription) {
		super();
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productPrize = productPrize;
		this.productDiscount = productDiscount;
		this.productImage = productImage;
		this.productCategory = productCategory;
		this.productDescription = productDescription;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductPrize() {
		return productPrize;
	}

	public void setProductPrize(String productPrize) {
		this.productPrize = productPrize;
	}

	public String getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(String productDiscount) {
		this.productDiscount = productDiscount;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	@Override
	public String toString() {
		return "productForm [productName=" + productName + ", productQuantity=" + productQuantity + ", productPrize="
				+ productPrize + ", productDiscount=" + productDiscount + ", productImage=" + productImage
				+ ", productCategory=" + productCategory + ", productDescription=" + productDescription + "]";
	}

}
