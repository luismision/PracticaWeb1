package com.practica1_81_07.control.handlers;

import java.lang.reflect.Array;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.managers.ManagerEvent;

public class SearchHandler implements IHandler{

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        // TODO Auto-generated method stub
        List<String> inputs = new ArrayList<String>(); 
        ManagerEvent MnEvent = new ManagerEvent(); 
        inputs.add(req.getParameter("search"));
        inputs.add(req.getParameter("room"));
        inputs.add(req.getParameter("city"));
        inputs.add(req.getParameter("date"));
        inputs.add(req.getParameter("date2"));
        inputs.add(req.getParameter("category"));
        try {
            List<Event> events = MnEvent.searchFind(inputs);
            req.setAttribute("eventList", events);
            return "eventSearch.jsp"; 
        } catch (ArrayIndexOutOfBoundsException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        
        return "eventSearch.jsp";
    }

}
