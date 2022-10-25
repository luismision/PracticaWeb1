package com.practica1_81_07.model.managers;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.practica1_81_07.model.User;

public class ManagerUser implements ManagerJpa<User> {

	private EntityManager em;
	private EntityTransaction et;
	
	public ManagerUser() {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PracticaWebShared");
		em = emf.createEntityManager();
		et = em.getTransaction();
	}
	
	
	public User insert(User user) {
		
		try {
			et.begin();
			
			em.persist(user);
			
			et.commit();
		} catch (Exception e) {
			if(et!= null) {
				et.rollback();
			}
		} 
		return user;
	}

	public User findByName(String name){
		User user; 
		Query q = em.createNamedQuery("User.findByName");
		q.setParameter("name", name);
		try{ 
			user = (User)q.getSingleResult();
		}catch(Exception e) {
			return null; 
		}
		return user;
	}
	
	public boolean checkCredentials(String name, String password) {
		User user = findByName(name);
		if (user == null) {
			return false; 
		}
		if (user.getPassword().equals(password)) {
			return true;  
		}
		return false; 
	
		
	}

	
	public boolean delete(User user) {
		try {
			et.begin();
			
			em.remove(user);
			
			et.commit();
		} catch (Exception e) {
			if(et!= null) {
				et.rollback();
			}
			return false;
		} 
		return true;
	}
	
	
	
	/*
	@SuppressWarnings("unchecked")
	public List<User> findByNameContaining(String name){
		
		Query q= em.createNamedQuery("Person.findByNameContaining");
		q.setParameter("u", name);
		List <User> lista = q.getResultList();		
		return lista;
	}
	*/
	
	
	/*
	@SuppressWarnings("unchecked")
	public List<User> findAll(){
		Query q= em.createNamedQuery("Person.findAll");
		List <User> lista = q.getResultList();		
		return lista;
	}
	*/
}