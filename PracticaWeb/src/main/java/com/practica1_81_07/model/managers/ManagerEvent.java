package com.practica1_81_07.model.managers;

import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.EventPK;
import com.practica1_81_07.model.Ticket;
import com.practica1_81_07.model.User;

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
	
	public boolean update(Event event) {
        
        try {
            et.begin();
            
            em.merge(event);
            
            et.commit();
        } catch (Exception e) {
            if(et!= null) {
                et.rollback();
            }
            return false;
        } 
        return true;
    }

	public Event findByPk(String name, String city, Date date){
		Event event;
		Query q = em.createNamedQuery("Event.findByPk");
		q.setParameter("name", name);
		q.setParameter("city", city);
		q.setParameter("date", date);
		try{ 
			event = (Event)q.getSingleResult();
		}catch(Exception e) {
			return null; 
		}
		return event;
	}
	
    @SuppressWarnings("unchecked")
    public List<Event> findAll(){
        Query q= em.createNamedQuery("Event.findAllByDate");
        List <Event> lista = q.getResultList();      
        return lista;
    }


    @Override
    public Event findByName(String name) {
        Event event; 
        Query q = em.createNamedQuery("Ticket.findByName");
        q.setParameter("name", name);
        try{ 
            event = (Event)q.getSingleResult();
        }catch(Exception e) {
            return null; 
        }
        return null;
    }


    @SuppressWarnings("unchecked")
    public List<Event> searchFind(List<String> inputs) throws ArrayIndexOutOfBoundsException, IllegalArgumentException, ParseException{
        Query q = em.createNamedQuery("Event.searchBy"); 
        
        if (inputs.get(3).isEmpty() && inputs.get(4).isEmpty()) {
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse("0000-01-01");
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse("9999-12-31");
            q.setParameter("date",date); 
            q.setParameter("date2", date2); 
        }
        else {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(inputs.get(3));
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(inputs.get(4));
            q.setParameter("date",date); 
            q.setParameter("date2", date2); 
        }
           
        q.setParameter("name",inputs.get(0));
        q.setParameter("room",inputs.get(1));
        q.setParameter("city",inputs.get(2));
        q.setParameter("category",inputs.get(5));
        
        List<Event> results = q.getResultList(); 
        return results; 
        
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

	*/
}