<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.practica1_81_07.model.Event" %>
<%@ page import="com.practica1_81_07.model.EventPK" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Modificación de eventos</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles/createEvent.css">

</head>
<body>
  <main>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6 login-section-wrapper">
          <a href = "/PracticaWeb"><img id = "logo-img" alt="logo" src="/PracticaWeb/images/logo.png"></a>
          <div class="login-wrapper my-auto">
            <h1 class="login-title">Modificar evento</h1>
            <form action="/PracticaWeb/modifyEvent?oldName=${requestScope.currentEvent.id.name}&oldCity=${requestScope.currentEvent.id.city}&oldDate=${requestScope.currentEvent.id.date}" method = "post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="name">Nombre del evento</label>
                <input type="text" name="name" id="name" class="form-control" maxlength = "50" value="${requestScope.currentEvent.id.name}" placeholder="Nombre del evento" required="required">
              </div>
              <div class="form-group mb-4">
                <label for="city">Ciudad</label>
                <input type="text" name="city" id="city" class="form-control" maxlength = "50" value="${requestScope.currentEvent.id.city}" placeholder="Introduzca la ciudad" required="required">
              </div>
              <div class="form-group mb-4">
                <label for="sala">Sala</label>
                <input type="text" name="room" id="room" class="form-control" maxlength = "50" value="${requestScope.currentEvent.room}" placeholder="Introduzca la sala del evento" required="required">
              </div>
              <div class="form-group mb-4">
                <label for="category">Categoría</label>
                  <select class="styleselect" name="category" id="category" >
                      <option value="Concierto">Concierto</option>
                      <option value="Futbol">Partido de futbol</option>
                      <option value="Baloncesto">Partido de baloncesto</option>
                      <option value="Teatro">Obra de teatro</option>
                      <option value="Meeting">Meeting</option>
                  </select>
              </div>
              <div class="form-group mb-4">
                <label for="date">Fecha</label>
                <% Event event = (Event)request.getAttribute("currentEvent");
                String date = event.getId().getDate();
                java.util.Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(date);
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
                String strDate = dateFormat.format(date1); 
                %>
                <input type="date" name="date" id="date" class="form-control" value="<%= strDate %>" placeholder="Introduzca la fecha" required="required">
              </div>
              <div class="form-group mb-4">
                <label for="imagen">Imagen</label>
              	<input class="btn btn-block" type="file" name="imagen" id="imagen" class="form-control" value="c:/practicas.png" required="required">
               </div>
              <div class="form-group mb-4">
                <label for="description">Descripción</label>
                <textarea id="description" name="description" rows="4" cols="50" maxlength = "1000" placeholder="Descripcion del evento...">${requestScope.currentEvent.description}</textarea>
              </div>
             
              <input name="createEvent" id="createEvent" class="btn btn-block login-btn" type="submit" value="Modificar evento">
            </form>
          </div>
        </div>
        <div class="col-sm-6 px-0 d-none d-sm-block">
          <img src="/PracticaWeb/images/login.jpg" alt="login image" class="login-img">
        </div>
      </div>
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>