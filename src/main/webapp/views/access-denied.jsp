<%-- 
    Document   : menu
    Created on : 8/05/2017, 01:24:41 PM
    Author     : me12dellinm
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="generic-container">
        <div class="authbar">
             <c:forEach items="${user}" var="user">                                        
                <span>Estimad@, <strong> </strong>, no te encuentras autorizad@ para acceder al contenido de esta pagina.</span> <span class="floatRight"><a href="<c:url value="/logout" />">Salir</a></span>
            </c:forEach>                     
        </div>
</div>
