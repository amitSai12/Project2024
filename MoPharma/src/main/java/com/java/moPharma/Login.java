package com.java.moPharma;

public class Login {

	private String username;
	private String password;
	private int otp;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getOtp() {
		return otp;
	}
	public void setOtp(int otp) {
		this.otp = otp;
	}
	
	@Override
	public String toString() {
		return "Login [username=" + username + ", password=" + password + ", otp=" + otp + "]";
	}
	
	public Login(String username, String password, int otp) {
		super();
		this.username = username;
		this.password = password;
		this.otp = otp;
	}
	
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
}
