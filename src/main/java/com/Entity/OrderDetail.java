package com.Entity;




import java.sql.Date;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
@Entity
public class OrderDetail {

	@Id
	private String Oid;
	@ManyToOne
	private User user;
	@ManyToOne
	private Product product;
    private String firstName;
    private String lastname;
    private String mobileno;
    private String email;
    private String Address;
    private String city;
    private String state;
    private String pincode;
	private Date OrderDate;
	private String PaymentType;
	private String Oprice;
	private String Ostatus;
	private String quentity;
	private String image;
	private String title;
    
   	public OrderDetail() {
		super();
	}
	public OrderDetail(String Oid, Date orderDate, String paymentType, String price, String Ostatus, User user, Product product,
			String firstName, String lastname, String mobileno, String email, String address, String city, String state,
			String pincode) {
		super();
		this.Oid = Oid;
		OrderDate = orderDate;
		PaymentType = paymentType;
		this.Oprice = price;
		this.Ostatus = Ostatus;
		this.user = user;
		this.product = product;
		this.firstName = firstName;
		this.lastname = lastname;
		this.mobileno = mobileno;
		this.email = email;
		Address = address;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
	}
	public String getOid() {
		return Oid;
	}
	public void setOid(String Oid) {
		this.Oid = Oid;
	}
	public Date getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(Date orderDate) {
		OrderDate = orderDate;
	}
	public String getPaymentType() {
		return PaymentType;
	}
	public void setPaymentType(String paymentType) {
		PaymentType = paymentType;
	}
	public String getPrice() {
		return Oprice;
	}
	public void setPrice(String price) {
		this.Oprice = price;
	}
	public String getStatus() {
		return Ostatus;
	}
	public void setStatus(String status) {
		Ostatus = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
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
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
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
	public String getOprice() {
		return Oprice;
	}
	public void setOprice(String oprice) {
		Oprice = oprice;
	}
	public String getOstatus() {
		return Ostatus;
	}
	public void setOstatus(String ostatus) {
		Ostatus = ostatus;
	}
	public String getQuentity() {
		return quentity;
	}
	public void setQuentity(String quentity) {
		this.quentity = quentity;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
