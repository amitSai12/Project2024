package com.java.moPharma;

public interface UsersDao {
		
	String register( Users users);
	
	String login(Users user);
	
	String otpCheck(Login login);

}
