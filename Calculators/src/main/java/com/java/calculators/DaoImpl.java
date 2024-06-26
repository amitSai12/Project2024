package com.java.calculators;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.faces.context.FacesContext;


import com.java.calculators.SessionHelper;

public class DaoImpl implements Dao {
	
	 


	@Override
	public int sum(Mathematics maths) {
		// TODO Auto-generated method stub
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.clear();
		int num1 = maths.getNum1();
		int num2 = maths.getNum2();
		
		int result  = num1+num2;
		
		sessionMap.put("result", result);
		
		return result;
	}

	@Override
	public int sub(Mathematics maths) {
		// TODO Auto-generated method stub
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.clear();
		int num1 = maths.getNum1();
		int num2 = maths.getNum2();
		
		int result  = num1-num2;
		
		sessionMap.put("result", result);
		return result;
	}

	@Override
	public int mul(Mathematics maths) {
		// TODO Auto-generated method stub
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.clear();
		int num1 = maths.getNum1();
		int num2 = maths.getNum2();
		
		int result  = num1*num2;
		
		sessionMap.put("result", result);
		return result;
	}

	
	public static double formatDouble(double value, int decimalPlaces) {
	    String format = "%." + decimalPlaces + "f";
	    return Double.parseDouble(String.format(format, value));
	}

	@Override
	public int divs(Mathematics maths) {
		// TODO Auto-generated method stub
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.clear();
		int num1 = maths.getNum1();
		int num2 = maths.getNum2();
		
		double div  = (double)num1/num2;
		int rem = num1%10;
		
		double result = formatDouble(div, 2);
		sessionMap.put("result", result);
		sessionMap.put("rem", rem);
		
		return rem;
	}
	
	
	 private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
    public String ageCalculator(AgeCalculator age) {
	        // Parse born and died dates from the POJO
		LocalDate bornDate;
        LocalDate diedDate;

        // Attempt to parse dates from strings
        bornDate = parseDate(age.getBorn());
        diedDate = (age.getDied() != null && !age.getDied().isEmpty()) ? parseDate(age.getDied()) : LocalDate.now();

        // Calculate difference between dates
        Period period = Period.between(bornDate, diedDate);

        // Format the period into a string representation
        return formatPeriod(period);
	    }
	
	

    private static LocalDate parseDate(String dateStr) {
        try {
            // Primary pattern (e.g., "Tue Jun 18 00:00:00 IST 2024")
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss z yyyy");
            return LocalDate.parse(dateStr, formatter);
        } catch (DateTimeParseException e1) {
            try {
                // Fallback pattern (e.g., "2024-06-18")
                DateTimeFormatter fallbackFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                return LocalDate.parse(dateStr, fallbackFormatter);
            } catch (DateTimeParseException e2) {
                // As a last resort, try parsing using SimpleDateFormat for other possible formats
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
                    Date date = sdf.parse(dateStr);
                    return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                } catch (ParseException e3) {
                    throw new IllegalArgumentException("Invalid date format: " + dateStr);
                }
            }
        }
    }


	    public String formatPeriod(Period period) {
	    	Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
	        int years = period.getYears();
	        int months = period.getMonths();
	        int days = period.getDays();
	        String ageOf =  years + " years, " + months + " months, " + days + " days";
	        sessionMap.put("ageOf", ageOf);
	        return ageOf;
	    }
}
