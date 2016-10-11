<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a id="sucursal" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="s.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="s.legend" /></legend>
                    <s:form action="Sucursal">
                        <s:hidden name="s.id" />
                        <s:textfield name="s.sucursal" key="s.sucursal" cssClass="form-control required" required="true" />
                        <s:textfield name="s.nacional" key="s.nacional" cssClass="form-control" />
                        <s:textfield name="s.direccion" key="s.direccion" cssClass="form-control required" required="true" />
                        <s:textfield name="s.telefono" key="s.telefono" cssClass="form-control required" required="true" />

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
            <th><s:text name="s.sucursal" /></th>
            <th><s:text name="s.nacional" /></th>
            <th><s:text name="s.direccion" /></th>
            <th><s:text name="s.telefono" /></th>
            <th><s:text name="q.eliminar" /></th>
        </tr>
        </thead>
        <tbody>
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
            </tbody>
    </table>
</div>

<script type="text/javascript">
    $('#sucursal').on('click', function () {
        $("#Sucursal_s_id").val(0);
        resetForm($('#Sucursal'));
        $("#Sucursal_s_sucursales").focus();
    });
    $("#dataTable > tbody > tr").dblclick(function () {
        resetForm($('#Sucursal'));
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
    $("#Sucursal_s_telefono").attr("type", "phone");
</script>