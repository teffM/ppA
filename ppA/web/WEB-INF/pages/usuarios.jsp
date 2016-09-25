<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a id="nuevoUsuario" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b> Nuevo Usuario</b>
</a>

    <br></br>
    <br></br>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="usuario.nuevoUsuario" /></legend>
                    <s:form action="Usuario">
                        <s:hidden name="nu.id" />
                        <s:textfield name="nu.usuario" label="Usuario" cssClass="form-control" required="true" />
                        <s:password name="nu.contra" label="Contraseña" cssClass="form-control" />
                        <s:password name="nu.contra" label="Confirmar Contraseña" cssClass="form-control" />
                        <s:select name="nu.roles.id" listKey="id" listValue="rol" headerKey="-1" required=""
                                  headerValue="--- Seleccione un rol ---" list="listRoles" label="Roles" />

                        <s:submit method="guardar" cssClass="btn-info disabled" value="Guardar" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<div id="container">
    <table class="table table-bordered table-hover">
        <tr>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Rol</th>
            <th>Eliminar?</th>
        </tr>
        <c:forEach var="l" items="${listUsuarios}">
            <tr obj="${l.id}, ${l.usuario}, ${l.contra}">
                <td><c:out value="${l.usuario}"/></td>
                <td><c:out value="${l.contra}"/></td>
                <td><c:out value="${l.roles.rol}"/></td>
                
                <td>
                    <button class="btn btn-default btn-xs" data-href="./Usuario!eliminar?id=${l.id}"
                            data-toggle="modal" data-target="#confirm-delete">
                        <span class="glyphicon glyphicon-trash" />
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script type="text/javascript">
    $('#nuevaReserva').on('click', function () {
        $("#Usuario_nu_id").val(0);
        $("form")[0].reset();
        $("#Usuario_nu_usuarios").focus();
    });
    $("tr").dblclick(function () {
        var l = $(this).attr("obj").split(",");
        $("#Usuario_nu_id").val($.trim(l[0]));
        $("#Usuario_nu_usuario").val($.trim(l[1]));
        $("#Usuario_nu_contra").val($.trim(l[2]));
        $("#Usuario_nu_roles_id").val(1);
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>
