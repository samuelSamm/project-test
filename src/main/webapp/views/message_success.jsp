<%-- 
    Document   : alan
    Created on : 28/09/2017, 09:08:16 PM
    Author     : MedelliM
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ResourceBundle"%>
<% ResourceBundle resource = ResourceBundle.getBundle("texts");%>


<html>
    <head>		   
        <title><%=resource.getString("login.title")%></title>  
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet">
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet">
        <link rel="shortcut icon" href="<c:url value='/static/ico/favicon.ico'/>" type="image/x-icon" rel="icon">   

        <style type="text/css">  
            hr.message-inner-separator {
                clear: both;
                margin-top: 10px;
                margin-bottom: 13px;
                border: 0;
                height: 1px;
                background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
                background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            }
        </style>  
    </head>
    <body>
        <div class="generic-container" style="margin-top: 15px">		
            <div class="alert alert-success">                        
                <span class="glyphicon glyphicon-ok-sign"></span> <strong>${title}</strong>
                <hr class="message-inner-separator">
                <p>${body}</p>
            </div>

            <span class="well floatRight">
                Ir a <a href="<c:url value='${href}'/>">Regresar </a>
            </span>
        </div>
    </body>
</html>
