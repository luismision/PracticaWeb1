package com.practica1_81_07.model.managers;



import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.practica1_81_07.model.Ticket;

public class ManagerTicket implements ManagerJpa<Ticket>{

	private EntityManager em;
	private EntityTransaction et;
	
	public ManagerTicket() {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PracticaWebShared");
		em = emf.createEntityManager();
		et = em.getTransaction();
	}
	

	public Ticket insert(Ticket ticket) {
		try {
			et.begin();
			
			em.persist(ticket);
			
			et.commit();
		} catch (Exception e) {
			if(et!= null) {
				et.rollback();
			}
		} 
		return ticket;
	}

	public boolean delete(Ticket ticket) {
		
		try {
			et.begin();
			
			em.remove(ticket);
			
			et.commit();
		} catch (Exception e) {
			if(et!= null) {
				et.rollback();
			}
			return false;
		} 
		return true;
	}

	public Ticket findByName(String name){
		Ticket ticket; 
		Query q = em.createNamedQuery("Ticket.findByName");
		q.setParameter("name", name);
		try{ 
			ticket = (Ticket)q.getSingleResult();
		}catch(Exception e) {
			return null; 
		}
		return ticket;
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