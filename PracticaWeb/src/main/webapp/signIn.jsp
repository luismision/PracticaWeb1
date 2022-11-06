<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SignIn</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles/login.css">
</head>
<body>
  <main>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6 login-section-wrapper">
        <a href = "/PracticaWeb"><img id = "logo-img" alt="logo" src="/PracticaWeb/images/logo.png"></a>
          <div class="login-wrapper my-auto">
            <h1 class="login-title">Sign In</h1>
            <c:if test = "${requestScope.wrongName}"> Ese nombre de usuario ya existe<br></c:if>
            <c:if test = "${requestScope.wrongPassword}"> Las contraseñas no coinciden <br></c:if> 
            <form action="/PracticaWeb/signIn" method = "post">
              <div class="form-group">
                <label for="userName">Nombre de usuario</label>
                <input type="text" name="userName" id="userName" class="form-control" maxlength = "20" placeholder="Introduzca un nombre de usuario" required = "required">
              </div>
              <div class="form-group">
                <label for="fullName">Nombre completo</label>
                <input type="text" name="fullName" id="fullName" class="form-control" maxlength = "50" placeholder="Su nombre y apellidos" required = "required">
              </div>
              <div class="form-group">
                <label for="address">Dirección</label>
                <input type="text" name="address" id="address" class="form-control" maxlength = "100" placeholder="Ej: Avenida de la albufera"  required = "required">
              </div>
              <div class="form-group">
                <label for="phone">Teléfono</label>
                <input type="tel" name="phone" id="phone" class="form-control" placeholder="Ej: 633453783" required = "required" maxlength = "9" pattern = "[0-9]{9}">
              </div>
              <div class="form-group mb-4">
                <label for="password">Contraseña</label>
                <input type="password" name="password" id="password" class="form-control"  placeholder="Introduzca su contraseña" minlength = "5" maxlength = "20" required = "required">
              </div>	
              <div class="form-group mb-4">
                <label for="password2">Confirme su contraseña</label>
                <input type="password" name="password2" id="password2" class="form-control"  placeholder="Repita su contraseña" minlength = "5" maxlength = "20" required = "required">
              </div>
              <input name="login" id="login" class="btn btn-block login-btn" type="submit" value="Registrarse">
            </form>
            <p class="login-wrapper-footer-text">¿Ya tienes una cuenta? <a href="/PracticaWeb/logIn.jsp" class="text-reset">Identificate aquí</a></p>
          </div>
        </div>
        <div class="col-sm-6 px-0 d-none d-sm-block">
          <img src="/PracticaWeb/images/stadio.jpg" alt="login image" class="login-img">
        </div>
      </div>
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>