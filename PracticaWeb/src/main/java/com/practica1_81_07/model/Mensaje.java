package com.practica1_81_07.model;

import java.io.Serializable;
import java.time.Instant;



@SuppressWarnings("serial")

public class Mensaje implements Serializable{
	    
	private String id;

	private String userori;
    
    private String userdest;
     
    private String mensaje;
    
	private String date;

    

	public Mensaje() {
		
	}

	public Mensaje(String userori, String userdest, String mensaje) {
		this.userori = userori;
		this.userdest = userdest;
		this.mensaje = mensaje;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getUserori() {
		return userori;
	}

	public void setUserori(String userori) {
		this.userori = userori;
	}

	public String getUserdest() {
		return userdest;
	}

	public void setUserdest(String userdest) {
		this.userdest = userdest;
	}

	public String getMensaje() {
		return this.mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
	public Instant getDate() {
		Instant instant = Instant.parse(this.date);
		return instant;
	}

	public void setDate(Instant date) {
		this.date = date.toString();
	}

	@Override
	public String toString() {
		return "Mensaje [userori=" + userori + ", userdest=" + userdest + ", mensaje=" + mensaje
				+ "]";
	}
   
}
