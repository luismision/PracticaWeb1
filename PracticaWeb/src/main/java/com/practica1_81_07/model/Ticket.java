package com.practica1_81_07.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the tickets database table.
 * 
 */
@Entity
@Table(name="tickets")
@NamedQuery(name="Ticket.findAll", query="SELECT t FROM Ticket t")
public class Ticket implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private BigDecimal prize;

	//bi-directional many-to-one association to Event
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name="eventCity", referencedColumnName="city"),
		@JoinColumn(name="eventDate", referencedColumnName="date"),
		@JoinColumn(name="eventName", referencedColumnName="name")
		})
	private Event event;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="owner")
	private User user;

	public Ticket() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public BigDecimal getPrize() {
		return this.prize;
	}

	public void setPrize(BigDecimal prize) {
		this.prize = prize;
	}

	public Event getEvent() {
		return this.event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}