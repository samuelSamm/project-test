<%-- 
    Document   : message-control
    Created on : 07-ene-2019, 9:23:46
    Author     : Jafra Manufacturing
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="row">
        <c:if test="${msg != null}">
            <div class="col-md-offset-4 col-lg-offset-4 col-xs-12 col-sm-4 col-lg-4 text-center">
                <p class="bg-info">${msg}</p>
            </div>
        </c:if>
            
        <div class="col-lg-12">  
            <ol class="breadcrumb">
                <li><a href="#">Menu</a></li>                
                <li><a href="#">Jafra</a></li>
                <li class="active">Directorio</li>
            </ol>
            <h3 class="timeline-title text-center">Recordatorios</h3>
        </div>
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6">
        
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Descripción</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Notificación para recordar pasar a recoger Reconocimientos.</td>
                  <td><a href="message-notify/NOTIFY04" class="btn btn-success" onclick="return confirm('¿Estas seguro de enviar Recordatorios? \n')"><i class="fa fa-envelope"></i></a></td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Notificación para recordar la carga de evaluaciones.</td>
                  <td><a href="message-notify/NOTIFY01" class="btn btn-success" onclick="return confirm('¿Estas seguro de enviar Recordatorios? \n')" ><i class="fa fa-envelope"></i> </a></td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>