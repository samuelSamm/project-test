<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Import texts.properties-->
<% ResourceBundle resource = ResourceBundle.getBundle("texts");%>

<html lang="es" class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=resource.getString("login.title")%></title>
        <link type="image/x-icon" rel="icon" rel="shortcut icon" href="<c:url value='/static/ico/favicon.ico'/>"> 	
        <meta name="description" content="A free HTML5/CSS3 template made exclusively for Codrops" />
        <meta name="keywords" content="html5 template, css3, one page, animations, agency, portfolio, web design" />
        <meta name="author" content="" />
        <!-- Bootstrap -->
        <script src="static/bower_components/js/modernizr.custom.js"></script>
        <link href="static/bower_components/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/bower_components/css/jquery.fancybox.css" rel="stylesheet">
        <link href="static/bower_components/css/flickity.css" rel="stylesheet" >
        <link href="static/bower_components/css/animate.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300,700' rel='stylesheet' type='text/css'>
        <link href="static/bower_components/css/styles.css" rel="stylesheet">
        <link href="static/bower_components/css/queries.css" rel="stylesheet">
        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <!-- open/close -->
        <header>
            <section class="hero">
                <div class="texture-overlay"></div>
                <div class="container">
                    <div class="row nav-wrapper">
                        <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                            <a href="#"><img src="<c:url value='/static/img/logo.png'/>" alt="Proyecto web" width="150px"></a>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6 text-right navicon">
                            <button id="btnLogin" type="button" class="btn btn-primary closeModal" style="background-color:#470a68; border-color:#470a68" data-toggle="modal" data-target="#exampleModalLong"><%=resource.getString("login.logout")%></button>

                        </div>
                    </div>
                    <div class="row hero-content">
                        <div class="col-md-12">
                            <h1 class="animated fadeInDown">En Exclusiva, Portal de prueba.</h1>
                            <a href="#showcase" class="use-btn animated fadeInUp">Proximamente</a> <a href="#about" class="learn-btn animated fadeInUp">Ver mas <i class="fa fa-arrow-down"></i></a>
                        </div>
                    </div>
                </div>
            </section>
        </header>

        <section class="video" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h1><a href="http://www.youtube.com/embed/9No-FiEInLA?autoplay=1&wmode=opaque&fs=1" class="youtube-media"><i class="fa fa-play-circle-o"></i> Observar el Video</a></h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="features-intro">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 nopadding features-intro-img">
                        <div class="features-bg">
                            <div class="texture-overlay"></div>
                            <div class="features-img wp1">
                                <img src="<c:url value='/static/img/logo.png'/>" alt="HTML5 Logo" width="730px">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 nopadding">
                        <div class="features-slider">
                            <ul class="slides" id="featuresSlider">
                                <li>
                                    <h1>Evalua</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                                    <p><a href="#features" class="arrow-btn">Find out why this freebie rocks! <i class="fa fa-long-arrow-right"></i></a></p>
                                </li>
                                <li>
                                    <h1>Toma el control</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                                    <p><a href="http://tympanus.net/codrops/?p=22554" class="arrow-btn">Find out why this freebie rocks! <i class="fa fa-long-arrow-right"></i></a></p>
                                </li>
                                <li>
                                    <h1>Mejora</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                                    <p><a href="http://tympanus.net/codrops/?p=22554" class="arrow-btn">Find out why this freebie rocks! <i class="fa fa-long-arrow-right"></i></a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="features-list" id="features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="col-md-3 feature-1 wp2">
                            <div class="feature-icon">
                                <i class="fa fa-desktop"></i>
                            </div>
                            <div class="feature-content">
                                <h1>title one</h1>
                                <p>Built using HTML5/CSS3 and jQuery, and built using one of the world's most powerful CSS frameworks available, Bootstrap.</p>
                                <a href="#" class="read-more-btn">Read More <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-3 feature-2 wp2 delay-05s">
                            <div class="feature-icon">
                                <i class="fa fa-flash"></i>
                            </div>
                            <div class="feature-content">
                                <h1>title two</h1>
                                <p>Perfect if you run your own start-up, product or service. Boxify can showcase your business converting your visits to income.</p>
                                <a href="#" class="read-more-btn">Read More <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-3 feature-3 wp2 delay-1s">
                            <div class="feature-icon">
                                <i class="fa fa-heart"></i>
                            </div>
                            <div class="feature-content">
                                <h1>title three</h1>
                                <p>As aways, download Boxify for free exclusively from Codrops. If you love Boxify and want to thank me, simply <a href="#">buy me a beer</a>. </p>
                                <a href="#" class="read-more-btn">Read More <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-3 feature-3 wp2 delay-1s">
                            <div class="feature-icon">
                                <i class="fa fa-heart"></i>
                            </div>
                            <div class="feature-content">
                                <h1>title four</h1>
                                <p>As aways, download Boxify for free exclusively from Codrops. If you love Boxify and want to thank me, simply <a href="#">buy me a beer</a>. </p>
                                <a href="#" class="read-more-btn">Read More <i class="fa fa-chevron-circle-right"></i></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <section class="showcase" id="showcase">
            <div class="showcase-wrap">
                <div class="texture-overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="device wp3">
                                <div class="device-content">
                                    <div class="showcase-slider">
                                        <ul class="slides" id="showcaseSlider">
                                            <li>
                                                <img src="static/bower_components/img/screen1.jpg" alt="Device Content Image">
                                            </li>
                                            <li>
                                                <img src="static/bower_components/img/screen2.jpg" alt="Device Content Image">
                                            </li>
                                            <li>
                                                <img src="static/bower_components/img/screen3.jpg" alt="Device Content Image">
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h1>PROXIMAMENTE...</h1>
                            <p>Cansado de llenarte de hojas para evaluar las areas, Espera nuestra APP, con la cual desde tu dispositivo movil podras dar de alta tus encuestas.</p>
                            <blockquote class="team-quote">
                                <div class="avatar"><img src="static/bower_components/img/avatar.png" alt="User Avatar"></div>
                                <p>"En un mundo donde actualmente, las personas se la viven conectadas es importante tener las mejores herramientas en las empresas, por lo que estamos innovando con una encuesta la cual desde tu dispositivo movil podras levantar tus calificaciones de SCADs, Seguridad, Kaizen y GMPs." - Edgar Torres</p>
                                <div class="logo-quote">
                                    <a href="#"><img src="static/bower_components/img/codrops-logo.png" alt="Codrops Logo"></a>
                                </div>
                            </blockquote>
                            <a href="#" class="download-btn">Download! <i class="fa fa-download"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="screenshots-intro">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Reconocimiento Al Esfuerzo</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
                        <p><a href="#screenshots" class="arrow-btn">See the screenshots! <i class="fa fa-long-arrow-right"></i></a></p>
                    </div>
                </div>
            </div>
        </section>
        <section class="screenshots" id="screenshots">
            <div class="container-fluid">
                <div class="row">
                    <ul class="grid">
                        <li>
                            <figure>
                                <img src="static/bower_components/img/01-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/01.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>Optimised For Design</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                        <li>
                            <figure>
                                <img src="static/bower_components/img/02-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/02.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>User Centric Design</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                        <li>
                            <figure>
                                <img src="static/bower_components/img/03-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/03.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>Responsive and Adaptive</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                        <li>
                            <figure>
                                <img src="static/bower_components/img/04-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/04.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>Absolutely Free</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul class="grid">
                        <li>
                            <figure>
                                <img src="static/bower_components/img/05-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/05.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>Multi-Purpose Design</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                        <li>
                            <figure>
                                <img src="static/bower_components/img/06-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/06.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>Exclusive to Codrops</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                        <li>
                            <figure>
                                <img src="static/bower_components/img/07-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/07.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>Made with Love</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                        <li>
                            <figure>
                                <img src="static/bower_components/img/08-screenshot.jpg" alt="Screenshot 01">
                                <figcaption>
                                    <div class="caption-content">
                                        <a href="static/bower_components/img/large/08.jpg" class="single_image">
                                            <i class="fa fa-search"></i><br>
                                            <p>In Sydney, Australia</p>
                                        </a>
                                    </div>
                                </figcaption>
                            </figure>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <section class="download" id="download">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center wp4">
                        <h1>¿Necesitas más?</h1>
                        <a href="#" class="download-btn">Descarga <i class="fa fa-download"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <h1 class="footer-logo">
                            <img src="<c:url value='/static/img/logo.png'/>" alt="Footer Logo Blue" width="110px">
                        </h1>
                        <p>@2020 Derechos reservados Samuel Perez Sandoval- Proyecto WEB  <em>Version <%=resource.getString("version.app")%></em></a></p>
                    </div>
                    <div class="col-md-7">
                        <ul class="footer-nav">
                            <li><a href="#about">About</a></li>
                            <li><a href="#features">Features</a></li>
                            <li><a href="#screenshots">Screenshots</a></li>
                            <li><a href="#download">Download</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>

        <%-- INICIO - Modal Login --%>
        <div class="modal fade" data-backdrop="static" data-keyboard="false" id="exampleModalLong" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">     
                    <div class="col-sm-12">                          
                        <div id="titleLogin">                  
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:#fff; font-size:40px;"><span aria-hidden="true">&times;</span></button>
                        </div> 
                        <div id="formLogin">

                            <div id="mainWrapper">
                                <div class="login-container">
                                    <div class="login-card">
                                        <div class="login-form">
                                            <c:url var="loginUrl" value="/login" />
                                            <form action="${loginUrl}" method="post" class="form-horizontal">                                      
                                                <h1> BIENVENIDO </h1>
                                                <c:if test="${param.error != null}">
                                                    <div class="alert alert-danger">
                                                        <p><%=resource.getString("login.msgError")%></p>
                                                    </div>
                                                </c:if>
                                                <c:if test="${param.logout != null}">
                                                    <div class="alert alert-success">
                                                        <p><%=resource.getString("login.msgLgOut")%></p>
                                                    </div>
                                                </c:if>
                                                <div class="input-group input-sm">
                                                    <label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
                                                    <input type="text" class="form-control" id="username" name="ssoId" placeholder="<%=resource.getString("login.user")%>" required autofocus>
                                                </div>
                                                <div class="input-group input-sm">
                                                    <label class="input-group-addon" for="userPass"><i class="fa fa-lock"></i></label> 
                                                    <input type="password" class="form-control" id="userPass" name="userPass" placeholder="<%=resource.getString("login.pass")%>" required>
                                                </div>
                                                <br>
                                                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />


                                                <div class="form-actions">
                                                    <input id="loginPost" type="submit" class="btn btn-block btn-primary btn-default" style="background-color: #470a68; border-color:#470a68" value="<%=resource.getString("login.button")%>">
                                                    <button type="button" class="btn btn-block btn-danger btn-default" data-dismiss="modal" aria-label="Close" style="color:#fff;"><span aria-hidden="true">Cancelar</span></button>
                                                </div>

                                                <br>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>                  
                        </div>					    
                    </div>
                </div>
            </div>
        </div>
        <%-- FIN - Modal Login --%>

        <%-- INICIO - Forgot Password--%>
        <div class="modal fade" data-backdrop="static" data-keyboard="false" id="forgot" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="col-sm-12">
                        <c:url var="loginForgot" value="/forgot-password" />
                        <form action="${loginForgot}" modelAttribute="user" method="POST" class="form-horizontal">                                                   
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white"><span aria-hidden="true">&times;</span></button>
                            <h1 class="modal-title" id="gridSystemModalLabel">Restablecer Contrasena</h1> 

                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="forgot"><i class="fa fa-user"></i></label>
                                <input type="text" class="form-control" id="employeeId" name="employeeId" placeholder="<%=resource.getString("login.user")%>" required autofocus>                                    
                                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            </div>
                            <br>
                            <br>
                            <div class="form-actions">
                                <input type="submit" class="btn btn-primary btn-block" style="background-color: #470a68; border-color:#470a68" value="Confirmar">
                                <button type="button" data-dismiss="modal" class="btn btn-danger btn-block">Cerrar</button>                                
                            </div>
                        </form>
                    </div>
                    <%-- form:form action="/intranetWeb/forgot-password" modelAttribute="user" method="POST" class="form-horizontal">                                                   
                    <div id="titleLogin" class="modal-header">                  
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:white"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="gridSystemModalLabel">Restablecer Contrasena</h4>                  
                    </div>

                                <div id="formLogin" class="modal-body">
                                    <h5 class="text-center login-title">Ingresa el usuario a restablecer contrasena</h5>
                                    <br>
                                    <div class="input-group input-sm">
                                        <label class="input-group-addon" for="forgot"><i class="fa fa-user"></i></label>
                                        <input type="text" class="form-control" id="employeeId" name="employeeId" placeholder="<%=resource.getString("login.user")%>" required autofocus>                                    
                                    </div>     
                                </div>

                                <div class="modal-footer">
                                    <button type="button" data-dismiss="modal" class="btn">Cerrar</button>                                
                                    <input type="submit" class="btn btn-primary" style="background-color: #470a68; border-color:#470a68" value="Confirmar">
                                </div>
                                </form:form --%>
                </div>
            </div>
        </div>
        <%-- FIN - Forgot Password--%> 

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="static/bower_components/js/min/toucheffects-min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="static/bower_components/js/flickity.pkgd.min.js"></script>
        <script src="static/bower_components/js/jquery.fancybox.pack.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="static/bower_components/js/retina.js"></script>
        <script src="static/bower_components/js/waypoints.min.js"></script>
        <script src="static/bower_components/js/bootstrap.min.js"></script>
        <script src="static/bower_components/js/min/scripts-min.js"></script>
        
        
    </body>
</html>

