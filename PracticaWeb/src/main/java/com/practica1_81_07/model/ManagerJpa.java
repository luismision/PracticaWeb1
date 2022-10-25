package com.practica1_81_07.model;

public interface ManagerJpa {
	public Object insert(Object object);
	public boolean delete(Object object);
	public Object findByName(String name); 
		
	
}
