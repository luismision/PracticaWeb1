package com.practica1_81_07.model.managers;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.practica1_81_07.model.Event;

public class ManagerEvent implements ManagerJpa<Event>{

	private EntityManager em;
	private EntityTransaction et;
	
	public ManagerEvent() {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PracticaWebShared");
		em = emf.createEntityManager();
		et = em.getTransaction();
	}
	
	
	public Event insert(Event event) {
		
		try {
			et.begin();
			
			em.persist(event);
			
			et.commit();
		} catch (Exception e) {
			if(et!= null) {
				et.rollback();
			}
		} 
		return event;
	}
	
	public boolean delete(Event event) {
		
		try {
			et.begin();
			
			em.remove(event);
			
			et.commit();
		} catch (Exception e) {
			if(et!= null) {
				et.rollback();
			}
			return false;
		} 
		return true;
	}

	public Event findByName(String name){
		Event event; 
		Query q = em.createNamedQuery("Ticket.findByName");
		q.setParameter("name", name);
		try{ 
			event = (Event)q.getSingleResult();
		}catch(Exception e) {
			return null; 
		}
		return event;
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