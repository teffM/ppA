<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h2>Detalles reserva</h2>
<hr>

<div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading panel-collapse"><h3>Información</h3></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item"><b>Estado:</b> <c:out value="${r.estados.estado}"/></li>
            <li class="list-group-item"><b>Numero de personas:</b> <c:out value="${r.numPersonas}"/> </li>
            <li class="list-group-item"><b>Fecha programada:</b> <c:out value="${r.fechaReservacion}"/> </li>
            <li class="list-group-item"><b>Fecha creacion:</b> <c:out value="${r.fechaCreacion}"/> </li>
            <li class="list-group-item"><b>Sucursal:</b> <c:out value="${r.sucursales.sucursal}"/></li>
            <li class="list-group-item" title="Empleado que registro la reserva"><b>Empleado:</b> <c:out value="${r.usuarios.nombre}"/> <c:out value="${r.usuarios.apellido}"/> </li>
            
        </ul>
        <div class="panel-body">
            <b>Comentarios:</b> <c:out value="${r.comentarios}"/>
        </div>
    </div>
</div>

<div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><h3>Clientes</h3></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item"><b>DUI:</b> <c:out value="${r.clientes.dui}"/></li>
            <li class="list-group-item"><b>Nombre:</b> <c:out value="${r.clientes.nombre}"/> </li>
            <li class="list-group-item"><b>Apellido:</b> <c:out value="${r.clientes.apellido}"/></li>
            <li class="list-group-item"><b>Telefono:</b> <c:out value="${r.clientes.telefono}"/></li>
            <li class="list-group-item"><b>Correo:</b> <c:out value="${r.clientes.correo}"/></li>
            <li class="list-group-item"><a href="Cliente!obtener=<c:out value="${r.clientes.id}"/>">Más infomación</a></li>
        </ul>
    </div>
</div>

<div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        
        
        <div class="panel-heading">
           
        <div class="row">  
            <div class="col-md-10"><h3>Platillos</h3></div>
            <div class="col-md-2"><a href="#" data-toggle="modal" class="btn btn-success" data-target="#myModalMenu">Agregar platillo</a></div> 
            </div>
        
    </div>
            

        <table class="table table-responsive table-hover table-bordered table-condensed  table-striped">
            <thead>
                <tr>
                    <td>Menu</td>
                    <td>Platillo</td>
                    <td>Precio individual</td>
                    <td>Cantidad</td>
                    <td>Comentarios</td>
                    <td data-priority="1"><s:text name="q.acciones" /></td>
                </tr>
            </thead>
            <tbody>
                
                    <c:forEach var="l" items="${r.detallesMenuses}">
                         <tr>
                        <td></td>
                        <td><c:out value="${l.menus.menu}"/></td>
                        <td><c:out value="${l.precio}"/></td>
                        <td><c:out value="${l.cantidad}"/></td>
                        <td><c:out value="${l.comentarios}"/></td>
                        <td>

                            <button class="btn btn-default btn-xs" data-href="./Detalles!eliminarMenu?id=${r.id}&idRegistro=${l.id}"
                                    data-toggle="modal" data-target="#confirm-delete" title="Eliminar">
                                <span class="glyphicon glyphicon-trash"></span>
                            </button>

                        </td>
 </tr>
                    </c:forEach>
               
            </tbody>
        </table>

    </div> 
</div> 



<div class="panel panel-default">
    <div class="panel-heading">
        <div class="row">  
            <div class="col-md-10"><h3>Abono</h3></div>
            <div class="col-md-2"><a href="#" class="btn btn-success right" data-toggle="modal" data-target="#myModalAbono">Agregar abono</a>
            </div>
        </div>
    </div>

    <table class="table table-responsive table-hover table-bordered table-condensed  table-striped">

        <thead>
            <tr>
                <td>Cliente</td>
                <td>Fecha</td>
                <td>Monto</td>

                <th data-priority="1"><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
            
                <c:forEach var="l" items="${r.abonoses}">
<tr>
                    <td><a href="Cliente!obtener=<c:out value="${l.clientes.id}"/>"><c:out value="${l.clientes.nombre}"/>  <c:out value="${l.clientes.apellido}"/></a></td>

                    <td><c:out value="${l.fechaAbono}"/></td>
                    <td><c:out value="${l.abono}"/></td>
                    <td>

                        <button class="btn btn-default btn-xs" data-href="./Detalles!eliminarAbono?id=${r.id}&idRegistro=${l.id}"
                                data-toggle="modal" data-target="#confirm-delete" title="Eliminar">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>

                    </td>
 </tr>
                </c:forEach>
           
        </tbody>
    </table>
</div>

<div class="modal fade" id="myModalAbono" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="a.legend" /></legend>
                    <s:form action="Detalles">
                        <s:hidden name="a.reservaciones.id" value="%{r.id}"/>
                        <s:select name="a.clientes.id" listKey="id" listValue="nombre" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listClientes" key="a.cliente" required="true" />
                        <s:textfield name="a.abono" key="a.abono" type="number" cssClass="form-control required" required="true" />
                        <s:date name="a.fechaAbono" id="createdDateId" format="dd/MM/yyyy hh:mm a" />

                        <s:submit method="guardarAbono" cssClass="btn-info disabled submit" ondblclick="" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalMenu" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="dm.legend" /></legend>
                    <s:form action="Detalles">

                        <s:hidden name="dm.reservaciones.id" value="%{r.id}"/>
                        <s:select name="dm.menus.id" listKey="id" listValue="menu" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listMenus" key="dm.menu" required="true" />
                        <s:textfield name="dm.cantidad" key="dm.cantidad" type="number" cssClass="form-control required" required="true" />

                        <s:textfield name="dm.precio" key="dm.precio" type="number" cssClass="form-control required" required="true" />
                        <s:textfield name="dm.comentarios" key="dm.comentarios" cssClass="form-control required" required="true" />
 
                        <s:submit method="guardarMenu" cssClass="btn-info disabled submit" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>                    

