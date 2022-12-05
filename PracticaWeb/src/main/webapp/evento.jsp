<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Riditickets</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/evento.css"/>
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<nav id = "header">
            <ul>    
                <li id = "logo_container" >
                	<a href ="/USER8107" target="_blank"><img  id = "logo"  src = "/USER8107/images/logo.png" alt="logo"></a>
                </li>
                <li id = "search_container" >
                </li> 
                <li id = "sesion_container">
                	<ul>
	               		<li id = "username_container"><c:if test = "${!empty sessionScope.currentUser}"> <h2><c:out value="${sessionScope.currentUser.userName}"/></h2></c:if></li>
	                	<li id = "log_out_button_container"><c:if test = "${!empty sessionScope.currentUser}"><a href = "/USER8107/logOut"><button id = "log_out_button" class = "stylebutton">CERRAR SESIÓN</button></a></c:if></li>
                	</ul> 
                    <c:if test = "${empty sessionScope.currentUser}"> <a href = "/USER8107/logIn.jsp"><button id = "log_in_button" class = "stylebutton">INICIAR SESIÓN</button></a></c:if>		  
                </li>  
            </ul>
        </nav>
        <div class="containerfull">
        
         	<img class="imagenBlur" src="/USER8107/getImage?id=${requestScope.currentEvent.id}">
         	<img class="imagenEvento" src="/USER8107/getImage?id=${requestScope.currentEvent.id}">
         	
         	<div class="info">
         	<div id = ultimas-container-info>
         	<div id = "caracteristicas">
	            	<ul>
	            		<li class = "fecha-evento-container">
	            			<div>
	            				<p id="fechaevento">${requestScope.currentEvent.date}</p>
	            			</div>
	            			
	            		</li>
	            		<li class = "info-evento-container">
	                         <p>Ciudad: ${requestScope.currentEvent.city}</p>
	                         <p>Sala: ${requestScope.currentEvent.room}</p>
	                         <p>Categoría: ${requestScope.currentEvent.category}</p> 	            		
	                     </li>
	            		<li class = "titulo-evento-container">
	                         <h2>${requestScope.currentEvent.name}</h2>
	            		</li>
	            		
	            	</ul>
            </div>
        </div>
        <div id="descripcionevento">
            	<p>${requestScope.currentEvent.description}</p>
            </div>
        </div>
        <div id = "ultimas-experiencias" class = "container">
        	<c:if test = "${!empty sessionScope.currentUser}">
        		<a href="/USER8107/createTicketPage?id=${requestScope.currentEvent.id}">
        			<button class = "stylebutton vender-ticket-button">VENDER TICKET</button>
        		</a>
        	</c:if>
            <div id = "ultimas-container">
				<c:forEach items="${requestScope.currentEvent.tickets}" var="ticket">
					
	            	<div class = "ultimo-evento">
		            	<ul>
		            		<li class = "imagen-evento-container">
		            			<div>
		            				<p class="precioevento">${ticket.prize}$</p>
		            			</div>
		            			
		            		</li>
		            		<li class = "desc-evento-container">
		            			<div>
		                        	<h3>ID: ${ticket.code}</h3>
		                        </div>
		                         <h2>Propietario: ${ticket.user.userName}</h2>
		                         <h2>Tipo: ${ticket.type}</h2>
		            		</li>
		            		<li class = "button-evento-container">
		            			<button class = "stylebutton visitar-exp-admin">COMPRAR</button>
		            			
		            		</li>
		            	</ul>
	            	</div>
            	</c:forEach> 
        	</div>
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
        
        
</body>
</html>