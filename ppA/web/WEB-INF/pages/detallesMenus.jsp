<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="nuevaDetalleMenu" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="dm.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="dm.legend" /></legend>
                    <s:form action="DetalleMenu">
                        <s:hidden name="dm.id" />
                        <s:select name="dm.reservaciones.id" listKey="id" listValue="clientes.nombre" headerKey="" cssClass="required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listReservaciones" key="dm.reserva" required="true" />
                        <s:select name="dm.menus.id" listKey="id" listValue="menu" headerKey="" cssClass="required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listMenus" key="dm.menu" required="true" />
                        <s:textfield name="dm.cantidad" key="dm.cantidad" type="number" cssClass="form-control required" required="true" />
                        
                        <s:textfield name="dm.precio" key="dm.precio" type="number" cssClass="form-control required" required="true" />
                        <s:textfield name="dm.comentarios" key="dm.comentarios" cssClass="form-control required" required="true" />

                        <s:submit method="guardar" cssClass="btn-info disabled submit" key="btn.guardar" />
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
                <th><s:text name="dm.reserva" /></th>
                <th><s:text name="dm.menu" /></th>
                <th><s:text name="dm.cantidad" /></th>
                <th><s:text name="dm.precio" /></th>
                <th><s:text name="dm.comentarios" /></th>
                <th><s:text name="q.eliminar" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listDetallesMenus}">
                <tr obj="${l.id}, ${l.reservaciones.id}, ${l.menus.id}, ${l.cantidad}, ${l.precio}, ${l.comentarios}">
                    <td><c:out value="${l.reservaciones.clientes.nombre}"/></td>
                    <td><c:out value="${l.menus.menu}"/></td>
                    <td><c:out value="${l.cantidad}"/></td>
                    <td><c:out value="${l.precio}"/></td>
                    <td><c:out value="${l.comentarios}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs" data-href="./DetalleMenu!eliminar?id=${l.id}"
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
    $('#nuevaDetalleMenu').on('click', function () {
        $("#DetalleMenu_dm_id").val(0);
        resetForm($('#DetalleMenu'));
        $("#DetalleMenu_dm_menu").focus();
    });
    $("#dataTable > tbody > tr").dblclick(function () {
        resetForm($('#DetalleMenu'));
        var l = $(this).attr("obj").split(",");
        $("#DetalleMenu_dm_id").val($.trim(l[0]));
        $("#DetalleMenu_dm_reservaciones_id").val($.trim(l[1]));
        $("#DetalleMenu_dm_menus_id").val($.trim(l[2]));
        $("#DetalleMenu_dm_cantidad").val($.trim(l[3]));
        $("#DetalleMenu_dm_precio").val($.trim(l[4]));
        $("#DetalleMenu_dm_comentarios").val($.trim(l[5]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>

