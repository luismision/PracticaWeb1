<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ridigram</title>
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
                <li id = "logo_container" ><a href ="index.html" target="_blank"><img  id = "logo"  src = "images/logo.png" alt="logo"></a><a href ="index.html"><img  id = "instagram" alt="insta" src = "images/instagram.jpg"></a><a href ="index.html"><img alt="twitter"id = "twitter"src = "images/twitter.png"></a><a href ="index.html"><img alt="facebook" id = "facebook" src = "images/facebook.png"></a></li>
                <li id = "menu">
                    <div title="África" id = "menu_africa" class= "hoverAfrica">ÁFRICA</div>
                    <div title="America" id = "menu_america" class = "hoverAmerica">AMERICA</div>
                    <div title="Asia" id = "menu_asia" class = "hoverAsia">ASIA</div>
                    <div title="Europa" id = "menu_europa" class = "hoverEuropa">EUROPA</div>
                    <div title="Oceanía" id = "menu_oceania" class = "hoverOceania">OCEANIA</div>
                    <div title="Tipos de turismo" id = "menu_turismos" class = "hoverTurismos">TIPOS DE TURISMO</div>
                    <div title="Planificar viajes" id = "menu_planificar">PLANIFICAR VIAJES</div>
                </li>
                <li id = "search_container" onpointerenter="">
                    <form id = "searcher">
                        <label><input id="searchterm" type="text" placeholder="Buscar..."/>ㅤ</label>
                        <button onclick = localStorageHolder();cookiebusq(); id="buttonsearch" type = "submit">
                            <a id = "href-busqueda" href="#"><img id = "lupa" alt="buscador"src = "images/lupa.png"></a>
                        </button>
                    </form>
                </li> 
                <li id = "sesion_container"> 
                    <button rid = "log_in_button" class = "stylebutton"><a href = "/PracticaWeb/loginPage">INICIAR SESIÓN</a></button>

                </li>     
            </ul>
            
        </nav>
        <div id = "top-experiences" class = "container">
            <h1>TOP EXPERIENCIAS</h1>
            <div class ="contenedor-principal">
                <button onclick = leftCarousel(event)  role = "button" id = "flecha-izquierda-experiencia" class = "flecha-izq"><i class="fas fa-angle-left">ㅤ</i></button>
                <div class="contenedor-carousel">
                    <div id = "corousel-topexp" class="carousel">
                    </div>
                </div>
                <button onclick = rightCarousel(event)  role = "button" id = "flecha-derecha-experiencia" class = "flecha-drch"><i class="fas fa-angle-right">ㅤ</i></button>
            </div>
            <div class="indicador">
            </div>
        </div>
        <div id = "top-perfiles"class="container">
            <h1>TOP PERFILES</h1>
            <div class ="contenedor-principal">
                <button  onclick = leftCarousel(event) role = "button" id = "flecha-izquierda-perfiles" class = "flecha-izq"><i class="fas fa-angle-left">ㅤ</i></button>
                <div class="contenedor-carousel">
                    <div id = "carousel-usuarios" class="carousel">
                    </div>
                </div>
                <button onclick = rightCarousel(event) role = "button" id = "flecha-derecha-perfiles" class = "flecha-drch"><i class="fas fa-angle-right"></i>ㅤ</button>
            </div>


        </div>
        <div id = "ultimas-experiencias" class = "container">
            <h1>ÚLTIMAS EXPERIENCIAS</h1>
            <div id =  "ultimas-container">
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

        <!--############################### Menu hover#################################-->
        <div id = "hover_africa" class = "menuhover shadow hoverAfrica">
            <div class = "top-menuhover"></div>
            <div class = "content-menuhover">
                <p onclick = cookieContinent(event);localStorageHolder();>África del Norte</p>
                <p onclick = cookieContinent(event);localStorageHolder();>África del Sur</p>
                <p onclick = cookieContinent(event);localStorageHolder();>África del Este</p>
                <p onclick = cookieContinent(event);localStorageHolder();>África del Oeste</p>
                <p onclick = cookieContinent(event);localStorageHolder();>África Central</p>
            </div>
        </div>

        <div id = "hover_america" class = "menuhover shadow hoverAmerica">
            <div class = "top-menuhover"></div>
            <div class = "content-menuhover">
                <p onclick = cookieContinent(event);localStorageHolder();>América del Norte</p>
                <p onclick = cookieContinent(event);localStorageHolder();>América del Sur</p>
                <p onclick = cookieContinent(event);localStorageHolder();>América Central</p>
            </div>
        </div>
        <div id = "hover_asia" class = "menuhover shadow hoverAsia">
            <div class = "top-menuhover"></div>
            <div class = "content-menuhover">
                <p onclick = cookieContinent(event);localStorageHolder();>Asia del Norte</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Asia del Sur</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Asia Central</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Sudeste Asiático</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Asia Occidental</p>
            </div>
        </div>
        <div id = "hover_europa" class = "menuhover shadow hoverEuropa">
            <div class = "top-menuhover"></div>
            <div class = "content-menuhover">
                <p onclick = cookieContinent(event);localStorageHolder();>Europa del Norte</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Europa del Sur</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Europa del Oeste</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Europa Central</p>
            </div>
        </div>
        <div id = "hover_oceania" class = "menuhover shadow hoverOceania">
            <div class = "top-menuhover"></div>
            <div class = "content-menuhover">
                <p onclick = cookieContinent(event);localStorageHolder();>Australasia</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Melanesia</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Micronesia</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Polinesia</p>
            </div>
        </div>
        <div id = "hover_turismos" class = "menuhover shadow hoverTurismos">
            <div class = "top-menuhover"></div>
            <div class = "content-menuhover">
                <p onclick = cookieContinent(event);localStorageHolder();>Turismo rural</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Turismo de negocios</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Turismo histórico</p>
                <p onclick = cookieContinent(event);localStorageHolder();>Turismo cultural</p>
            </div>
        </div>

        <!--############################### Pop-ups ###################################-->
        <div id = "Log-in-pop-up" class="log-sign-up pop-up ">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div  class="content-sign-log content-pop-up">
                <div class="image-log-sign">
                    <img alt="log-in" src="images/log-in2.png">
                </div>
                <div class="log-sign-izq">
                    <form class="log-sign-container" id="log-in-form">
                        <h2>Inicia sesión</h2>
                        <div class = "error-message" id = "user-not-found"><img alt="error1" src = "images/error.png"><div class = "text-error">El usuario introducido no existe</div></div>
                        <div class = "error-message" id = "wrong-password-log-in"><img alt="error2" alt="imagen1" src = "images/error.png"><div class = "text-error">La contraseña que ha introducido no es correcta. Intenetelo de nuevo</div></div>
                        <div class="form-element">
                            <label><h3>Nombre de usuario</h3><input  alt="nombre"type="text"></label>
                        </div>
                        <div class="form-element">                           
                            <label><h3>Contraseña</h3><input type="password"></label>
                        </div>
                        <h3>¿No tienes cuenta? <a id = "crear-cuenta-a" class = "iniciar-crear-a">Crear cuenta</a></h3>
                    </form>
                    <button id = "Log-in-pop-up-button" class="stylebutton log-sign-button">Iniciar sesión</button>
                </div>
            </div>
        </div>

        <div id="cerrar-sesion-popup" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="cerrar-sesion-popup-content content-pop-up">
                <p>¿Estas seguro de que quieres cerrar sesión?</p>
                <input type="button" href="#"  value="Si" class="stylebutton" id="Si">
                <input type="button" href="#"  value="No" class="stylebutton" id="No">
            </div>	
        </div> 

        <div id = "Compartir-pop-up" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id = "content-share" class = "content-pop-up">
                <h3>Compartir</h3>
                <div>
                    <img  alt="twitter2" src="images/twitter.png" >
                    <img alt="facebook2" src="images/facebook.png">
                    <img alt="instagram2" src="images/instagram-6338401_1280.png">
                    <img alt="whatsapp2" src = "images/whatsapp.png">
                </div>
  
            </div>
        </div>
        <div id = "Planificar-viaje-pop-up" class="log-sign-up pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div   class = "content-sign-log content-pop-up">
                <div class="image-log-sign">
                    <img alt="log-sing" src="images/Sin_titulo.png" >
                </div>
                <form class="log-sign-container" id="planificar-form">
                    <h2>Planifica tu Viaje</h2>
                    <div class="form-element">
                        <label ><h3>Presupuesto mínimo</h3>
                            <input type="range" min="0" max="5000" value="2500" class="slider" id="myRange">
                            <p class="precio-plan">Precio: <span id="demo"></span>€</p>
                        </label>
                    </div>
                    <div class="form-element">
                        <label ><h3>Presupuesto máximo</h3>
                            <input type="range" min="1" max="5000" value="2500" class="slider" id="myRange2">
                            <p class="precio-plan">Precio: <span id="demo2"></span>€</p>
                        </label>
                    </div>
                    <div class="form-element">
                        <h3>Tipo de experiencia</h3>
                        <select class="styleselect">
                            <option>Turismo Rural</option>
                            <option>Turismo De Negocios</option>
                            <option>Turismo Histórico</option>
                            <option>Turismo Cultural</option>
                        </select>
                    </div>
                    <div class="form-element">
                        <label ><h3>Palabras clave</h3><input type="text"></label>
                    </div>
                    <input type="submit" href="#" value="Planifica!" class="stylebutton" id="planificar-boton">
                </form>
            </div>
        </div>

        <div class = "menuoptions shadow"> 
            <div>
                <a href = "perfil.html"><button onclick = localStorageHolder() class="stylebutton">Mi perfil</button></a>
            </div>
            <div>
              <button class="stylebutton">Publicar experiencia</button>
            </div>
            <div>
                <button class="stylebutton" onclick="abrirColecciones()">Colecciones</button>
            </div>
            <div>
                <button class="stylebutton">Planificar viaje</button>
            </div>
            <div>
                <button class="stylebutton" id="cerrar-sesion">Cerrar sesión</button>
            </div>
          </div>
       
        <div id="crear-experiencia-popup" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="crear-experiencia-popup-content content-pop-up">
                <div class="crear-experiencia-grid">
                    <div class="crear-experiencia-imagen">
                        <h2>Añade una cabecera*</h2>
                        <button id="crear-cabecera-button" class="cambiar-cabecera" onclick="cambiarCabecera()"><a>+</a></button>
                    </div>
                    <div class="crear-experiencia-datos">
                        <div><h1>Crear experiencia</h1></div>
                        <form class="crear-experiencia-datos-campos">
                            <div class="form-element">
                                <label ><h3>Título de la experiencia*</h3><input type="text" required></label>
                            </div>
                            <div class="form-element">
                                <label ><h3>Descripción*</h3><textarea class="textarea" name="textarea" rows="4" cols="50" required></textarea></label>
                            </div>
                            <div class="form-element">
                                <h3>Tipo de experiencia</h3>
                                <select class="styleselect">
                                    <option>Turismo Rural</option>
                                    <option>Turismo De Negocios</option>
                                    <option>Turismo Histórico</option>
                                    <option>Turismo Cultural</option>
                                </select>
                            </div>
                            <div class="form-element">
                                <h3>Ubicación</h3>
                                <select class="styleselect" id="crear-continente">
                                    <option disabled selected>Seleccione un continente</option>
                                    <option>África</option>
                                    <option>América</option>
                                    <option>Asia</option>
                                    <option>Europa</option>
                                    <option>Oceanía</option>
                                </select>
                                <select class="styleselect" id="crear-region">
                                    <option disabled selected>Seleccione la región</option>
                                </select>
                            </div>
                            <div class="form-element">
                                <label ><h3>Añadir colaborador</h3><input type="text"></label>
                            </div>
                            <div id="flip">
                                <h2>Datos avanzados</h2>
                                <i class="fas fa-angle-right"></i>
                            </div>
                            <div id="datos-avanzados">
                                <div class="form-element">
                                    <label ><h3>Presupuesto</h3>
                                        <input type="range" min="0" max="5000" value="2500" class="slider" id="myRange3">
                                        <p class="precio-plan">Precio: <span id="demo3"></span>€</p>
                                    </label>
                                </div>
                                <div class="form-element">
                                    <label><h3>Transporte</h3><input type="text" maxlength="10"></label>
                                </div>
                                <div class="form-element">
                                    <label><h3>Alojamiento</h3><input type="text" maxlength="10"></label>
                                </div>
                                <div class="form-element">
                                    <label><h3>Links</h3><input type="url"></label>
                                </div>
                            </div>
                            <input type="submit" href="#" value="Siguiente" class="stylebutton">
                            <h3>Paso 1 de 2</h3>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        
        <div id="crear-experiencia-popup-2" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id="crear-experiencia-popup-content-2" class="content-pop-up">
                <div id="crear-experiencias-popup-2-header">
                    <p class="fas fa-angle-double-left" id="volver-crear-experiencia"></p>
                    <h1>Añadir Multimedia</h1>
                </div>
                <div id="crear-experiencia-multimedia-table">
                    <div class="multimedia-frame">
                        <h2>Añade un vídeo o imagen</h2>
                        <button id="multimedia-add"><a>+</a></button>
                    </div>
                </div>
                <div id="crear-experiencia-multimedia-next">
                    <input type="submit" href="#" value="Crear Experiencia" class="stylebutton" id="crear-experiencia-multimedia-button">
                    <h3>Paso 2 de 2</h3>
                </div>
            </div>
        </div>

        <div id="insertar-enlace-popup" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="añadir-colaborador-content content-pop-up">
                <form id="enlace-form">
                    <div class="form-element">
                        <label><h2>Inserta un enlace:</h2><input type="text" required></label>
                    </div>
                    <input type="submit" href="#" value="Aceptar" class="stylebutton" id="insertar-accept">
                </form>
            </div>
        </div>

        <div id = "Sign-up-pop-up" class="log-sign-up pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class = "content-sign-log content-pop-up">
                <div class="image-log-sign">
                    <img  alt="log-in2" src="images/log-in2.png">
                </div>
                <div class="log-sign-izq">
                    <form class="log-sign-container sing-up-padding" id="sign-up-form">
                        <h2>Crear cuenta</h2>
                        <div class = "error-message" id = "empty_inputs"><img alt="error3" src = "images/error.png"><div class = "text-error">Faltan campos obligatorios por rellenar</div></div>
                        <div class = "error-message" id = "user-already-owned"><img  alt="error4" src = "images/error.png"><div class = "text-error">El usuario ya existe</div></div>
                        <div class = "error-message" id = "wrong-password-sign-up"><img  alt="error5" src = "images/error.png"><div class = "text-error">Formato de contraseña incorrecta. La contraseña ha de tener máximo 8 caracteres y solo son permitidos [a,z] y digitos [0,9].</div></div>
                        <div class = "error-message" id = "not-same-password"><img  alt="error6" src = "images/error.png"><div class = "text-error">Las contraseñas no coinciden.</div></div>
                        <div class = "error-message" id = "wrong-email"><img  alt="error7" src = "images/error.png"><div class = "text-error">El correo electronico no sigue el formato "nombre@dominio.extension".</div></div>
                        <div class = "error-message" id = "email-already-in-use"><img  alt="error8" src = "images/error.png"><div class = "text-error">El email introducido ya tiene asociado una cuenta.</div></div>
                        <div class="form-element">
                            <label><h3>Nombre de usuario*</h3><input type="text"></label>
                        </div>
                        <div class="form-element">
                            <label><h3>Correo electrónico*</h3><input type="email" placeholder="Email"></label>
                        </div>
                        <div class="form-element">
                            <label><h3>Contraseña*</h3><input type="password" ></label>
                        </div>
                        <div class="form-element">
                            <label><h3>Confirmar contraseña*</h3><input type="password" ></label>
                        </div>
                        <div class="form-element">
                            <label><h3>Foto de perfil</h3><input type="url" alt="foto perfil" placeholder="Url: https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200009/91087331-icono-de-perfil-de-avatar-predeterminado-para-hombre-marcador-de-posici%C3%B3n-de-foto-gris-vector-de-ilu.jpg?ver=6"></label>
                        </div>
                        <h3>¿Ya tienes cuenta? <a id = "iniciar-sesion-a" class = "iniciar-crear-a">Inicia sesión</a></h3>
                        <!--<input type="submit" value="Crear Cuenta" class="stylebutton" id="Guardar">-->
                    </form>
                    <button id = "Crear-cuenta-pop-up-button" class="stylebutton log-sign-button">Crear Cuenta</button>
                </div>
            </div>
        </div>

        <div id = "experiencias-pop-up" class="experiencia-pop-up pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id = "content-experiencias" class="content-pop-up">
                <div id ="content-left" class="content-left">
                    <!--<div class="content-top-left">
                        <div class="perfil-experiencias">
                            <div class="perfil-logo">
                                <img src="images/stock.jpg" alt="">
                            </div>
                            <div class="user-name-exp"><h2>Nombre de usuario</h2><h3>Ubicacion</h3><h3 class="tipo-turismo">Tipo de turismo</h3></div>
                        </div>
                        <div class="mas-opciones-container">
                            <div class = "mas-opciones"><i class="fas fa-ellipsis-h"></i></div>
                        </div>
                    </div>
                    <div class="container-img">
                        <img src="images/sydney 2.jpg" alt="" class="background-container">
                        <div class = "img-in-container"><img src="images/sydney 2.jpg"></div>
                    </div>
                    <div class="mg-container">
                        <div class="img-mg">
                            <img src="images/corazon-mg2.png" alt="corazon rojo" id="corazon-rojo">
                            <img src="images/corazon-mg.png" alt="corazon blanco" id="corazon-blanco">
                        </div>
                        <div class="cantidad-mg">
                            <h2>10.000.000.000 Me gusta</h2>
                        </div>
                        <div class="compartir-boton img-mg">
                            <img src="images/compartir.png" alt="">
                        </div>-->

                    </div>
                
                 <div class="content-right">
                    <div class="gallery-exp">
                        <div class ="contenedor-principal">
                            <button onclick = leftCarousel(event) role = "button" id = "flecha-izquierda-experiencia-pop-up" class = "flecha-izq"><i class="fas fa-angle-left">ㅤ</i></button>
                            <div class="contenedor-carousel">
                                <div id = "carousel-exp-pop-up" class="carousel">
                                    <!--<div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/Man-Stock-Photos.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/descarga.png">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/exp-1.png ">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/exp-1.png">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/sydney 2.jpg">
                                    </div>
                                -->
                                </div>
                            </div>
                            <button onclick = rightCarousel(event) role = "button" id = "flecha-derecha-experiencia-pop-up" class = "flecha-drch"><i class="fas fa-angle-right">ㅤ</i></button>
                        </div>
                    </div>
                    <div id = "description-exp-pop-up" class = "description-exp-pop-up">
                       <!--<h2>Titulo experiencia</h2>
                        <div class="p-description-exp-pop-up">
                            <p> Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                                Facilis soluta dolor, non labore, illo aspernatur accusamus voluptate 
                                neque excepturi odit enim iste similique quisquam assumenda provident 
                                fugit tempora itaque asperiores! Lorem, ipsum dolor sit amet consectet
                                ur adipisicing elit. Ab pariatur soluta veritatis consectetur. Optio, do
                                lorem. Consequatur culpa quod architecto illo fuga reiciendis officiis qui
                                s recusandae. Dolore aliquid magnam corporis adipisci. Lorem ipsum, dolor 
                                sit amet consectetur adipisicing elit. Exercitationem voluptates quo ea rep
                                ellat. Iusto delectus, dignissimos, nostrum omnis blanditiis soluta ea itaq
                                ue qui nesciunt, accusantium harum non quibusdam explicabo nulla! Lorem i
                                psum, dolor sit amet consectetur adipisicing elit. Corrupti quaerat ea exp
                                edita labore ratione repellendus veniam, dicta neque deserunt soluta exerc
                                itationem reprehenderit molestiae reiciendis et dolore, deleniti beatae r
                                erum iure. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                Animi quia dolor aspernatur cosdafsdfnsectetur? 
                                Eos animi, saepe reprehenderit provident ipsam cupiditate quisquam 
                                asperiores atque ea minima totam necessitatibus odit illum vitae?Lorem ips
                                um dolor sit amet consectetur adipisicing elit. 
                                Animi quia dolor aspernatur consectetur? 
                                Eos animi, saepe reprehenderit provident ipsam cupiditate quisquam 
                                asperiores atque ea minima totam necessitatibus odit illum vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                Animi quia dolor aspernatur consectetur? 
                                Eos animi, saepe reprehenderit provident ipsam cupiditate quisquam 
                                asperiores atque ea minima totam necessitatibus odit illum vitae?</p>--> 
                        </div>
                    </div>
                 </div>
            </div>
        </div>



        <div class="overlay"></div>
        <div id = "Colecciones-pop-up" class= "pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class = "content-colecciones content-pop-up">
                <h3>Colecciones</h3>
                <div  class="contenido-colecciones">
                </div>
                <div id="boton-añadir-coll">
                    <button  type="button"><img alt="boton" src="images/descarga.png" width="10" height="10" ></button>
                </div>
            </div>
        </div>

        <div id = "Colecciones-pop-up-añadir" class= "pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class = "content-colecciones content-pop-up">
                <h3>Elige una colección:</h3>
                <div  class="contenido-colecciones">
                </div>
            </div>
        </div>


        <div class="coleccion-inside-popup pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id =  "coleccion-inside-container" class = "content-pop-up">
            </div>
        </div>

        <div id="crear-coleccion-popup" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="crear-experiencia-popup-content content-pop-up">
                <div class="crear-experiencia-grid">
                    <div class="crear-experiencia-imagen" id="crear-coleccion-imagen">
                        <h2>Añade una cabecera*</h2>
                        <button id="crear-cabecera-button" class="cambiar-cabecera" onclick="cambiarCabecera()"><a>+</a></button>
                    </div>
                    <div class="crear-experiencia-datos">
                        <div><h1>Crear colección</h1></div>
                        <form class="crear-coleccion-datos-campos">
                            <div class="form-element">
                                <label><h3>Título de la colección*</h3><input type="text" required></label>
                            </div>
                            <div class="form-element">
                                <label ><h3>Descripción*</h3><textarea class="textarea" name="textarea" rows="4" cols="50"></textarea></label>
                            </div>
                            <input type="submit" href="#" value="Crear colección" class="stylebutton">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="crear-coleccion-popup-2" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id="crear-experiencia-popup-content-2" class="content-pop-up">
                <div id="crear-experiencias-popup-2-header">
                    <p class="fas fa-angle-double-left" id="volver-crear-coleccion"></p>
                    <h1>Añadir Experiencias</h1>
                </div>
                <div id="crear-coleccion-multimedia-table">
                    <div class="multimedia-frame">
                        <h2>Añade una experiencia</h2>
                        <button id="coleccion-add"><a>+</a></button>
                    </div>
                </div>
                <div id="crear-experiencia-multimedia-next">
                    <input type="submit" href="index.html" value="Crear Coleccion" class="stylebutton" id="crear-coleccion-multimedia-button">
                    <h3>Paso 2 de 2</h3>
                </div>
            </div>
        </div>

        <div id="buscador-experiencia" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="añadir-colaborador-content content-pop-up">
                <h2>Busca una experiencia:</h2>
                <form id="experiencia-form">
                    <div class="form-element">
                        <label><input type="text" id="formulario" required>ㅤ</label>
                        <div id="resultados">
                            <ul id="lista-resultados">
                            </ul>
                        </div>
                    </div>
                    <input type="submit" href="#" value="Aceptar" class="stylebutton" id="insertar-accept">
                </form>
            </div>
        </div>

        <div id="opciones-exp-popup-otro" class="pop-up ">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id = "opciones-exp-otro" class="opciones-exp-content content-pop-up">
                <!--<div>
                    <p>Ver datos detallados</p>
                    <p>Denunciar publicación</p>
                    <p class = "abajo">Guardar experiencia en colección</p>
                </div>-->
            </div>
        </div>

        <div id="opciones-exp-popup-propio" class="pop-up ">
           <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id = "opciones-exp-propio" class="opciones-exp-content content-pop-up">
                <!--<div>
                    <p>Ver datos detallados</p>
                    <p>Eliminar publicación</p>
                    <p>Añadir colaborador</p>
                    <p class = "abajo">Guardar experiencia en colección</p>
                </div>-->
            </div>
        </div>

        <div id="datos-detallados-popup" class="pop-up">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div id = "datos-detallados-content" class="datos-detallados-content content-pop-up">
                <!--<div>
                    <h2>Ver datos detallados:</h2>
                    <div class="dato-detalle">
                        <p>Documentación:</p>
                        <p>Pasaporte, DNI</p>
                    </div>
                    <div class="dato-detalle">
                        <p>Presupuesto:</p>
                        <p>2000€</p>
                    </div>
                    <div class="dato-detalle">
                        <p>Transporte:</p>
                        <p>Avión, Tren</p>
                    </div>
                    <div class="dato-detalle">
                        <p>Alojamiento:</p>
                        <p>Piso amueblado</p>
                    </div>
                    <div class="dato-detalle links-detalles">
                        <p>Links útiles:</p>
                        <p><a href="https://terminosycondiciones.es/">www.tokio.es</a></p>
                        <p><a href="https://terminosycondiciones.es/">www.tokio.es</a></p>
                        <p><a href="https://terminosycondiciones.es/">www.tokioaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.es</a></p>
                    </div>
                </div>-->
            </div>
        </div>


        <div id="añadir-colaborador-popup" class="pop-up ">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="añadir-colaborador-content content-pop-up">
                <form >
                    <div class="form-element">
                        <label><h2>Añadir colaborador</h2><input type="text" placeholder="Usuario del colaborador"required></label>
                    </div>
                    <input type="submit" href="#" value="Añadir" class="stylebutton">
                </form>
            </div>
        </div>

        <div id="denunciar-popup" class="pop-up ">
            <div class="top-pop-up"><div class = "close-button"><i class="fas fa-times-circle"></i></div></div>
            <div class="cerrar-sesion-popup-content content-pop-up">
                <p>¿Estas seguro de que quieres denunciar esta publicación?</p>
                <input onclick = closeDenunciar() type="button" href="#"  value="Si" class="stylebutton">
                <input onclick = closeDenunciar() type="button" href="#"  value="No" class="stylebutton">
            </div>	
        </div> 

        <div id="confirmar-publicacion-popup" class="pop-up">
            <div class="top-pop-up"></div>
            <div class="cerrar-sesion-popup-content content-pop-up">
                <p>¡Tu experiencia ha sido publicada con éxito!</p>
                <input type="button" href="#"  value="Deshacer" class="stylebutton deshacer">
                <a href="index.html"><input alt="confirmar" type="button" href="#"  value="Hecho" class="stylebutton hecho">ㅤ</a>
            </div>	
        </div>

             
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
    <script src = "scripts/pop-ups.js"></script>
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