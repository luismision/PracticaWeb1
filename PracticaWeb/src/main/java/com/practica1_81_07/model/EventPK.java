package com.practica1_81_07.model;

import java.io.Serializable;
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
	public java.util.Date getDate() {
		return this.date;
	}
	public void setDate(java.util.Date date) {
		this.date = date;
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