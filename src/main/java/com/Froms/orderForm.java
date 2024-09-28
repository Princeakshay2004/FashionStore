package com.Froms;

public class orderForm {

	
	private String firstname;
	private String lastname;
	private String mobileno;
	private String email;
	private String address;
	private String city;
	private String state;
	private String pincode;
	private String paymentType;
	private String Totalprice;
	private String quentity;
	private String Title;
	private String image ;
	
	public orderForm(String firstname, String lastname, String mobileno, String email, String address, String city,
			String state, String pincode, String paymentType) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.mobileno = mobileno;
		this.email = email;
		this.address = address;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.paymentType = paymentType;
	}
	public orderForm() {
		super();
	}
		
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getTotalprice() {
		return Totalprice;
	}
	public void setTotalprice(String totalprice) {
		Totalprice = totalprice;
	}
	public String getQuentity() {
		return quentity;
	}
	public void setQuentity(String quentity) {
		this.quentity = quentity;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
	
	
	
}
