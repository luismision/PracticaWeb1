<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Vender ticket</title>
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
          <a href = "/USER8107"><img id = "logo-img" alt="logo" src="/USER8107/images/logo.png"></a>
          <div class="login-wrapper my-auto">
            <h1 class="login-title">Vender ticket</h1>
            <c:if test = "${!empty requestScope.wrongCredentials}"> Credenciales introducidos incorrectos. Intentelo de nuevo<br></c:if> 
            <form action="/USER8107/createTicket?id=${requestScope.currentEvent.id}" method = "post">
              
              <div class="form-group">
                <label for="prize">Precio</label>
                <input type="number" step="0.01" min="0" max="999999999" name="prize" id="prize" class="form-control" placeholder="Ej: 40.5" required="required">
              </div>
              <div class="form-group mb-4">
                <label for="type">Tipo de entrada</label>
                  <select class="styleselect" name="type" id="type" required="required">
                    <option value="estandar">Entrada normal</option>
                    <option value="reducida">Entrada reducida</option>
                    <option value="vip">Entrada Vip</option>
                  </select>
              </div>
              <input name="venderTicket" id="venderTicket" class="btn btn-block login-btn" type="submit" value="Vender ticket">
            </form>
        
          </div>
        </div>
        <div class="col-sm-6 px-0 d-none d-sm-block">
          <img src="/USER8107/images/concert-tickets.jpg" alt="login image" class="login-img">
        </div>
      </div>
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>