<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
    <div class="page-header">
        <h1 style="margin:0">Clientes
            <div class="button-group  pull-right">
                <a id="nuevoCliente" href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-plus-sign"></span>
                    <b><s:text name="c.btnNuevoCliente" /></b>
                </a>
            </div>
        </h1>
    </div>
    <div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <fieldset>
                        <legend>
                            <s:text name="c.legend" />
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </legend>
                        <div class="row btn-group col-md-offset-2 rediosPersons" data-toggle="buttons">
                            <label class="btn btn-primary active" onclick="javascript: enaDisa(false, true);">
                                <input type="radio" name="client" id="1"><s:text name="c.personaNatural" />
                                <span class="glyphicon glyphicon-user"></span>
                            </label>
                            <label class="btn btn-primary" onclick="javascript: enaDisa(true, true);">
                                <input type="radio" name="client" id="2"><s:text name="c.personaJuridica" />
                                <span class="glyphicon glyphicon-education"></span>
                            </label>
                        </div>
                        <s:form action="Cliente">
                            <s:hidden name="c.id" />
                            <div class="form-group">
                                <s:textfield name="c.nombre" key="c.nombre" cssClass="form-control required" required="true" />
                            </div>
                            <div class="form-group">
                                <s:textfield name="c.apellido" key="c.apellido" cssClass="form-control required" required="true" />
                            </div>
                            <div class="form-group" style="display: none;">
                                <s:textfield name="c.empresa" key="c.empresa" cssClass="form-control required enaDisa" required="true" />
                            </div>
                            <div class="form-group">
                                <s:textfield name="c.telefono" key="c.telefono" cssClass="form-control required" placeholder="00000000" required="true" type="number" />
                            </div>
                            <div class="form-group">
                                <s:textfield name="c.correo" key="c.correo" cssClass="form-control required" placeholder="user@domain.com" required="true" type="email" />
                            </div>
                            <div class="form-group">
                                <s:textfield name="c.dui" key="c.dui" cssClass="form-control required" required="true" placeholder="00000000-0" mask="99999999-9" />
                            </div>
                            <div class="form-group" style="display: none;">
                                <s:textfield name="c.nit" key="c.nit" cssClass="form-control required enaDisa" placeholder="0000-000000-000-0" mask="9999-99999-999-9" required="true" />
                            </div>
                            <div class="form-group" style="display: none;">
                                <s:textfield name="c.comprobanteIva" key="c.comprobanteIva" cssClass="form-control required enaDisa" required="true" />
                            </div>
                            <div class="form-group">
                                <s:textarea name="c.descripcion" key="c.descripcion" cssClass="form-control" />
                            </div>
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
                    <th><s:text name="c.empresa" /></th>
                    <th><s:text name="c.telefono" /></th>
                    <th><s:text name="c.correo" /></th>
                    <th><s:text name="c.dui" /></th>
                    <th><s:text name="c.nit" /></th>
                    <th><s:text name="c.comprobanteIva" /></th>
                    <th><s:text name="c.descripcion" /></th>
                    <th data-priority="1"><s:text name="q.acciones" /></th>
                </tr>
            </thead> 
            <tbody>
                <c:forEach var="l" items="${listClientes}">
                    <tr obj="${l.id}, ${l.nombre}, ${l.apellido}, ${l.empresa},
                        ${l.telefono}, ${l.correo}, ${l.dui}, ${l.nit},
                        ${l.comprobanteIva}, ${l.descripcion}">
                        <td><c:out value="${l.nombre}"/></td>
                        <td><c:out value="${l.apellido}"/></td>
                        <td><c:out value="${l.empresa}"/></td>
                        <td><c:out value="${l.telefono}"/></td>
                        <td><c:out value="${l.correo}"/></td>
                        <td><c:out value="${l.dui}"/></td>
                        <td><c:out value="${l.nit}"/></td>
                        <td><c:out value="${l.comprobanteIva}"/></td>
                        <td><c:out value="${l.descripcion}"/></td>
                        <td>
                            <button class="btn btn-default btn-xs anotherNew">
                                <span class="glyphicon glyphicon-edit" title="Modificar"></span>
                            </button>
                            <button class="btn btn-default btn-xs" data-href="./Cliente!eliminar?id=${l.id}"
                                    data-toggle="modal" data-target="#confirm-delete" title="Eliminar">
                                <span class="glyphicon glyphicon-trash" />
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    $('#nuevoCliente').on('click', function () {
        $(".rediosPersons").show();
        $("#Cliente_c_id").val(0);
        resetForm($('#Cliente'));
        $("#Cliente_c_nombre").focus();
    });
    function edit(t) {
        resetForm($('#Cliente'));
        var l = $(t).attr("obj").split(",");
        $(".rediosPersons").hide();
        enaDisa($.trim(l[3]).length > 0, false);
        $("#Cliente_c_id").val($.trim(l[0]));
        $("#Cliente_c_nombre").val($.trim(l[1]));
        $("#Cliente_c_apellido").val($.trim(l[2]));
        $("#Cliente_c_empresa").val($.trim(l[3]));
        $("#Cliente_c_telefono").val($.trim(l[4]));
        $("#Cliente_c_correo").val($.trim(l[5]));
        $("#Cliente_c_dui").val($.trim(l[6]));
        $("#Cliente_c_nit").val($.trim(l[7]));
        $("#Cliente_c_comprobanteIva").val($.trim(l[8]));
        $("#Cliente_c_descripcion").val($.trim(l[9]));
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

    $(document).ready(function () {
        $("#Cliente_c_correo").attr("type", "email");
        $("#Cliente_c_telefono").attr("type", "phone");

    });
    function enaDisa(v, f) {
        $('#Cliente').fadeOut(0);
        $("#Cliente_c_empresa").parent().parent().parent().toggle(v);
        $("#Cliente_c_nit").parent().parent().parent().toggle(v);
        $("#Cliente_c_comprobanteIva").parent().parent().parent().toggle(v);
        if (f)
            resetForm($('#Cliente'));
        $('#Cliente').fadeIn(500);
    }
</script>
