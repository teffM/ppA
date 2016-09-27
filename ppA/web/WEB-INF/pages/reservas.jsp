<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="nuevaReserva" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="r.legend" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="r.legend" /></legend>
                    <s:form action="Reserva">
                        <s:hidden name="r.id" />
                        <s:textfield name="r.nombre" key="r.nombres" cssClass="form-control required" />
                        <s:textfield name="r.correo" key="r.correo" cssClass="form-control" type="email" />
                        <s:textfield name="r.telefono" key="r.telefono" cssClass="form-control" type="number" />
                        <s:date name="r.fechaReservaciones" id="createdDateId" />
                        <s:textfield name="r.fechaReservaciones" key="r.fecha"
                                     value="%{createdDateId}" cssClass="form-control required" />
                        <s:textfield name="r.numPersonas" key="r.persona" type="number" cssClass="form-control required" />
                        <s:select name="r.sucursales.id" listKey="id" listValue="sucursal" headerKey="-1" cssClass="required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listSucursales" key="r.sucursal" />
                        <s:textarea name="r.comentarios" key="r.comentario" />

                        <s:submit method="guardar" cssClass="btn-info disabled" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<div id="container">
    <table id="dataTable" class="table table-striped table-bordered table-hover dt-responsive nowrap">
        <thead>
            <tr>
                <th><s:text name="r.nombres" /></th>
                <th><s:text name="r.correo" /></th>
                <th><s:text name="r.telefono" /></th>
                <th><s:text name="r.fecha" /></th>
                <th><s:text name="r.persona" /></th>
                <th><s:text name="r.sucursal" /></th>
                <th><s:text name="r.comentario" /></th>
                <th><s:text name="q.eliminar" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listReservas}">
                <fmt:formatDate value="${l.fechaReservaciones}" var="formatDate" 
                                pattern="MM/dd/yyyy hh:mm a" />
                <tr obj="${l.id}, ${l.nombre}, ${l.correo},
                    ${l.telefono}, ${formatDate}, ${l.numPersonas},
                    ${l.sucursales.id}, ${l.comentarios}">
                    <td><c:out value="${l.nombre}"/></td>
                    <td><c:out value="${l.correo}"/></td>
                    <td><c:out value="${l.telefono}"/></td>
                    <td><c:out value="${formatDate}"/></td>
                    <td><c:out value="${l.numPersonas}"/></td>
                    <td><c:out value="${l.sucursales.sucursal}"/></td>
                    <td><c:out value="${l.comentarios}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs" data-href="./Reserva!eliminar?id=${l.id}"
                                data-toggle="modal" data-target="#confirm-delete">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    $(function () {
        $("#Reserva_r_fechaReservaciones").datetimepicker();
    });
    $('#nuevaReserva').on('click', function () {
        $("#Reserva_r_id").val(0);
        resetForm($('#Reserva'));
        $("#Reserva_r_nombres").focus();
    });
    $("tr").dblclick(function () {
        resetForm($('#Reserva'));
        var l = $(this).attr("obj").split(",");
        $("#Reserva_r_id").val($.trim(l[0]));
        $("#Reserva_r_nombre").val($.trim(l[1]));
        $("#Reserva_r_correo").val($.trim(l[2]));
        $("#Reserva_r_telefono").val($.trim(l[3]));
        $("#Reserva_r_fechaReservaciones").val($.trim(l[4]));
        $("#Reserva_r_numPersonas").val($.trim(l[5]));
        $("#Reserva_r_sucursales_id").val($.trim(l[6]));
        $("#Reserva_r_comentarios").val($.trim(l[7]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>