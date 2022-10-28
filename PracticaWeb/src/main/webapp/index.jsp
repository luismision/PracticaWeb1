<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="styles/searchIndex.css" rel="stylesheet" />
    <title>Riditickets</title>

  </head>
  <body>
    <c:if test = "${empty sessionScope.currentUser}">
  	  <a href = "/PracticaWeb/logIn.jsp"><button id = "log_in_button" class = "stylebutton log_in_out_button">INICIAR SESIÓN</button></a>
    </c:if>
  	<c:if test = "${!empty sessionScope.currentUser}">
      <h2 id="username">${sessionScope.currentUser.userName}</h2>
      <a href="/PracticaWeb/logOut"><button id = "log_out_button" class = "stylebutton log_in_out_button">CERRAR SESIÓN</button></a>
    </c:if>
  	<img id="background-image" src="images/experiencias_memorables-1066911468.jpg">
  	<div id = "main-div">
  		<div id = "searh-container">
        <form id = "search-form" action="/PracticaWeb/searchEvent" method="post" >
          <input id="text-input" type="text" name="search" class="search-input" placeholder="Nombre del evento..." />
          <input id="city" name="city" type="text" class="search-input" placeholder="Ciudad..."/> 
          <input id="sala" name="room" type="text" class="search-input" placeholder="Sala o estadio..."/> 
          <input id="date" class="search-input" type="date" name="date">
          <input id="date" class="search-input" type="date" name="date2">
           <select class="search-input" name="category" id="category">
           	   <option value="default">Tipo de evento</option>	
           	   <option value="any">Cualquiera</option>
               <option value="Concierto">Concierto</option>
               <option value="Futbol">Partido de futbol</option>
               <option value="Baloncesto">Partido de baloncesto</option>
               <option value="Teatro">Obra de teatro</option>
               <option value="Meeting">Meeting</option>
           </select>
          <button id="search-submit" class="search-input" type="submit"><i class="fa fa-search"></i></button>
        </form>
  		</div>
  		<div  id = "ver_eventos_button_container">
  			<a href = "/PracticaWeb/nextEvents"><button id = "ver_eventos_button" class = "stylebutton">VER TODOS LOS EVENTOS</button></a>
  		</div>
  	</div>
  	
  <script src = "https://kit.fontawesome.com/4a16a33ac0.js" crossorigin="anonymous"></script> 
  </body>
</html>