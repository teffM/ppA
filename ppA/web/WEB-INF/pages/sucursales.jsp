<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-header">
    <h1 style="margin:0">Sucursales
        <div class="button-group  pull-right">
            <a id="sucursal" href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                <span class="glyphicon glyphicon-plus-sign"></span>
                <b><s:text name="s.btnNuevo" /></b>
            </a>
        </div>
    </h1>
</div>
<div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="s.legend" /><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></legend>
                    <s:form action="Sucursal">
                        <s:hidden name="s.id" />
                        <div class="form-group">
                            <s:textfield name="s.sucursal" key="s.sucursal" cssClass="form-control required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="s.nacional" key="s.nacional" cssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="s.direccion" key="s.direccion" cssClass="form-control required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="s.telefono" key="s.telefono" cssClass="form-control required" required="true" />
                        </div>
                        <s:submit method="guardar" cssClass="btn btn-default" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<table id="dataTable" class="table table-striped table-bordered table-hover dt-responsive nowrap">
    <thead>
        <tr>
            <th><s:text name="s.sucursal" /></th>
            <th><s:text name="s.nacional" /></th>
            <th><s:text name="s.direccion" /></th>
            <th><s:text name="s.telefono" /></th>
            <th data-priority="1"><s:text name="q.acciones" /></th>
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
                    <button class="btn btn-default btn-xs anotherNew" title="Eliminar">
                        <span class="glyphicon glyphicon-edit"></span>
                    </button>
                    <button class="btn btn-default btn-xs" data-href="./Sucursal!eliminar?id=${l.id}"
                            data-toggle="modal" data-target="#confirm-delete" title="Modificar">
                        <span class="glyphicon glyphicon-trash" />
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script type="text/javascript">
    $('#sucursal').on('click', function () {
        $("#Sucursal_s_id").val(0);
        resetForm($('#Sucursal'));
        $("#Sucursal_s_sucursales").focus();
    });
    function edit(t) {
        resetForm($('#Sucursal'));
        var l = $(t).attr("obj").split(",");
        $("#Sucursal_s_id").val($.trim(l[0]));
        $("#Sucursal_s_sucursal").val($.trim(l[1]));
        $("#Sucursal_s_nacional").val($.trim(l[2]));
        $("#Sucursal_s_direccion").val($.trim(l[3]));
        $("#Sucursal_s_telefono").val($.trim(l[4]));
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

    $("#Sucursal_s_telefono").attr("type", "phone");
</script>