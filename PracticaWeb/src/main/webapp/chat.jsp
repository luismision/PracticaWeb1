<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.practica1_81_07.model.Mensaje" %>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Chat</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'><link rel="stylesheet" href="styles/chat.css">

</head>
<body>
<!-- partial:index.partial.html -->
<body>
  <div class="container">
    <div class="row">
      <nav class="menu">
        <ul class="items">
        <a href="/USER8107/index.jsp">
          <li class="item">
          
            <i class="fa fa-home" aria-hidden="true"></i>
          
          </li>
          </a>
          <li class="item item-active">
            <i class="fa fa-commenting" aria-hidden="true"></i>
          </li>
        </ul>
      </nav>

      <section class="discussions">
        <div class="discussion search">
         
        </div>
        <c:forEach items="${requestScope.contacts}" var="contact">
	        <a href="/USER8107/chat?userdest=${contact}">
	        <div class="discussion">
		       <div class="photo" style="background-image: url(https://residenciasuniversitarias.ulpgc.es/wp-content/uploads/Iconos-2.0-contacto_personal_gris.png);">
	          </div>
	          <div class="desc-contact">
		            <p class="name">${contact}</p>
	          </div>
	        </div>
	       </a>	    
          </c:forEach> 

      </section>
      <section class="chat">
        <div class="header-chat">
          <i class="icon fa fa-user-o" aria-hidden="true"></i>
          <p class="name">${requestScope.usuariodestino}</p>
         
        </div>
        <div class="messages-chat">
          <c:forEach items="${requestScope.chats}" var="msj">
	          <c:choose>
	          	<c:when test="${msj.userori == sessionScope.currentUser.username}">
			          <div class="message text-only">
			            <div class="response">
			              <p class="text"> ${msj.mensaje}</p>
			            </div>
			          </div>
		         </c:when>
		        
			      <c:otherwise>  
			          <div class="message text-only">
			            <p class="text"> ${msj.mensaje}</p>
			          </div>
		          </c:otherwise>
		      </c:choose>
          </c:forEach>  
		</div>
        <div class="footer-chat">
          <form action="/USER8107/enviarmensaje?userdest=${requestScope.usuariodestino}" method = "post" enctype="multipart/form-data">
	          <input type="text" class="write-message" name="mensaje" placeholder="Type your message here"></input>
	          <input name="login" type="submit" class="icon send fa fa-paper-plane-o clickable" aria-hidden="true">
          </form>
        </div>
      </section>
    </div>
  </div>
</body>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
