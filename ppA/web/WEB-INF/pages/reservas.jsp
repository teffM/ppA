<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="nuevaReserva" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b> Nueva Reservación</b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend>Registro de nueva reservación</legend>
                    <s:form action="Reserva">
                        <s:hidden name="r.id" />
                        <s:textfield name="r.nombres" label="Nombres" cssClass="form-control" required="true" />
                        <s:textfield name="r.email" label="Email" cssClass="form-control" type="email" />
                        <s:textfield name="r.telefono" label="Telefono" cssClass="form-control" type="number" />
                        <s:date name="r.fechaReservaciones" id="createdDateId" />
                        <s:textfield name="r.fechaReservaciones" label="Fecha de la reservación"
                                     value="%{createdDateId}" cssClass="form-control" />
                        <s:textfield name="r.personas" label="Personas" type="number" cssClass="form-control" />
                        <s:select name="r.sucursales.id" listKey="id" listValue="sucursal" headerKey="-1" required=""
                                  headerValue="--- Seleccione una sucursal ---" list="listSucursales" label="Sucursal" />
                        <s:textarea name="r.comentarios" label="Comentarios" />

                        <s:submit method="guardar" cssClass="btn-info disabled" value="Guardar" />
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
                <th>Nombres</th>
                <th>Email</th>
                <th>Telefono</th>
                <th>Fecha Reservaciones</th>
                <th>Personas</th>
                <th>Sucursal</th>
                <th>Comentarios</th>
                <th>Eliminar?</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listReservas}">
                <fmt:formatDate value="${l.fechaReservaciones}" var="formatDate" 
                                pattern="MM/dd/yyyy hh:mm a" />
                <tr obj="${l.id}, ${l.nombres}, ${l.email},
                    ${l.telefono}, ${formatDate}, ${l.personas},
                    ${l.sucursales.id}, ${l.comentarios}">
                    <td><c:out value="${l.nombres}"/></td>
                    <td><c:out value="${l.email}"/></td>
                    <td><c:out value="${l.telefono}"/></td>
                    <td><c:out value="${formatDate}"/></td>
                    <td><c:out value="${l.personas}"/></td>
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
        $("form")[0].reset();
        $("#Reserva_r_nombres").focus();
    });
    $("tr").dblclick(function () {
        var l = $(this).attr("obj").split(",");
        $("#Reserva_r_id").val($.trim(l[0]));
        $("#Reserva_r_nombres").val($.trim(l[1]));
        $("#Reserva_r_email").val($.trim(l[2]));
        $("#Reserva_r_telefono").val($.trim(l[3]));
        $("#Reserva_r_fechaReservaciones").val($.trim(l[4]));
        $("#Reserva_r_personas").val($.trim(l[5]));
        $("#Reserva_r_sucursales_id").val($.trim(l[6]));
        $("#Reserva_r_comentarios").val($.trim(l[7]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>