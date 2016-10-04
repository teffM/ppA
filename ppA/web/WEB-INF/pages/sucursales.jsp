<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a id="nuevoUsuario" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b> Nueva Sucursal</b>
</a>
    <br></br>
    <br></br>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="sucursal.Sucursal" /></legend>
                    <s:form action="Sucursal">
                        <s:hidden name="s.id" />
                        <s:textfield name="s.sucursal" label="Sucursal" cssClass="form-control" required="true" />
                        <s:textfield name="s.nacional" label="Nacional" cssClass="form-control" />
                        <s:textfield name="s.direccion" label="Direccion" cssClass="form-control" required="true" />
                        <s:textfield name="s.telefono" label="Telefono" cssClass="form-control" required="true" />

                        <s:submit method="guardar" cssClass="btn-info disabled" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<div id="container">
    <table class="table table-bordered table-hover">
        <tr>
            <th>Sucursal</th>
            <th>Nacional</th>
            <th>Direccion</th>
            <th>Telefono</th>
            <th>Eliminar?</th>
        </tr>
        <c:forEach var="l" items="${listSucursales}">
            <tr obj="${l.id}, ${l.sucursal}, ${l.nacional}, ${l.direccion}, ${l.telefono}">
                <td><c:out value="${l.sucursal}"/></td>
                <td><c:out value="${l.nacional}"/></td>
                <td><c:out value="${l.direccion}"/></td>
                <td><c:out value="${l.telefono}"/></td>
                
                <td>
                    <button class="btn btn-default btn-xs" data-href="./Sucursal!eliminar?id=${l.id}"
                            data-toggle="modal" data-target="#confirm-delete">
                        <span class="glyphicon glyphicon-trash" />
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    $('#nuevaSucursal').on('click', function () {
        $("#Sucursal_s_id").val(0);
        $("form")[0].reset();
        $("#Sucursal_s_sucursales").focus();
    });
    $("tr").dblclick(function () {
        var l = $(this).attr("obj").split(",");
        $("#Sucursal_s_id").val($.trim(l[0]));
        $("#Sucursal_s_sucursal").val($.trim(l[1]));
        $("#Sucursal_s_nacional").val($.trim(l[2]));
        $("#Sucursal_s_direccion").val($.trim(l[3]));
        $("#Sucursal_s_telefono").val($.trim(l[4]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>