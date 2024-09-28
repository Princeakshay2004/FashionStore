package com.Froms;

import org.springframework.web.multipart.MultipartFile;

public class userForm {

	private String name;
	private String email;
	private String mobile;
	private MultipartFile profile;
	private String password;
	private String address;
	private String state;
	private String city;
	private String pincode;
	private String gender;
	private String newpassword;
	private String conform_password;

	public userForm(String name, String email, String mobile, MultipartFile profile, String password, String address,
			String state, String city, String pincode, String gender, String newpassword, String conform_password) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.profile = profile;
		this.password = password;
		this.address = address;
		this.state = state;
		this.city = city;
		this.pincode = pincode;
		this.gender = gender;
		this.newpassword = newpassword;
		this.conform_password = conform_password;
	}

	public userForm() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public MultipartFile getProfile() {
		return profile;
	}

	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getConform_password() {
		return conform_password;
	}

	public void setConform_password(String conform_password) {
		this.conform_password = conform_password;
	}

	@Override
	public String toString() {
		return "userForm [name=" + name + ", email=" + email + ", mobile=" + mobile + ", profile=" + profile
				+ ", password=" + password + ", address=" + address + ", state=" + state + ", city=" + city
				+ ", pincode=" + pincode + ", gender=" + gender + "]";
	}

}
