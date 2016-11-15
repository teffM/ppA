<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="page-header">
    <h1 style="margin:0">Detalles reserva
        <div class="button-group  pull-right">
            <a href="Detalles!obtener?id=<c:out value="${id}"/>" class="btn btn-success" >
                <span class="glyphicon glyphicon-refresh"></span>
                <b>Refrescar</b>
            </a>
            <a href="Reserva" class="btn btn-warning" >
                <span class="glyphicon glyphicon-arrow-left"></span>
                <b>Regresar</b>
            </a>
        </div>
    </h1>
</div>
            
<div class="row">
   

    <div class="col-md-6">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><h3>Cliente <small>Datos generales</small></h3></div>
            <!-- List group -->
            <ul class="list-group">
                 
                <li class="list-group-item"><b><s:text name="c.dui" /></b> <c:out value="${r.clientes.dui}"/></li>
                <li class="list-group-item"><b><s:text name="c.nit" /></b> <c:out value="${r.clientes.nit}"/></li>
               
                <li class="list-group-item"><b><s:text name="c.nombre" /></b> <c:out value="${r.clientes.nombre}"/> </li>
                <li class="list-group-item"><b><s:text name="c.apellido" /></b> <c:out value="${r.clientes.apellido}"/></li>
                 <li class="list-group-item"><b><s:text name="c.telefono" /></b> <c:out value="${r.clientes.telefono}"/></li>
                <li class="list-group-item"><b><s:text name="c.correo" /></b> <c:out value="${r.clientes.correo}"/></li>
                <a  class="list-group-item" target="_blank" href="Detalles!cliente?id=<c:out value="${r.clientes.id}"/>"><center><b>Más infomación</b></center></a>
            </ul>
        </div>
    </div>
            
     <div class="col-md-6">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading panel-collapse"><h3>Reserva <small>Datos generales</small></h3></div>
            <!-- List group -->
            <ul class="list-group">
                <fmt:formatDate value="${r.fechaReservacion}" var="fechaReserva"
                                    pattern="dd/MM/yyyy hh:mm a" />
                    <fmt:formatDate value="${r.fechaCreacion}" var="fechaCreacion"
                                    pattern="dd/MM/yyyy hh:mm a" />
                <li class="list-group-item"><b><s:text name="r.estado" /></b> <c:out value="${r.estados.estado}"/></li>
                <li class="list-group-item"><b><s:text name="r.persona" /></b> <c:out value="${r.numPersonas}"/> </li>
                <li class="list-group-item"><b><s:text name="r.fechaReserva" /></b> <c:out value="${fechaReserva}"/> </li>
                <li class="list-group-item"><b><s:text name="r.fechaCreacion" /></b> <c:out value="${fechaCreacion}"/> </li>
                <li class="list-group-item"><b><s:text name="r.sucursal" /></b> <c:out value="${r.sucursales.sucursal}"/></li>
                <li class="list-group-item" title="Empleado que registro la reserva"><b>Empleado:</b> <c:out value="${r.usuarios.nombre}"/> <c:out value="${r.usuarios.apellido}"/> </li>

            </ul>
            <div class="panel-body">
                <b><s:text name="r.comentario" /></b> <c:out value="${r.comentarios}"/>
            </div>
        </div>
    </div>
</div>

<div>
    <div class="panel panel-default">
        <!-- Default panel contents -->


        <div class="panel-heading">
            
            
                <h3>Platillos <small>Agregados a la reserva</small>
                    <div class="button-group  pull-right">
                <a id="nuevoMenu" href="#" data-toggle="modal" class="btn btn-success" data-target="#myModalMenu">Agregar platillo</a>
                </div>
                </h3>

        </div>


           <table class="table table-striped table-bordered table-hover dt-responsive nowrap dataTable2">
            <thead>
                <tr>
                     <th>#</th>
                    
                     
                     <th>Platillo</th>
                     <th>Precio individual</th>
                     <th>Cantidad</th>
                    <th><s:text name="dm.menu" /></th>
                     <th>Comentarios</th>
                    <th data-priority="1"><s:text name="q.acciones" /></th>
                </tr>
            </thead>
            <tbody>
                <s:set var="counter" value="0"/>
                <c:forEach var="l" items="${r.detallesMenuses}">
                    <tr>
                        <s:set var="counter" value="%{#counter+1}"/> 
                        <td><s:property value="#counter"/></td>   
                        
                        <td><c:out value="${l.menus.menu}"/></td>
                       
                        <td><c:out value="${l.cantidad}"/></td>
                         <td data-priority-level="1">$<c:out value="${l.precio}"/></td>
                         <td><c:out value="${l.menus.categoriasMenus.categoriaMenu}"/></td>
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
            <tfoot>
                 <tr> 
                    <td colspan="2"></td>
                    <td colspan="1"><b>Total</b></td>
                    <td>$${totPlatillo}</td>
                      <td colspan="3"></td>
                </tr>
            </tfoot>
        </table>

    </div> 
</div> 



<div class="panel panel-default">
    <div class="panel-heading">
        <h3>Abonos <small>Hechos a esta reserva</small>
                    <div class="button-group  pull-right">
                <a id="nuevoAbono" href="#" class="btn btn-success right" data-toggle="modal" data-target="#myModalAbono">Agregar abono</a>
                    </div>
                </h3>
        
       
    </div>

    <table class="table table-striped table-bordered table-hover dt-responsive nowrap dataTable2">

        <thead>
            <tr>
                <th>#</th>
                <th>Cliente</th>
                <th>Fecha</th>
                <th>Monto</th>

                <th><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
           <s:set var="counter" value="0"/>
            <c:forEach var="l" items="${r.abonoses}">
                <tr>
                   
                      <s:set var="counter" value="%{#counter+1}"/> 
                        <td><s:property value="#counter"/></td>     
               
                   
                    <fmt:formatDate value="${l.fechaAbono}" var="fechaAbono"
                                    pattern="dd/MM/yyyy hh:mm a" />
                     <td><a target="_blank" href="Detalles!cliente?id=<c:out value="${l.clientes.id}"/>"><c:out value="${l.clientes.nombre}"/>  <c:out value="${l.clientes.apellido}"/></a></td>
                    
                    
                    <td><c:out value="${fechaAbono}"/></td>
                    <td>$<c:out value="${l.abono}"/></td>
                    <td>

                        <button class="btn btn-default btn-xs" data-href="./Detalles!eliminarAbono?id=${r.id}&idRegistro=${l.id}"
                                data-toggle="modal" data-target="#confirm-delete" title="Eliminar">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>

                    </td>
                </tr>
            </c:forEach>
                
             
        </tbody>
        <tfoot>
              <tr>
                 <td colspan="2"></td>
                 <td><b>Total</b></td>
                 <td colspan="1">$${totAbono}</td>
                 <td title="Monto no cancelado" style="color: red;">$${diferencia}</td>
                </tr> 
        </tfoot>
    </table>
</div>

<div class="modal fade" id="myModalAbono" data-backdrop="static" data-keyboard="false" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="a.legend" /><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></legend>
                    <s:form action="Detalles">
                        <s:hidden name="a.reservaciones.id" value="%{r.id}"/>
                        <s:select name="a.clientes.id" listKey="id" listValue="list" headerKey="" cssClass="select2 required"
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

<div class="modal fade" id="myModalMenu" data-backdrop="static" data-keyboard="false" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="dm.legend" /><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></legend>
                    <s:form id="menuForm" action="Detalles">
                        <div id="loading" class="modal modal-fullscreen" style="display: none; background-color: rgba(0,0,0,0.7);"><center><img style="margin-top: 20%;" alt="IMAGEN" src="./r/images/loading.gif"/></center></div>
                        <s:hidden name="dm.reservaciones.id" value="%{r.id}"/>
                        <s:select name="dm.menus.categoriasMenus.id" listKey="id" listValue="categoriaMenu" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listCategoriasMenus" key="dm.menu" required="true" />
                        
                        <s:select name="dm.menus.id" listKey="id" listValue="menu" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listMenus" key="dm.platillo" required="true" />
                        <s:textfield name="dm.cantidad" key="dm.cantidad" type="number" cssClass="form-control required" required="true" />

                        <s:textfield name="dm.precio" key="dm.precio" type="number" cssClass="form-control required" required="true" />
                        <s:textarea name="dm.comentarios" key="dm.comentarios" cssClass="form-control required" required="true" />

                        <s:submit method="guardarMenu" cssClass="btn-info disabled submit" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>                    

<script>          
        $("#menuForm_dm_menus_id").on('change', function () {
        $("#loading").css("display", "block");
        cargarPlato($("#menuForm_dm_menus_id").val());
               
    });
       $("#menuForm_dm_menus_categoriasMenus_id").on('change', function () {
           $("#loading").css("display", "block");
        filtrarMenu($("#menuForm_dm_menus_categoriasMenus_id").val());
    });
function cargarPlato(id) {
        $.ajax({
            type: "GET",
            url: "/ppA/Menu!datosMenu?id="+id,
            dataType: "JSON",
            success: function (data) {
              $("#menuForm_dm_precio").val(data.precio.toString());
              $("#menuForm_dm_cantidad").val(1);
              $("#menuForm_dm_comentarios").val(data.descripcion.toString());
             $("#loading").css("display", "none");
            },
            error: function (data) {
        alert("request.responseText");
    }
        });
    }
    function filtrarMenu(id) {
        $.ajax({
            type: "GET",
            url: "/ppA/Menu!filtrarMenus?id="+id,
            dataType: "JSON",
            success: function (data) {
                $("#menuForm_dm_menus_id").empty();
                $("#menuForm_dm_menus_id").append('<option value=0>--Seleccione una opción--</option>');
               $.each(data, function(id,value){
		$("#menuForm_dm_menus_id").append('<option value="'+id+'">'+value+'</option>');
               
	    });
            $("#menuForm_dm_precio").val("");
              $("#menuForm_dm_cantidad").val("");
              $("#menuForm_dm_comentarios").val("");
                          $("#loading").css("display", "none");
            },
            error: function (data) {
        alert("request.responseText");
    }
        });
    }
</script>                      
