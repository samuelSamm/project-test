<%-- 
    Document   : list-awards
    Created on : 07/12/2018, 01:24:41 PM
    Author     : me12dellinm
--%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Import texts.properties-->
<%@ page import = "java.util.ResourceBundle" %>
<% ResourceBundle resource = ResourceBundle.getBundle("texts");%>
<!-- Import styles css list-awards -->


<div id="main">                
    <ol class="breadcrumb">
        <li><a href="#"><%=resource.getString("menu.menu")%></a></li>                
        <li><a href="#"><%=resource.getString("menu.submenu")%></a></li>
        <li class="active">Lista de usuarios</li>
    </ol>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-lg-12">
            <h3 class="timeline-title text-center">Lista de usuarios</h3>	
            <section class="panel">
                <center>                                                                                
                    <div class="tab-content"> 
                        <br>
                        <div class="row"  style="margin: 10px 35px 0 35px">
                            <div class="col-xs-12 col-md-12 col-lg-12">
                                <div class="adv-table">
                                    <table class="display table table-bordered table-striped" id="table-view-news">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Edad</th>
                                                <th>Fecha alta</th>
                                                <th>Estatus</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${user}" var="item">
                                                <tr>
                                                    <td>${item.idUser}</td>
                                                    <td>${item.name}</td>
                                                    <td>${item.age}</td>
                                                    <td>${item.createdDate}</td>
                                                    <td>${item.estatus}</td>
                                                    <td>
                                                        <a class="btn btn-success" data-toggle="modal" data-target="#create-${item.idUser}"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>
                                                        <a class="btn btn-warning" data-toggle="modal" data-target="#update-${item.idUser}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                        <a class="btn btn-danger" data-toggle="modal" data-target="#delete-${item.idUser}"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                        <!-- INICIO - Modal Eliminar -->
                                                        <form:form action="delete-user" method="POST" class="form-horizontal">
                                                            <input type="hidden" name="idUser" value="${item.idUser}"/>
                                                            <div id="delete-${item.idUser}" class="modal fade bs-" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="modalEliminar" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="text-center modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <h4 class="modal-title">Eliminar usuario</h4>
                                                                        </div>
                                                                        <div class="text-center modal-body">
                                                                            <div class="row">
                                                                                <h4>¿Deseas elimar el usuario : </h4>
                                                                            </div>
                                                                            <div class="row">
                                                                                <h4>${item.idUser} - ${item.name} ?</h4> 
                                                                            </div>
                                                                        </div> 
                                                                        <div class=" text-center modal-footer">
                                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>                                                                                                                                                                                                                                                                                                                                                                                                          
                                                                            <input type="submit" class="btn btn-success" value="Confirmar">
                                                                        </div>
                                                                    </div>    
                                                                </div>
                                                            </div>
                                                        </form:form>
                                                        <!-- FINAL - Modal Eliminar -->
                                                        <!-- INICIO - Modal modificar -->
                                                        <form:form action="update-user" method="POST">
                                                            <input type="hidden" name="idUser" value="${item.idUser}"/>
                                                            <div id="update-${item.idUser}" class="modal fade bs-" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="modalEliminar" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="text-center modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <h4 class="modal-title">Modificar usuario</h4>
                                                                        </div>
                                                                        <div class="text-center modal-body">
                                                                            <div class="form-group">
                                                                                <input type="text" name="nom" required="true" placeholder="Nombre"  value="${item.name}">
                                                                            </div>
                                                                              <div class="form-group">
                                                                                
                                                                                <input type="number" name="age" required="true" placeholder="Edad"  value="${item.age}">
                                                                                
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input type="number" name="est" required="true" min="0" max="1" placeholder="Estatus"  value="${item.estatus}">
                                                                            </div>

                                                                        </div> 
                                                                        <div class=" text-center modal-footer">
                                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>                                                                                                                                                                                                                                                                                                                                                                                                          
                                                                            <input type="submit" class="btn btn-success" value="Confirmar">
                                                                        </div>
                                                                    </div>    
                                                                </div>
                                                            </div>
                                                        </form:form>
                                                        <!-- FINAL - Modal Eliminar -->
                                                        <!-- INICIO - Modal alta -->
                                                        <form:form action="create-user" method="POST">
                                                            <div id="create-${item.idUser}" class="modal fade bs-" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="modalEliminar" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="text-center modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <h4 class="modal-title">Nuevo usuario</h4>
                                                                        </div>
                                                                        <div class="text-center modal-body">
                                                                            <div class="form-group">
                                                                                <input type="text" name="nom" required="true" placeholder="Nombre">
                                                                            </div>
                                                                              <div class="form-group">
                                                                                
                                                                                <input type="number" name="age" required="true" placeholder="Edad">
                                                                                
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input type="number" name="est" required="true" min="0" max="1" placeholder="Estatus">
                                                                            </div>

                                                                        </div> 
                                                                        <div class=" text-center modal-footer">
                                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>                                                                                                                                                                                                                                                                                                                                                                                                          
                                                                            <input type="submit" class="btn btn-success" value="Confirmar">
                                                                        </div>
                                                                    </div>    
                                                                </div>
                                                            </div>
                                                        </form:form>
                                                        <!-- FINAL - Modal alta -->
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Edad</th>
                                                <th>Fecha alta</th>
                                                <th>Estatus</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>                                                                           
                    </div>                                                                                                                        
                </center>                            
            </section>
        </div>
    </div> 
</div>
