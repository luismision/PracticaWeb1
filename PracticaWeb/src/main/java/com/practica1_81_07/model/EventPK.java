package com.practica1_81_07.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.*;

/**
 * The primary key class for the events database table.
 * 
 */
@Embeddable
public class EventPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private String name;

	private String city;

	@Temporal(TemporalType.DATE)
	private java.util.Date date;

	public EventPK() {
	}
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return this.city;
	}
	public void setCity(String city) {
		this.city = city;
	}
    public String getDate() {
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");  
        String strDate = dateFormat.format(this.date); 
        return strDate;
    }
    public void setDate(String date) throws ParseException { 
        java.util.Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date);  
        this.date = date1;
    }

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof EventPK)) {
			return false;
		}
		EventPK castOther = (EventPK)other;
		return 
			this.name.equals(castOther.name)
			&& this.city.equals(castOther.city)
			&& this.date.equals(castOther.date);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.name.hashCode();
		hash = hash * prime + this.city.hashCode();
		hash = hash * prime + this.date.hashCode();
		
		return hash;
	}

}