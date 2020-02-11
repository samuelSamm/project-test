<%-- 
    Document   : page_header
    Created on : 9/08/2017, 11:40:05 AM
    Author     : me12dellinm
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="javax.xml.bind.DatatypeConverter"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<jsp:useBean id="operation" class="com.proyecto.web.util.Operations" scope="page"></jsp:useBean>

<!-- Import texts.properties-->
<% ResourceBundle resource = ResourceBundle.getBundle("texts"); %>

<html>
	<head>		
            <!-- Home -->
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
            <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
            <meta name="description" content="A free HTML5/CSS3 template made exclusively for Codrops" />
            <meta name="keywords" content="html5 template, css3, one page, animations, agency, portfolio, web design" />
            <meta name="author" content="" />
            <title><%=resource.getString("login.title")%></title>    
            <link type="image/x-icon" rel="icon" rel="shortcut icon" href="<c:url value='/static/ico/favicon.ico'/>"> 	
            
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
            <!-- Monthly -->
            <link rel="stylesheet" href="<c:url value='/static/css/monthly.css'/>" >
            <!-- Convenios -->   
            <style type="text/css">
            .bs-example{
                    margin: 20px;
            }
            /* Some custom styles to beautify this example */
            .hide-modal{
                width: 200px;
                    position: absolute;
                    margin: 0 auto;
                    right: 0;
                    left: 0;
                bottom: 20px;
                    z-index: 9999;
            }            
                .embossed {                       
                    -webkit-transition: 1s;
                    -moz-transition: 1s;
                    transition: 1s;

                    -webkit-border-radius: 20px;
                    -moz-border-radius: 20px;
                    border-radius: 20px;
                }
                .embossed:hover {
                    -webkit-box-shadow: 0 0 20px rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);
                    -moz-box-shadow: 0 0 20px rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);
                    box-shadow: 0 0 20px rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);

                    -webkit-border-radius: 60em;
                    -moz-border-radius: 60em;
                    border-radius: 60em;
                }       
                .table {
                    font-size: 13px !important;
                }
                .warning {
                    border-color: #f0ad4e;  
                    color: #f0ad4e;  
                }
                #cssTable th, td {
                    text-align:center; 
                    vertical-align:middle;
                }   
                .monthly {
                    box-shadow: 0 13px 40px rgba(0, 0, 0, 0.5);    
                    font-size: 0.8em;
                }	                
                div.ui-datepicker{
                    font-size:22px !important;
                }                
                .alignleft {
                    float: left;
                    margin-right: 15px;
                }
                .alignright {
                    float: right;
                    margin-left: 15px;
                }
                .aligncenter {
                    display: block;
                    margin: 0 auto 15px;
                }
                a:focus { outline: 0 solid }
                img {
                    max-width: 100%;
                    height: auto;
                }
                .fix { overflow: hidden }
                h1,
                h2,
                h3,
                h4,
                h5,
                h6 {
                    margin: 0 0 15px;
                    font-weight: 700;
                }
                html,
                body { width: 100%;
                       height: 100%;
                       margin:auto;
                }
                a {
                    -moz-transition: 0.3s;
                    -o-transition: 0.3s;
                    -webkit-transition: 0.3s;
                    transition: 0.3s;
                    color: #333;
                }
                a:hover { text-decoration: none }
                .search-box{margin:80px auto;position:absolute;}
                .caption{margin-bottom:50px;}
                .loginForm input[type=text], .loginForm input[type=password]{
                        margin-bottom:10px;
                }
                .loginForm input[type=submit]{
                        background:#fb044a;
                        color:#fff;
                        font-weight:700;
                }
                #pswd_info {
                        background: #dfdfdf none repeat scroll 0 0;
                        color: #fff;
                        left: 20px;
                        position: absolute;
                        top: 115px;
                }
                #pswd_info h4{
                    background: black none repeat scroll 0 0;
                    display: block;
                    font-size: 14px;
                    letter-spacing: 0;
                    padding: 17px 0;
                    text-align: center;
                    text-transform: uppercase;
                }
                #pswd_info ul {
                    list-style: outside none none;
                }
                #pswd_info ul li {
                   padding: 10px 45px;
                }
                .valid {
                        background: rgba(0, 0, 0, 0) url("https://s19.postimg.org/vq43s2wib/valid.png") no-repeat scroll 2px 6px;
                        color: green;
                        line-height: 21px;
                        padding-left: 22px;
                }
                .invalid {
                        background: rgba(0, 0, 0, 0) url("https://s19.postimg.org/olmaj1p8z/invalid.png") no-repeat scroll 2px 6px;
                        color: red;
                        line-height: 21px;
                        padding-left: 22px;
                }
                #pswd_info::before {
                    background: #dfdfdf none repeat scroll 0 0;
                    content: "";
                    height: 25px;
                    left: -13px;
                    margin-top: -12.5px;
                    position: absolute;
                    top: 50%;
                    transform: rotate(45deg);
                    width: 25px;
                }
                #pswd_info {
                    display:none;
                }         
                .collapsed .glyphicon.glyphicon-collapse-down {
                    display: none;
                }
                .glyphicon.glyphicon-collapse-down {
                    display: inline-block;
                }
                .collapsed .glyphicon.glyphicon-collapse-up {
                    display: inline-block;
                }
                .glyphicon.glyphicon-collapse-up {
                    display: none;
                }     
                
                       
              @media only screen and (max-device-width:540px) {
                .mobileLabel{
                text-align: left;
                }
                      .mobilePad{
                margin-left: 4em;
                }
             }
             @media only screen and (max-device-width:750px) and (orientation:landscape) {
                .mobileLabel{
                    text-align: left;
                }
                .mobilePad{
                    margin-left: 11%;
                }
              }
            .boxStyle{
                 margin-left: 20%;width: 60%;
            }            

            </style>               
            
                  

            <decorator:head />
	</head>
        
        <body>                 
             
        <!-- INICIO - Header-->
        <header>
                <section class="hero-login">
                        <div class="texture-overlay"></div>
                        <div class="container">
                                <div class="row nav-wrapper">
                                        <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                                                <a href="#"><img src="<c:url value='/static/img/logo.png'/>" alt="proyecto web" width="110" ></a>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 text-right navicon">
                                                <p>MENU</p><a id="trigger-overlay" class="nav_slide_button nav-toggle" href="#"><span></span></a>
                                        </div>
                                </div>

                        </div>
                </section>
        </header>     
        <!-- FIN - Header--> 
        
                                  
      
        <%--INICIO - Body --%>
        <div id="load" class="container-fluid" >
            <decorator:body />    
        </div>
        <%--FIN - Body --%>
        
        <%--INICIO - Menu --%>
        <div class="overlay overlay-boxify">
            
                    <nav>
                        <ul>
                            <li>
                                <h3>Menu</h3>
                            </li>
                        </ul>
                    </nav>
                
        </div>
        <%-- FIN -  Menu --%>                                      
        
         <%-- INICIO de footer --%>
        <footer>
                <div class="container">
                        <div class="row">
                                <div class="col-xs-12 col-md-12 col-lg-12">
                                        <h1 class="footer-logo">
                                        <img src="<c:url value='/static/img/logo.png'/>" width="110">
                                        </h1>
                                        <p>@2020 Derechos reservados - Samuel Perez Sandoval  <em>Version <%=resource.getString("version.app")%></em></a></p>
                                </div>
                        </div>
                </div>
        </footer>        
        </body>   
        
        <!-- Bootstrap -->	
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="static/bower_components/js/min/toucheffects-min.js"></script>
        <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script-->
        <script src="static/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="static/bower_components/js/flickity.pkgd.min.js"></script>
        <script src="static/bower_components/js/jquery.fancybox.pack.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="static/bower_components/js/retina.js"></script>
        <script src="static/bower_components/js/waypoints.min.js"></script>
        <script src="static/bower_components/js/bootstrap.min.js"></script>
        <script src="static/bower_components/js/min/scripts-min.js"></script>
        <script src="static/bower_components/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        
        <script src="static/bower_components/Graphs/demo/lib/canvasjs.min.js"></script>
        <script src="static/bower_components/Graphs/dist/jquery.Graphs.min.js"></script>
        
        <script>
            if (/*@cc_on!@*/false && document.documentMode === 10) {
                document.documentElement.className+=' ie10';
            }
            jQuery(document).ready(function ($) {
                    graphs.init();
            });
        </script>

</html>