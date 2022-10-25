package com.practica1_81_07.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the tickets database table.
 * 
 */
@Embeddable
public class TicketPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private int code;

	@Column(insertable=false, updatable=false)
	private String eventName;

	@Column(insertable=false, updatable=false)
	private String eventCity;

	@Temporal(TemporalType.DATE)
	@Column(insertable=false, updatable=false)
	private java.util.Date eventDate;

	public TicketPK() {
	}
	public int getCode() {
		return this.code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getEventName() {
		return this.eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventCity() {
		return this.eventCity;
	}
	public void setEventCity(String eventCity) {
		this.eventCity = eventCity;
	}
	public java.util.Date getEventDate() {
		return this.eventDate;
	}
	public void setEventDate(java.util.Date eventDate) {
		this.eventDate = eventDate;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof TicketPK)) {
			return false;
		}
		TicketPK castOther = (TicketPK)other;
		return 
			(this.code == castOther.code)
			&& this.eventName.equals(castOther.eventName)
			&& this.eventCity.equals(castOther.eventCity)
			&& this.eventDate.equals(castOther.eventDate);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.code;
		hash = hash * prime + this.eventName.hashCode();
		hash = hash * prime + this.eventCity.hashCode();
		hash = hash * prime + this.eventDate.hashCode();
		
		return hash;
	}
}