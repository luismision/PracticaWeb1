package com.practica1_81_07.control.handlers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IHandler {
    public String process(HttpServletRequest req, HttpServletResponse res);
}
