package com.practica1_81_07.manager;

import java.sql.Connection;
import java.sql.Statement;
import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.naming.InitialContext;

import com.practica1_81_07.beans.User;

public class ManagerDB {
	
	@Resource(mappedName = "TIWDS")
	DataSource ds; 
	Connection conn; 
	
	public static void insertUser(User user) {
		try {
			InitialContext initCont = new InitialContext(); 
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}