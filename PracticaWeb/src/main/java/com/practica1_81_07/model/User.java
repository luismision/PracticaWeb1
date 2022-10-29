package com.practica1_81_07.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
@NamedQueries({
    @NamedQuery(name="User.findAll", query="SELECT u FROM User u"),
    @NamedQuery(name="User.findByName", query="SELECT u FROM User u where u.userName = :name ")
    /*@NamedQuery(name="User.findByNameContaining", query="SELECT u FROM User u where u.userName LIKE CONCAT('%',:name,'%')")*/
})
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String userName;

	private String address;

	private String fullName;

	private String password;

	private int phone;

	//bi-directional many-to-one association to Ticket
	@OneToMany(mappedBy="user")
	private List<Ticket> tickets;

	public User() {
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPhone() {
		return this.phone;
	}

    public void setPhone(String phone) {
        this.phone = Integer.parseInt(phone);
    }

	public List<Ticket> getTickets() {
		return this.tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}

	public Ticket addTicket(Ticket ticket) {
		getTickets().add(ticket);
		ticket.setUser(this);

		return ticket;
	}

	public Ticket removeTicket(Ticket ticket) {
		getTickets().remove(ticket);
		ticket.setUser(null);

		return ticket;
	}

}