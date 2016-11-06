<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br/>
<a id="nuevoUsuario" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="nu.btnNuevo" /></b>
</a>
<br/>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="nu.legend" /></legend>
                    <s:form action="Usuario">
                        <s:hidden name="nu.id" />
                        <s:textfield name="nu.nombre" key="nu.nombre" cssClass="form-control required" required="true" />
                        <s:textfield name="nu.apellido" key="nu.apellido" cssClass="form-control required" required="true" />
                        <s:textfield name="nu.usuario" key="nu.usuario" cssClass="form-control required" required="true" />
                        <s:password name="nu.clave" key="nu.clave" cssClass="form-control required" required="true" />
                        <%--<s:password name="nu.clave" label="Confirmar Contraseña" cssClass="form-control required" required="true" />--%>
                        <s:select name="nu.roles.id" listKey="id" listValue="rol" headerKey="" cssClass="select2 required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listRoles" key="nu.roles" required="true"/>

                        <s:submit method="guardar" cssClass="btn-info disabled submit" value="Guardar" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<br/>
<div id="container">
    <table id="dataTable" class="table table-striped table-bordered table-hover dt-responsive nowrap">
        <thead>
            <tr>
                <th><s:text name="nu.nombre" /></th>
                <th><s:text name="nu.apellido" /></th>
                <th><s:text name="nu.usuario" /></th>
                <th><s:text name="nu.roles" /></th>
                <th data-priority="1"><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listUsuarios}">
                <tr obj="${l.id}, ${l.nombre}, ${l.apellido}, ${l.usuario}, ${l.clave}, ${l.roles.id}">
                    <td><c:out value="${l.nombre}"/></td>
                    <td><c:out value="${l.apellido}"/></td>
                    <td><c:out value="${l.usuario}"/></td>
                    <td><c:out value="${l.roles.rol}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs anotherNew">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <button class="btn btn-default btn-xs" data-href="./Usuario!eliminar?id=${l.id}"
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
    $('#nuevoUsuario').on('click', function () {
        $("#Usuario_nu_id").val(0);
        resetForm($('#Usuario'));
        $("#Usuario_nu_usuarios").focus();
    });
    function edit(t) {
        resetForm($('#Usuario'));
        var l = $(t).attr("obj").split(",");
        $("#Usuario_nu_id").val($.trim(l[0]));
        $("#Usuario_nu_nombre").val($.trim(l[1]));
        $("#Usuario_nu_apellido").val($.trim(l[2]));
        $("#Usuario_nu_usuario").val($.trim(l[3]));
        $("#Usuario_nu_clave").val($.trim(l[4]));
        $("#Usuario_nu_roles_id").val(1).trigger("change");
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
