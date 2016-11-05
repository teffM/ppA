<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<br/>
<a id="nuevaReserva" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="r.btnNuevo" /></b>
</a>
<br/><br/>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="r.legend" /></legend>
                    <s:form action="Reserva">
                        <s:hidden name="r.id" />
                        <s:select name="r.clientes.id" listKey="id" listValue="%{nombre + ' ' +  apellido}" headerKey=""
                                  cssClass="select2 required form-control input" headerValue="%{getText('lbl.seleccione')}"
                                  list="listClientes" key="r.cliente" required="true" />
                        <s:date name="r.fechaReservacion" id="createdDateId" format="dd/MM/yyyy hh:mm a" />
                        <s:textfield name="r.fechaReservacion" key="r.fechaReserva"
                                     value="%{createdDateId}" cssClass="form-control input dateTimeMinNow required" required="true" />
                        <s:textfield name="r.numPersonas" key="r.persona" type="number" cssClass="form-control input required" required="true" />
                        <s:select name="r.sucursales.id" listKey="id" listValue="sucursal" headerKey="" cssClass="form-control input select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listSucursales" key="r.sucursal" required="true" />
                        <s:select name="r.estados.id" listKey="id" listValue="estado" headerKey="" cssClass="form-control input select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listEstados" key="r.estado" required="true"/>
                        <s:textarea name="r.comentarios" cssClass="form-control input" key="r.comentario" />

                        <s:submit method="guardar" cssClass="btn submit" ondblclick="" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<div id="container">
    <table id="dataTable" class="table table-responsive table-hover table-bordered table-condensed  table-striped">
        <thead>
            <tr>
                <th><s:text name="r.cliente" /></th>
                <!--<th><s:text name="r.menu" /></th>-->
                <th><s:text name="r.fechaReserva" /></th>
                <th><s:text name="r.estado" /></th>
                <th><s:text name="r.fechaCreacion" /></th>
                <th><s:text name="r.persona" /></th>
                <th><s:text name="r.sucursal" /></th>
                <th><s:text name="r.comentario" /></th>
                <th>Usuario</th>
                <th data-priority="1"><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listReservas}">
                <fmt:formatDate value="${l.fechaReservacion}" var="fechaReserva"
                                pattern="dd/MM/yyyy hh:mm a" />
                <fmt:formatDate value="${l.fechaCreacion}" var="fechaCreacion"
                                pattern="dd/MM/yyyy hh:mm a" />
                <tr obj="${l.id}, ${l.clientes.id},
                    ${fechaReserva}, ${fechaCreacion}, ${l.numPersonas},
                    ${l.sucursales.id}, ${l.estados.id}, ${l.comentarios}">
                    <td><c:out value="${l.clientes.nombre}"/> <c:out value="${l.clientes.apellido}"/></td>
                    <td><c:out value="${fechaReserva}"/></td>
                    <td style="background-color: <c:out value="${l.estados.color}"/>;"><c:out value="${l.estados.estado}"/></td>
                    <td><c:out value="${fechaCreacion}"/></td>
                    <td><c:out value="${l.numPersonas}"/></td>
                    <td><c:out value="${l.sucursales.sucursal}"/></td>
                    <td><c:out value="${l.comentarios}"/></td>
                    <td><c:out value="${l.usuarios.usuario}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs anotherNew" title="Modificar">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <button class="btn btn-default btn-xs" data-href="./Reserva!eliminar?id=${l.id}"
                                data-toggle="modal" data-target="#confirm-delete" title="Eliminar">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    $('#nuevaReserva').on('click', function () {
        $("#Reserva_r_id").val(0);
        resetForm($('#Reserva'));
        $("#Reserva_r_nombres").focus();
    });
    function edit(t) {
        resetForm($('#Reserva'));
        var l = $(t).attr("obj").split(",");
        $("#Reserva_r_id").val($.trim(l[0]));
        $("#Reserva_r_clientes_id").val($.trim(l[1])).trigger("change");
        $("#Reserva_r_fechaReservacion").val($.trim(l[2]));
        $("#Reserva_r_fechaCreacion").val($.trim(l[3]));
        $("#Reserva_r_numPersonas").val($.trim(l[4]));
        $("#Reserva_r_sucursales_id").val($.trim(l[5])).trigger("change");
        $("#Reserva_r_estados_id").val($.trim(l[6])).trigger("change");
        $("#Reserva_r_comentarios").val($.trim(l[7]));
        $('#myModal').modal({
            show: 'false'
        });
    }
    $("#dataTable > tbody > tr").dblclick(function () {
        edit($(this));
    });
    $(".anotherNew").on('click', function () {
        edit($(this).parent().parent());
    });

    $("#Reserva_r_correo").attr("type", "email");
    $("#Reserva_r_telefono").attr("type", "phone");
    $("#Reserva_r_numPersonas").attr("type", "positiveNumber");
</script>
