<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login</title>
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
            <h1 class="login-title">Log in</h1>
            <c:if test = "${!empty requestScope.wrongCredentials}"> Credenciales introducidos incorrectos. Intentelo de nuevo<br></c:if> 
            <form action="/PracticaWeb/logIn" method = "post">
              <div class="form-group">
                <label for="userName">Nombre de usuario</label>
                <input type="text" name="userName" id="userName" class="form-control" placeholder="Introduzca su nombre de usuario" required="required">
              </div>
              <div class="form-group mb-4">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Introduzca su contraseña" required="required">
              </div>
              <input name="login" id="login" class="btn btn-block login-btn" type="submit" value="Iniciar sesion">
            </form>
            <p class="login-wrapper-footer-text">¿No tienes una cuenta? <a href="/PracticaWeb/signIn.jsp" class="text-reset">Registrate aquí</a></p>
          </div>
        </div>
        <div class="col-sm-6 px-0 d-none d-sm-block">
          <img src="/PracticaWeb/images/concierto.jpg" alt="login image" class="login-img">
        </div>
      </div>
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>