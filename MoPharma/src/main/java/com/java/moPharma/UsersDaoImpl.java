package com.java.moPharma;

import java.util.Map;

import javax.faces.context.FacesContext;

import org.apache.http.conn.params.ConnConnectionParamBean;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import io.undertow.server.session.SessionManager;


public class UsersDaoImpl implements UsersDao {
	
	SessionFactory sf ;
	Session session;

	
	
	public String generateOtp() {
		int len = 4;
		String AlphaNumericString = "0123456789";
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++) {
			int index = (int) (AlphaNumericString.length() * Math.random());
			sb.append(AlphaNumericString.charAt(index));
		}
		return sb.toString();
	}

	@Override
	public String login(Users user) {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Users.class);
		
		cr.add(Restrictions.eq("username", user.getUsername()));
		cr.add(Restrictions.eq("password",EncryptPassword.getCode(user.getPassword())));
		
		 Users users=(Users) cr.uniqueResult();
		 
		 
		 Login login = searchPatientList(user.getUsername());
		 int otp=Integer.parseInt(generateOtp());	
		 
		 
		 System.out.println(otp);
		 login.setOtp(otp);
		 
		 Transaction trans = session.beginTransaction();
		 session.update(login);
		 trans.commit();
		 
		 sessionMap.put("login",login);
		 
		if(users!=null) {
			return "Otp.jsp?faces-redirect=true";
		}else {
			System.out.println("nai");
			return "nai";
		}
	}
	
	@Override
	public String otpCheck(Login login) {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Login.class);
		
		
		Login login2 =  (Login) sessionMap.get("login");
		int otp = login2.getOtp();
		
		cr.add(Restrictions.eq("username", login2.getUsername()));
		cr.add(Restrictions.eq("otp",login2.getOtp()));
		
		Login logins = (Login) cr.uniqueResult();
		
		
		if(logins!=null && otp!=login2.getOtp()) {
			return "DashBoard.jsp?faces-redirect=true";
		}else {
			System.out.println(login2.getUsername());
			System.out.println(login2.getOtp());
			System.out.println(logins);
			System.out.println("nai");
			return "nai";
		}
	}

	@Override
	public String register(Users users) {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Transaction trans = session.beginTransaction();
		
		users.setPassword(EncryptPassword.getCode(users.getPassword()));
		session.save(users);
		trans.commit();
		Login login=new Login();
		Transaction trans1 = session.beginTransaction();
		login.setUsername(users.getUsername());
		login.setPassword(users.getPassword());
		session.save(login);
		trans1.commit();
		return "Login.jsp?faces-redirect=true";
	}
	
	
	public Login searchPatientList(String username){
		
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		
		Criteria criteria = session.createCriteria(Login.class);
		criteria.add(Restrictions.eq("username", username));
		
		//as uhId is unique, this line is expected to execute the query and get a unique result
		Login patientDetail =  (Login) criteria.uniqueResult();
		sessionMap.put("patientDetail", patientDetail);
		return patientDetail;
	}

	
}
