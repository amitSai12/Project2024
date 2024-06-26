package com.java.quiz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;



public class DaoImpl {

	SessionFactory sf;
	Session session;


	static int id=1;
	static int score=0;


	public String addUser(User user) {
		Map<String,Object> sessionMaps = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();

		Transaction trans = session.beginTransaction();
		session.save(user);
		trans.commit();
		System.out.println("User ID: "+user);
		sessionMaps.put("userId", user.getId());
		// ---------------------------------------------------------------------------------------------------------------	
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();

		int id = 1;

		System.out.println("SearchBeforeUhId: "+id);

		Criteria cr = session.createCriteria(Question.class);
		cr.add(Restrictions.eq("id", id));

		System.out.println("SearchAfterUhId: "+id);

		List<Question> questionlist = cr.list();

		System.out.println("questionlist: "+questionlist);

		//returning the patientList with according to the fetched uhId 
		//this is implemented for the show details
		sessionMap.put("id", id);
		sessionMap.put("questionlist", questionlist);

		return "Question.jsp?faces-redirect=true";
	}



//	public List<Question> quizQuestions(){
//		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//		sf = SessionHelper.getConnection();
//		session = sf.openSession();
//
//
//
//		System.out.println("SearchBeforeUhId: "+id);
//
//		Criteria cr = session.createCriteria(Question.class);
//		cr.add(Restrictions.eq("id", id));
//
//		System.out.println("SearchAfterUhId: "+id);
//
//		List<Question> questionlist = cr.list();
//
//		System.out.println("questionlist: "+questionlist);
//
//		//returning the patientList with according to the fetched uhId 
//		//this is implemented for the show details
//		sessionMap.put("id", id);
//		sessionMap.put("questionlist", questionlist);
//
//		return questionlist;
//	}
//
//
	
	public String questionNo(int id) {	
		// get the sessionMap from the current faces context
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();

		System.out.println("SearchBeforeUhId: "+id);
		
		User user = new User();
		
		String username = user.getName();

		Criteria cr = session.createCriteria(Question.class);
		cr.add(Restrictions.eq("id", id));

		System.out.println("SearchAfterUhId: "+id);

		List<Question> questionlist = cr.list();

		System.out.println("questionlist: "+questionlist);

		//returning the patientList with according to the fetched uhId 
		//this is implemented for the show details
		sessionMap.put("id", id);
		sessionMap.put("questionlist", questionlist);
		id  =id+1;
		return "Question.jsp?faces-redirect=true";
	}


	public List<Question> quizDb(){
		sf = SessionHelper.getConnection();
		session = sf.openSession();

		Criteria cr = session.createCriteria(Question.class);
		List<Question> l = cr.list();

		return l;
	}


	public String nextQuestion(Question question){
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		
		Transaction trans = session.beginTransaction();
		
		Criteria criteria = session.createCriteria(Question.class)
                .add(Restrictions.eq("id", id))
                .setProjection(Projections.property("correctAnswer"));

		String correctAnswer = (String) criteria.uniqueResult();

	
			System.out.println("correctAnswer: "+correctAnswer);
			System.out.println("Answer: "+question.getCorrectAnswer());
		// Compare selected answer with the correct answer
		if(correctAnswer!=null) {
			if (correctAnswer.equals(question.getCorrectAnswer())) {
				score =1;
			}else {
				score =0;
			}
		}else {
			return "ENd.jsp?faces-redirect=true";
		}
		
		
		// Using Criteria to update user score
		System.out.println("User Identity: "+sessionMap.get("userId"));
		Criteria crit = session.createCriteria(User.class).add(Restrictions.eq("id", sessionMap.get("userId")));
		
		
		User user = (User) crit.uniqueResult();

		if (user != null) {
			user.setScore(user.getScore()+score);
			session.update(user);
			trans.commit();
		}
		
		System.out.println("User: "+user);
		System.out.println(user.getScore());
		
		sessionMap.put("score",user.getScore());
		
		
		id=id+1;

		Criteria cr = session.createCriteria(Question.class);
		cr.add(Restrictions.eq("id", id));

		System.out.println("SearchAfterId: "+id);

		List<Question> questionlist = cr.list();

		System.out.println("questionlist: "+questionlist);

		//returning the patientList with according to the fetched uhId 
		//this is implemented for the show details
		sessionMap.put("id", id);
		sessionMap.put("questionlist", questionlist);
		
		
		if(id<=10) {
			return "Question.jsp?faces-redirect=true";
		}else {
			return "ENd.jsp?faces-redirect=true";
		}
		
	}
}
