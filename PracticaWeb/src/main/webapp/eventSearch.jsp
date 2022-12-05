<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.practica1_81_07.model.Event" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Riditickets</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/main.css"/>
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
        <nav id = "header">
            <ul>    
                <li id = "logo_container" >
                	<a href ="/USER8107" target="_blank"><img  id = "logo"  src = "/USER8107/images/logo.png" alt="logo"></a>
                </li>
                <li id = "search_container" >
                </li> 
                <li id = "sesion_container">
                	<ul>
	               		<li id = "username_container"><c:if test = "${!empty sessionScope.currentUser}"> <h2><c:out value="${sessionScope.currentUser.username}"/></h2></c:if></li>
	                	<li id = "log_out_button_container"><c:if test = "${!empty sessionScope.currentUser}"><a href = "/USER8107/logOut"><button id = "log_out_button" class = "stylebutton">CERRAR SESIÓN</button></a></c:if></li>
                	</ul> 
                    <c:if test = "${empty sessionScope.currentUser}"> <a href = "/USER8107/logIn.jsp"><button id = "log_in_button" class = "stylebutton">INICIAR SESIÓN</button></a></c:if>		  
                </li>  
            </ul>
        </nav>
        <div id = "ultimas-experiencias" class = "container">
        	<div id = proximos-container>
	            <h1>PROXIMOS EVENTOS</h1>
	            <c:if test="${sessionScope.currentUser.username == 'admin'}">
	            	<a href="crearEvento.html"><button  class = "stylebutton añadir-evento-boton">AÑADIR EVENTO</button></a>
	            </c:if>
       		</div>
            <div id = "ultimas-container">
				<div id = "search-container">
					<form id = "search-form" action="/USER8107/searchEvent" method="post" >
			          <input id="text-input" type="text" name="name" class="search-input" placeholder="Nombre del evento..." />
			          <input id="city" name="city" type="text" class="search-input" placeholder="Ciudad..."/> 
			          <input id="sala" name="room" type="text" class="search-input" placeholder="Sala o estadio..."/> 
			          <input id="date" class="search-input" type="date" name="date">
			          <input id="date" class="search-input" type="date" name="date2">
			           <select class="search-input" name="category" id="category">
			           	   <option value="default">Cualquiera</option>
			               <option value="Concierto">Concierto</option>
			               <option value="Futbol">Partido de futbol</option>
			               <option value="Baloncesto">Partido de baloncesto</option>
			               <option value="Teatro">Obra de teatro</option>
			               <option value="Meeting">Meeting</option>
			           </select>
			          <button id="search-submit" class="search-input" type="submit"><i class="fa fa-search"></i></button>
			        </form>
				</div>
				<c:forEach items="${requestScope.eventList}" var="event">
				<div class = "ultimo-evento">
	            	<ul>
	            		<li class = "imagen-evento-container">
	            			<div>
	            				<img src = "/USER8107/getImage?id=${event.id}"/>
	            			</div>  			
	            		</li>
	            		<li class = "desc-evento-container">
	            			<div>
	                        	<h3>Categoría: ${event.category} </h3>
	                        </div>
	                         <h2>${event.name}</h2>
	                         <p>Ciudad: ${event.city}</p>
	                         <p>Sala: ${event.room}</p>
	                         <p>Fecha: ${event.date}</p> 
	            		</li>
	            		<c:choose>
							  <c:when test="${sessionScope.currentUser.username == 'admin'}">
							  	<li class = "button-evento-container">
			            			<a href="/USER8107/buyTickets?id=${event.id}"><button class = "stylebutton visitar-exp-admin">COMPRAR ENTRADAS</button></a>
			            			<a href="/USER8107/modifyEventPage?id=${event.id}"><button class = "stylebutton visitar-exp-admin">MODIFICAR EVENTO</button></a>
			            			<a href="/USER8107/deleteEvent?id=${event.id}"><button class = "stylebutton visitar-exp-admin">ELIMINAR EVENTO</button></a>
	            				</li>
							  </c:when>
							  <c:otherwise>
							   	<li class = "button-evento-container">
	            					<a href="/USER8107/buyTickets?id=${event.id}"><button class = "stylebutton visitar-exp">COMPRAR ENTRADAS</button></a>
	            				</li>
							  </c:otherwise>
						</c:choose>
	            	</ul>
            	</div>
				</c:forEach> 
        	</div>
        </div>
        <footer id = "footer_busqueda">
            <div id="enlaces">
                <p><a href="https://terminosycondiciones.es/">Términos y condiciones</a></p>
                <p><a href="https://support.google.com/adspolicy/answer/6018015?hl=es">Copyright</a></p>
                <p><a href="https://policies.google.com/privacy?hl=es">Política de privacidad</a></p>
                <div  id="redes">
                    <a href="https://twitter.com/DreekenLoL" ><img  alt="link1"src = "images/39552 .png" width="20"height="20"></a>
                    <a href="https://www.instagram.com/javiperez_4_/"><img  alt="link2" src = "images\1ed9a0fd507968861891b1098f480f4a.png"width="20"height="20"></a>
                    <a href="https://www.facebook.com/jorge.payno"><img  alt="link3" src = "images/37409.png"width="20"height="20"></a>
                </div>
            </div>
        </footer>
       

             
    <script src = "https://kit.fontawesome.com/4a16a33ac0.js" crossorigin="anonymous"></script> 
</body>
</html>