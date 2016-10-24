<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="abono" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="a.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="a.legend" /></legend>
                    <s:form action="Abono">
                        <s:hidden name="a.id" />
                        <s:select name="a.reservaciones.id" listKey="id" listValue="%{clientes.nombre + ' ' + clientes.apellido}" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listReservaciones" key="a.reserva" required="true" />
                        <s:select name="a.clientes.id" listKey="id" listValue="nombre" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listClientes" key="a.cliente" required="true" />
                        <s:textfield name="a.abono" key="a.abono" type="number" cssClass="form-control required" required="true" />
                        <s:date name="a.fechaAbono" id="createdDateId" format="dd/MM/yyyy hh:mm a" />

                        <s:submit method="guardar" cssClass="btn-info disabled submit" ondblclick="" key="btn.guardar" />
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
                <th><s:text name="a.reserva" /></th>
                <th><s:text name="a.cliente" /></th>
                <th><s:text name="a.abono" /></th>
                <th><s:text name="a.fechaAbono" /></th>
                <th><s:text name="a.usuario" /></th>
                <th data-priority="1"><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listAbonos}">
                <fmt:formatDate value="${l.fechaAbono}" var="fechaAbono"
                                pattern="dd/MM/yyyy hh:mm a" />
                <tr obj="${l.id}, ${l.reservaciones.id}, ${l.clientes.id},
                    ${l.abono}, ${fechaAbono}, ${l.usuarios.id}">
                    <td><c:out value="${l.reservaciones.clientes.nombre}"/> <c:out value="${l.reservaciones.clientes.apellido}"/></td>
                    <td><c:out value="${l.clientes.nombre}"/></td>
                    <td><c:out value="${l.abono}"/></td>
                    <td><c:out value="${fechaAbono}"/></td>
                    <td><c:out value="${l.usuarios.usuario}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs anotherNew">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <button class="btn btn-default btn-xs" data-href="./Abono!eliminar?id=${l.id}"
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
    $('#abono').on('click', function () {
        $("#Abono_a_id").val(0);
        resetForm($('#Abono'));
        $("#Abono_a_id").focus();
    });
    function edit(t) {
        resetForm($('#Abono'));
        var l = $(t).attr("obj").split(",");
        $("#Abono_a_id").val($.trim(l[0]));
        $("#Abono_a_reservaciones_id").val($.trim(l[1])).trigger('change');
        $("#Abono_a_clientes_id").val($.trim(l[2])).trigger('change');
        $("#Abono_a_abono").val($.trim(l[3]));
        $("#Abono_a_fechaAbono").val($.trim(l[4]));
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
</script>
