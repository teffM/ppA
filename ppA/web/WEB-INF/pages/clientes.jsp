<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a id="nuevoCliente" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="c.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="c.legend" /></legend>
                    <s:form action="Cliente">
                        <s:hidden name="c.id" />
                        <s:textfield name="c.nombre" key="c.nombre" cssClass="form-control required" required="true" />
                        <s:textfield name="c.apellido" lkey="c.apellido" cssClass="form-control required" required="true" />
                        <s:textfield name="c.telefono" key="c.telefono" cssClass="form-control required" placeholder="00000000" required="true" type="number" />
                        <s:textfield name="c.correo" key="c.correo" cssClass="form-control required" placeholder="user@domain.com" required="true" type="email" />
                        <s:textfield name="c.dui" key="c.DUI" cssClass="form-control required" required="true" placeholder="00000000-0" mask="99999999-9" />
                        <s:textfield name="c.nit" key="c.NIT" cssClass="form-control" placeholder="0000-000000-000-0" mask="9999-99999-999-9" />
                        <s:textfield name="c.comprobanteIva" key="c.comprobanteIva" cssClass="form-control" />
                        <s:textfield name="c.descripcion" key="c.descripcion" cssClass="form-control required" required="true" />
                        <s:submit method="guardar" cssClass="btn-info disabled submit" value="Guardar" key="btn.guardar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<div id="container">
    <table  id="dataTable" class="table table-striped table-bordered table-hover dt-responsive nowrap">
        <thead>
            <tr>
                <th><s:text name="c.nombre" /></th>
                <th><s:text name="c.apellido" /></th>
                <th><s:text name="c.telefono" /></th>
                <th><s:text name="c.correo" /></th>
                <th><s:text name="c.DUI" /></th>
                <th><s:text name="c.NIT" /></th>
                <th><s:text name="c.comprobanteIva" /></th>
                <th><s:text name="c.descripcion" /></th>
                <th><s:text name="q.eliminar" /></th>
            </tr>
        </thead> 
        <tbody>
            <c:forEach var="l" items="${listClientes}">
                <tr obj="${l.id}, ${l.nombre}, ${l.apellido}, ${l.telefono}, ${l.correo}, ${l.dui}, ${l.nit}, ${l.comprobanteIva}, ${l.descripcion}">
                    <td><c:out value="${l.nombre}"/></td>
                    <td><c:out value="${l.apellido}"/></td>
                    <td><c:out value="${l.telefono}"/></td>
                    <td><c:out value="${l.correo}"/></td>
                    <td><c:out value="${l.dui}"/></td>
                    <td><c:out value="${l.nit}"/></td>
                    <td><c:out value="${l.comprobanteIva}"/></td>
                    <td><c:out value="${l.descripcion}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs" data-href="./Cliente!eliminar?id=${l.id}"
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
    $('#nuevoCliente').on('click', function () {
        $("#Cliente_c_id").val(0);
        resetForm($('#Cliente'));
        $("#Cliente_c_nombre").focus();
    });
    $("#dataTable > tbody > tr").dblclick(function () {
        resetForm($('#Cliente'));
        var l = $(this).attr("obj").split(",");
        $("#Cliente_c_id").val($.trim(l[0]));
        $("#Cliente_c_nombre").val($.trim(l[1]));
        $("#Cliente_c_apellido").val($.trim(l[2]));
        $("#Cliente_c_telefono").val($.trim(l[3]));
        $("#Cliente_c_correo").val($.trim(l[4]));
        $("#Cliente_c_dui").val($.trim(l[5]));
        $("#Cliente_c_nit").val($.trim(l[6]));
        $("#Cliente_c_comprobanteIva").val($.trim(l[7]));
        $("#Cliente_c_descripcion").val($.trim(l[8]));
        $('#myModal').modal({
            show: 'false'
        });
    });
    $(document).ready(function () {
        $("#Cliente_c_correo").attr("type", "email");
        $("#Cliente_c_telefono").attr("type", "phone");
    });
</script>