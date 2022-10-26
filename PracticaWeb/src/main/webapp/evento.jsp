<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        
        <div class="container">
        
        	<h1>Cena en París</h1>
        
         	<img class="imagenBlur" src="images/torre.jpg">
         	<img class="imagenEvento" src="images/torre.jpg">
        </div>
        
        <div class="info">
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        </div>
        
        <div class="entradas">
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        <h4>Payno vallecano mi polla en tu mano</h4>
        </div>
</body>
</html>