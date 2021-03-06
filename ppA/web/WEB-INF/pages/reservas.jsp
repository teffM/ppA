<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="page-header">
    <h1 style="margin:0">Reservaciones
        <div class="button-group  pull-right">
            <a id="" href="Reserva" class="btn btn-warning">
                <b>Reiniciar busqueda</b>
            </a>
            <a id="busqueda" href="#" class="btn btn-info" data-toggle="modal" data-target="#mySearchOptions">
                <b><s:text name="r.btnCriterios" /></b>
            </a>
            <a id="nuevaReserva" href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                <span class="glyphicon glyphicon-plus-sign"></span>
                <b><s:text name="r.btnNuevo" /></b>
            </a>
        </div>
    </h1>
</div>
<div class="modal fade" id="mySearchOptions" data-backdrop="static" data-keyboard="false" href="#" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="r.criterio" /><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></legend>
                    <s:form action="Reserva" id="busqueda">
                        <div class="form-group">
                            <s:textfield name="fMenorString" key="Fecha inicio"
                                         value="%{fMenorString}" cssClass="form-control dateTimeSearch required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="fMayorString" key="Fecha fin"
                                         value="%{fMayorString}" cssClass="form-control dateTimeSearch required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:select id="criEst" name="id" listKey="id" listValue="estado" headerKey="" cssClass="select2 required input"
                                      headerValue="Cualquiera" list="listEstados" key="r.estado" required="true"/>
                        </div>
                        <div class="form-group">
                            <s:select id="criCli" name="cliId" listKey="id" listValue="list" headerKey=""
                                      cssClass="select2 required" headerValue="%{getText('lbl.seleccione')}"
                                      list="listClientes" key="r.cliente" required="true" />
                        </div>
                        <div class="form-group">
                            <s:select id="criSuc" name="sucId" listKey="id" listValue="sucursal" headerKey="" cssClass="select2 required"
                                      headerValue="%{getText('lbl.seleccione')}" list="listSucursales" key="r.sucursal" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="numPersonas" key="r.persona" type="number" cssClass="form-control input required" required="true" />
                        </div>
                        <s:submit method="list" cssClass="btn btn-default" ondblclick="" key="Buscar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false" href="#">
    <div class="modal-dialog" id="myResizingModal">
        <div class="modal-content">
            <div class="modal-body">
                <s:form action="Reserva" class="form-horizontal">
                    <div class="row" >
                        <div class="col-md-12">
                            <fieldset>
                                <legend><s:text name="r.legend" />
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </legend>
                                <div class="myResizingDiv">
                                    <fieldset>
                                        <s:hidden name="r.id" />
                                        <div class="row form-group">
                                            <div class="col-md-10">
                                                <s:select name="r.clientes.id" listKey="id" listValue="list" headerKey=""
                                                          cssClass="select2 required" headerValue="%{getText('lbl.seleccione')}"
                                                          list="listClientes" key="r.cliente" required="true" />
                                            </div>
                                            <div class="col-md-2 toCollapse">
                                                <a href="#" class="btn" data-toggle="collapse" data-target="#toCollapse" style="font-size: 2em;">
                                                    <i class="glyphicon glyphicon-chevron-right" data-toggle="tooltip" title="¿Nuevo cliente?"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <s:date name="r.fechaReservacion" id="createdDateId" format="dd/MM/yyyy hh:mm:ss a" />
                                            <s:textfield name="r.fechaReservacion" key="r.fechaReserva"
                                                         value="%{createdDateId}" cssClass="form-control dateTimeMinNow required" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <s:textfield name="r.numPersonas" key="r.persona" type="number" cssClass="form-control input required" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <s:select name="r.sucursales.id" listKey="id" listValue="sucursal" headerKey="" cssClass="select2 required"
                                                      headerValue="%{getText('lbl.seleccione')}" list="listSucursales" key="r.sucursal" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <s:select name="r.estados.id" listKey="id" listValue="estado" headerKey="" cssClass="select2 required"
                                                      headerValue="%{getText('lbl.seleccione')}" list="listEstados" key="r.estado" required="true"/>
                                        </div>
                                        <div class="form-group">
                                            <s:textarea name="r.comentarios" cssClass="form-control input" key="r.comentario" />
                                        </div>
                                        <s:submit method="guardar" cssClass="btn btn-default" value="Guardar" key="btn.guardar" />
                                    </fieldset>
                                </div>
                                <div class="myResizingDiv">
                                    <fieldset id="toCollapse" class="collapse">
                                        <legend>
                                            <s:text name="c.legend" />
                                        </legend>
                                        <div class="row btn-group col-md-offset-2" data-toggle="buttons">
                                            <label class="btn btn-primary active" onclick="javascript: enaDisa(false);">
                                                <input type="radio" name="client" id="1"><s:text name="c.personaNatural" />
                                                <span class="glyphicon glyphicon-user"></span>
                                            </label>
                                            <label class="btn btn-primary" onclick="javascript: enaDisa(true);">
                                                <input type="radio" name="client" id="2"><s:text name="c.personaJuridica" />
                                                <span class="glyphicon glyphicon-education"></span>
                                            </label>
                                        </div>
                                        <div id="formCliente">
                                            <s:hidden name="r.idCliente" />
                                            <div class="form-group">
                                                <s:textfield name="r.nombre" key="c.nombre" cssClass="form-control required" required="true" />
                                            </div>
                                            <div class="form-group">
                                                <s:textfield name="r.apellido" key="c.apellido" cssClass="form-control required" required="true" />
                                            </div>
                                            <div class="form-group" style="display: none;">
                                                <s:textfield name="r.empresa" key="c.empresa" cssClass="form-control required" required="true" />
                                            </div>
                                            <div class="form-group">
                                                <s:textfield name="r.telefono" key="c.telefono" cssClass="form-control required" placeholder="00000000" required="true" type="number" />
                                            </div>
                                            <div class="form-group">
                                                <s:textfield name="r.correo" key="c.correo" cssClass="form-control required" placeholder="user@domain.com" required="true" type="email" />
                                            </div>
                                            <div class="form-group">
                                                <s:textfield name="r.dui" key="c.dui" cssClass="form-control required" required="true" placeholder="00000000-0" mask="99999999-9" />
                                            </div>
                                            <div class="form-group" style="display: none;">
                                                <s:textfield name="r.nit" key="c.nit" cssClass="form-control required enaDisa" placeholder="0000-000000-000-0" mask="9999-99999-999-9" required="true" />
                                            </div>
                                            <div class="form-group" style="display: none;">
                                                <s:textfield name="r.comprobanteIva" key="c.comprobanteIva" cssClass="form-control required enaDisa" required="true" />
                                            </div>
                                            <div class="form-group">
                                                <s:textarea name="r.descripcion" key="c.descripcion" cssClass="form-control" />
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </fieldset>      
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<table id="dataTable" class="table table-striped table-bordered table-hover dt-responsive nowrap">
    <thead>
        <tr>
            <th data-priority="1"><s:text name="r.cliente" /></th>
            <th><s:text name="r.fechaReserva" /></th>
            <th><s:text name="r.estado" /></th>
            <th><s:text name="r.fechaCreacion" /></th>
            <th><s:text name="r.persona" /></th>
            <th><s:text name="r.sucursal" /></th>
            <th><s:text name="r.comentario" /></th>
            <th><s:text name="r.usuario" /></th>
            <th data-priority="1"><s:text name="q.acciones" /></th>
        </tr>
    </thead>
    <tbody>
        <jsp:useBean id="today" class="java.util.Date" />
        <fmt:formatDate pattern="dd/MM/yyyy 00:00:00 a" value="${today}" var="today" />
        <c:forEach var="l" items="${listReservas}">
            <fmt:formatDate value="${l.fechaReservacion}" var="fechaReserva"
                            pattern="dd/MM/yyyy hh:mm:ss a" />
            <fmt:formatDate value="${l.fechaCreacion}" var="fechaCreacion"
                            pattern="dd/MM/yyyy hh:mm:ss a" />
            <tr obj="${l.id}, ${l.clientes.id},
                ${fechaReserva}, ${fechaCreacion}, ${l.numPersonas},
                ${l.sucursales.id}, ${l.estados.id}, ${l.comentarios}" ${today lt fechaReserva ? "ondblclick='javascript:edit(this);'" : ""}>
                <td><c:out value="${l.clientes.list}"/></td>
                <td><c:out value="${fechaReserva}"/></td>
                <td style="background-color: <c:out value="${l.estados.color}"/>;"><c:out value="${l.estados.estado}"/></td>
                <td><c:out value="${fechaCreacion}"/></td>
                <td><c:out value="${l.numPersonas}"/></td>
                <td><c:out value="${l.sucursales.sucursal}"/></td>
                <td><c:out value="${l.comentarios}"/></td>
                <td><c:out value="${l.usuarios.usuario}"/></td>
                <td>
                    <button class="btn btn-default btn-xs anotherNew" data-toggle="tooltip" title="Modificar" ${today lt fechaReserva ? "" : "disabled"}>
                        <span class="glyphicon glyphicon-edit"></span>
                    </button>
                    <a href="#" data-toggle="tooltip" class="aLinkNone" title="Eliminar">
                        <button class="btn btn-default btn-xs" data-href="./Reserva!eliminar?id=${l.id}"
                                data-toggle="modal" data-target="#confirm-delete" ${today lt fechaReserva ? "" : "disabled"}>
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>
                    </a>
                    <a class="btn btn-default btn-xs" href="./Detalles!obtener?id=${l.id}" data-toggle="tooltip" title="Detalles">
                        <span class="glyphicon glyphicon-eye-open"></span>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script type="text/javascript">
    $('#modalPlatillos').on('show.bs.modal', function (e) {
        $(e.currentTarget).find('#Reserva_idReserva').val($(e.relatedTarget).data('id-reserva'));
    });
    $('#nuevaReserva').on('click', function () {
        $(".toCollapse").show();
        $("#Reserva_r_id").val(0);
        resetForm($('#Reserva'));
        $("#Reserva_r_nombres").focus();
    });
    function edit(t) {
        $(".toCollapse").hide();
        resetForm($('#Reserva'));
        var l = $(t).attr("obj").split(",");
        $("#Reserva_r_id").val($.trim(l[0]));
        $("#Reserva_r_clientes_id").val($.trim(l[1])).trigger("change");
        $("#Reserva_r_fechaReservacion").val($.trim(l[2]));
        $("#Reserva_r_fechaCreacion").val($.trim(l[3]));
        $("#Reserva_r_numPersonas").val($.trim(l[4]));
        $("#Reserva_r_sucursales_id").val($.trim(l[5])).trigger("change");
        $("#Reserva_r_estados_id").val($.trim(l[6])).trigger("change");
        $("#Reserva_r_comentarios").val($.trim(l[7]));
        $('#myModal').modal({
            show: 'false'
        });
    }

    $(".anotherNew").on('click', function () {
        edit($(this).parent().parent());
    });
    $(document).ready(function () {
        $("#Reserva_r_correo").attr("type", "email");
        $("#Reserva_r_telefono").attr("type", "phone");
        $("#Reserva_r_numPersonas").attr("type", "positiveNumber");

        //        icon collapse
        $('#toCollapse').on('shown.bs.collapse', function () {
            $("#myResizingModal").addClass("modal-lg");
            $(".myResizingDiv").addClass("col-md-6");
            $('.glyphicon-chevron-right').attr('data-original-title', '¡Cancelar!').tooltip('fixTitle');
            $(".glyphicon-chevron-right").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-left");
            $("#Reserva_r_clientes_id").removeClass("required");
            $("#Reserva_r_idCliente").val("1");
        });
        $('#toCollapse').on('hidden.bs.collapse', function () {
            $("#myResizingModal").removeClass("modal-lg");
            $(".myResizingDiv").removeClass("col-md-6");
            $('.glyphicon-chevron-left').attr('data-original-title', '¿Nuevo cliente?').tooltip('fixTitle');
            $(".glyphicon-chevron-left").removeClass("glyphicon-chevron-left").addClass("glyphicon-chevron-right");
            $("#Reserva_r_clientes_id").addClass("required");
            $("#Reserva_r_idCliente").val("0");
        });
    });
    function enaDisa(v) {
        $('#formCliente').fadeOut(0);
        $("#Reserva_r_empresa").parent().parent().parent().toggle(v);
        $("#Reserva_r_nit").parent().parent().parent().toggle(v);
        $("#Reserva_r_comprobanteIva").parent().parent().parent().toggle(v);
        $('#formCliente div.tooltip').remove();
        $('#formCliente').fadeIn(500);
    }


</script>
