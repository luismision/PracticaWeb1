package com.practica1_81_07.control.handlers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practica1_81_07.model.Event;
import com.practica1_81_07.model.managers.ManagerEvent;

public class SearchHandler implements IHandler{

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        // TODO Auto-generated method stub

        return "eventSearch.jsp";
    }

}
