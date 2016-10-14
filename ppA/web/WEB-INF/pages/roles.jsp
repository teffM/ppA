<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="nuevoRol" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="ro.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="ro.legend" /></legend>
                    <s:form action="Rol">
                        <s:hidden name="ro.id" />
                        <s:textfield name="ro.rol" key="ro.rol" cssClass="form-control required" required="true" />
                        <s:textfield name="ro.descripcion" key="ro.descripcion" cssClass="form-control required" required="true" />

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
                <th><s:text name="ro.rol" /></th>
                <th><s:text name="ro.descripcion" /></th>
                <th><s:text name="q.eliminar" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listRoles}">
                <tr obj="${l.id}, ${l.rol}, ${l.descripcion}">
                    <td><c:out value="${l.rol}"/></td>
                    <td><c:out value="${l.descripcion}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs" data-href="./Rol!eliminar?id=${l.id}"
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
    $('#nuevoRol').on('click', function () {
        $("#Rol_ro_id").val(0);
        resetForm($('#Rol'));
        $("#Rol_ro_rol").focus();
    });
    $("#dataTable > tbody > tr").dblclick(function () {
        resetForm($('#Rol'));
        var l = $(this).attr("obj").split(",");
        $("#Rol_ro_id").val($.trim(l[0]));
        $("#Rol_ro_rol").val($.trim(l[1]));
        $("#Rol_ro_descripcion").val($.trim(l[2]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>
