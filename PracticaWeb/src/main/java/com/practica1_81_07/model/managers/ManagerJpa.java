package com.practica1_81_07.model.managers;

public interface ManagerJpa<T> {
	public  T insert(T object);
	public  T  findByName(String name); 
	public boolean delete(T object);
}
