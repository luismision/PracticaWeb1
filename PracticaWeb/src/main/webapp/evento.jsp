<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Riditickets</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                <a href ="/PracticaWeb" target="_blank">
                <img  id = "logo"  src = "/PracticaWeb/images/logo.png" alt="logo"></a>
                </li>
               
                <li id = "search_container" >
                    <form id = "searcher" action ="" method = "post">
                        <label><input id="searchterm" type="text" placeholder="Buscar..."/>ㅤ</label>
                        <button id="buttonsearch" type = "submit">
                            <img id = "lupa" alt="buscador"src = "/PracticaWeb/images/lupa.png">
                        </button>
                    </form>
                </li> 
                <li id = "sesion_container">
                	<ul>
	               		<li id = "username_container"><c:if test = "${!empty sessionScope.currentUser}"> <h2><c:out value="${sessionScope.currentUser.userName}"/></h2></c:if></li>
	                	<li id = "log_out_button_container"><c:if test = "${!empty sessionScope.currentUser}"><a href = "/PracticaWeb/logOut"><button id = "log_out_button" class = "stylebutton">CERRAR SESIÓN</button></a></c:if></li>
                	</ul> 
                    <c:if test = "${empty sessionScope.currentUser}"> <a href = "/PracticaWeb/logIn.jsp"><button id = "log_in_button" class = "stylebutton">INICIAR SESIÓN</button></a></c:if>
					  
                </li>  
            </ul>            
        </nav>
        
        <div class="containerfull">
        
        	
        
         	<img class="imagenBlur" src="images/torre.jpg">
         	<img class="imagenEvento" src="images/torre.jpg">
         	
         	<div class="info">
         	<div id = ultimas-container>
         	<div id = "caracteristicas">
	            	<ul>
	            		<li class = "fecha-evento-container">
	            			<div>
	            				<p id="fechaevento">15 DIC</p>
	            			</div>
	            			
	            		</li>
	            		<li class = "info-evento-container">
	                         <p>Ciudad: Madrid</p>
	                         <p>Sala: manca</p>
	                         <p>Categoría: Mono</p> 	            		
	                     </li>
	            		<li class = "titulo-evento-container">
	                         <h2>titulo</h2>
	            		</li>
	            		
	            	</ul>
            	</div>
        </div>
        </div>
         <div id = "ultimas-experiencias" class = "container">
        	
            <div id = "ultimas-container">
				
            	<div class = "ultimo-evento">
	            	<ul>
	            		<li class = "imagen-evento-container">
	            			<div>
	            				<img src = "https://pbs.twimg.com/media/Ff6hRaAWAAAIheR?format=jpg&name=small">
	            			</div>
	            			
	            		</li>
	            		<li class = "desc-evento-container">
	            			<div>
	                        	<h3>Categoría: Mono</h3>
	                        </div>
	                         <h2>titulo</h2>
	                         <p>Ciudad: Madrid</p>
	                         <p>Sala: manca</p>
	                         <p>Fecha: mañana</p> 
	            		</li>
	            		<li class = "button-evento-container">
	            			<button class = "stylebutton visitar-exp-admin">VISITAR EVENTO</button>
	            			<button class = "stylebutton visitar-exp-admin">MODIFICAR EVENTO</button>
	            			<button class = "stylebutton visitar-exp-admin">ELIMINAR EVENTO</button>
	            		</li>
	            	</ul>
            	</div>
            	<div class = "ultimo-evento">
	            	<ul>
	            		<li class = "imagen-evento-container">
	            			<div>
	            				<img src = "https://pbs.twimg.com/media/Ff6hpHeWIAIGG3O?format=jpg&name=900x900">
	            			</div>
	            			
	            		</li>
	            		<li class = "desc-evento-container">
	            			<div>
	                        	<h3>Categoría: Mono</h3>
	                        </div>
	                         <h2>titulo</h2>
	                         <p>Ciudad: Madrid</p>
	                         <p>Sala: manca</p>
	                         <p>Fecha: mañana</p> 
	            		</li>
	            		<li class = "button-evento-container">
	            			<button class = "stylebutton visitar-exp">VISITAR EVENTO</button>
	            		</li>
	            	</ul>
            	</div>
            	<div class = "ultimo-evento">
	            	<ul>
	            		<li class = "imagen-evento-container">
	            			<div>
	            				<img src = "https://pbs.twimg.com/media/Ff6hRaAWAAAIheR?format=jpg&name=small">
	            			</div>
	            			
	            		</li>
	            		<li class = "desc-evento-container">
	            			<div>
	                        	<h3>Categoría: Mono</h3>
	                        </div>
	                         <h2>titulo</h2>
	                         <p>Ciudad: Madrid</p>
	                         <p>Sala: manca</p>
	                         <p>Fecha: mañana</p> 
	            		</li>
	            		<li class = "button-evento-container">
	            			<button class = "stylebutton visitar-exp">VISITAR EVENTO</button>
	            		</li>
	            	</ul>
            	</div>
            	<div class = "ultimo-evento">
	            	<ul>
	            		<li class = "imagen-evento-container">
	            			<div>
	            				<img src = "https://www.entornoturistico.com/wp-content/uploads/2017/03/Evento-corporativo-1280x720.jpg">
	            			</div>
	            			
	            		</li>
	            		<li class = "desc-evento-container">
	            			<div>
	                        	<h3>Categoría: Mono</h3>
	                        </div>
	                         <h2>titulo</h2>
	                         <p>Ciudad: Madrid</p>
	                         <p>Sala: manca</p>
	                         <p>Fecha: mañana</p> 
	            		</li>
	            		<li class = "button-evento-container">
	            			<button class = "stylebutton visitar-exp">VISITAR EVENTO</button>

	            		</li>
	            	</ul>
            	</div>
            	<div class = "ultimo-evento">
	            	<ul>
	            		<li class = "imagen-evento-container">
	            			<div>
	            				<img src = "https://pbs.twimg.com/media/Ff6hRaAWAAAIheR?format=jpg&name=small">
	            			</div>
	            			
	            		</li>
	            		<li class = "desc-evento-container">
	            			<div>
	                        	<h3>Categoría: Mono</h3>
	                        </div>
	                         <h2>titulo</h2>
	                         <p>Ciudad: Madrid</p>
	                         <p>Sala: manca</p>
	                         <p>Fecha: mañana</p> 
	            		</li>
	            		<li class = "button-evento-container">
	            			<button class = "stylebutton visitar-exp">VISITAR EVENTO</button>
	            		</li>
	            	</ul>
            	</div>
        	</div>
        </div>
        </div>
        
        
</body>
</html>