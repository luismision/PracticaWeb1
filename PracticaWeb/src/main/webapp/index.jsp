<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div id = "ultimas-experiencias" class = "container">
            <h1>PROXIMOS EVENTOS</h1>
       
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
	            			<button class = "stylebutton visitar-exp">VISITAR EXPERIENCIA</button>
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
	            			<button class = "stylebutton visitar-exp">VISITAR EXPERIENCIA</button>
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
	            			<button class = "stylebutton visitar-exp">VISITAR EXPERIENCIA</button>
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
	            			<button class = "stylebutton visitar-exp">VISITAR EXPERIENCIA</button>
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
	            			<button class = "stylebutton visitar-exp">VISITAR EXPERIENCIA</button>
	            		</li>
	            	</ul>
            	</div>
        	</div>
        </div>
        <div id="mas-añadir">
            <img src = "images/mas.png" alt="nueva experiencia">
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
       

        <!--############################### Pop-up ###################################-->



             
    <script src = "https://kit.fontawesome.com/4a16a33ac0.js" crossorigin="anonymous"></script> 
    <script src = "scripts/clases.js"></script>
    <script src = "scripts/autoGen.js"></script>
    <script src = "scripts/imageChecker.js"></script>
    <script src = "scripts/cookiesGenerator.js"></script>
    <script src = "scripts/localStorageRefresh.js"></script>
    <script src = "scripts/localStorageHolder.js"></script>
    <script src = "scripts/genIndex.js"></script>
    <script src = "scripts/genExp-pop.js"></script>
    <script src = "scripts/gen-colecciones-pop.js"></script>
    <script src = "scripts/sticky.js"></script>
    <!--<script src = "scripts/pop-ups.js"></script>-->
    <script src = "scripts/search_animation.js"></script>
    <script src = "scripts/menuoptions.js"></script>
    <script src = "scripts/sesion.js"></script>
    <script src = "scripts/menuhover.js"></script>
    <script src = "scripts/crear-experiencia.js"></script>
    <script src = "scripts/planificar.js"></script>   
    <script src = "scripts/crear-coleccion.js"></script>
    <script src = "scripts/carousel.js"></script>
    <script src = "scripts/genColeccion.js"></script>
</body>
</html>