package com.practica1_81_07.control.handlers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.managers.ManagerEvent;

public class NextEventsHandler implements IHandler{

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        ManagerEvent MnEvent = new ManagerEvent();
        List<Event> eventList = MnEvent.findAll();
        req.setAttribute("eventList", eventList);
        return "eventSearch.jsp"; 
    }

}
