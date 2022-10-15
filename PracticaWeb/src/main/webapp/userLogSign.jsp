<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<div id = "Log-in-pop-up" class="log-sign-up pop-up ">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div  class="content-sign-log content-pop-up">
                <div class="image-log-sign">
                    <img alt="log-in" src="images/log-in2.png">
                </div>
                <div class="log-sign-izq">
                    <form action = "/PracticaWeb/login" method = "post"  class="log-sign-container" id="log-in-form">
                        <h2>Inicia sesión</h2>
                        <div class = "error-message" id = "user-not-found"><img alt="error1" src = "images/error.png"><div class = "text-error">El usuario introducido no existe</div></div>
                        <div class = "error-message" id = "wrong-password-log-in"><img alt="error2" alt="imagen1" src = "images/error.png"><div class = "text-error">La contraseña que ha introducido no es correcta. Intenetelo de nuevo</div></div>
                        <div class="form-element">
                            <label><h3>Nombre de usuario</h3><input  name = "name" alt="nombre"type="text"></label>
                        </div>
                        <div class="form-element">                           
                            <label><h3>Contraseña</h3><input name = "password" type="password"></label>
                        </div>
                        <input type = "submit" id = "Log-in-pop-up-button" class="stylebutton log-sign-button"></input>
                    </form>
                    <h3>¿No tienes cuenta? <a id = "crear-cuenta-a" class = "iniciar-crear-a">Crear cuenta</a></h3>
                </div>
            </div>
        </div>
</head>
<body>

</body>
</html>