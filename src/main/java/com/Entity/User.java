package com.Entity;

import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class User implements UserDetails {

	@Id
	private String uId;
	private String name;
	@Column(nullable = false)
	private String mobile;
	@Column(nullable = false, unique = true)
	private String email;
	private String profile;
	private String gender;
	private String password;
	@Column(nullable = false)
	private String Address;
	@Column(nullable = false)
	private String city;
	@Column(nullable = false)
	private String state;
	@Column(nullable = false)
	private String pincode;
	private String provider;
	private boolean enabled;
	private boolean emailverified;
	@Column(nullable = false)
	private String Role;
	private boolean accountNonLocked;
	private Integer failedAttempts;
	private Date lockTime;
	private String resetToken;
	// Constructor

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String uId, String name, String mobile, String email, String profile, String gender, String password,
			String address, String city, String state, String pincode, String provider, boolean enabled,
			boolean emailverified, String Role, boolean accountNonLocked, Integer failedAttempts, Date lockTime,
			String resetToken) {
		super();
		this.uId = uId;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.profile = profile;
		this.gender = gender;
		this.password = password;
		this.Address = address;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.provider = provider;
		this.enabled = enabled;
		this.emailverified = emailverified;
		this.Role = Role;
		this.accountNonLocked = accountNonLocked;
		this.failedAttempts = failedAttempts;
		this.lockTime = lockTime;
		this.resetToken = resetToken;
	}

	// Getters and Setter
	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isEmailverified() {
		return emailverified;
	}

	public void setEmailverified(boolean emailverified) {
		this.emailverified = emailverified;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String Role) {
		this.Role = Role;
	}

	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public Integer getFailedAttempts() {
		return failedAttempts;
	}

	public void setFailedAttempts(Integer failedAttempts) {
		this.failedAttempts = failedAttempts;
	}

	public Date getLockTime() {
		return lockTime;
	}

	public void setLockTime(Date lockTime) {
		this.lockTime = lockTime;
	}

	public String getResetToken() {
		return resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}

	// To String
	@Override
	public String toString() {
		return "User [uId=" + uId + ", name=" + name + ", mobile=" + mobile + ", email=" + email + ", profile="
				+ profile + ", gender=" + gender + ", password=" + password + ", Address=" + Address + ", city=" + city
				+ ", state=" + state + ", pincode=" + pincode + ", provider=" + provider + ", enanled=" + enabled
				+ ", emailverified=" + emailverified + ", role=" + Role + "]";
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		return email;
	}

	public String profileurl(User user) {
		if (user.getProfile().equals("")) {
			return "/img/default.png";
		} else {
			if (user.getProvider().equals("SELF")) {
				return "https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/" + user.getProfile() + ".png";
			} else {
				return user.getProfile();
			}
		}
	}
}
