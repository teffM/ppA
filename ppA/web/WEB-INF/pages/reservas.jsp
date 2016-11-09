<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<br/>
<div class="form-inline">

    <div class="form-group">
        <a id="busqueda" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#mySearchOptions">
            <span class="glyphicon glyphicon-plus-sign"></span>
            <b><s:text name="r.btnCriterios" /></b>
        </a>
    </div>
    <div class="form-group">
        <a id="nuevaReserva" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
            <span class="glyphicon glyphicon-plus-sign"></span>
            <b><s:text name="r.btnNuevo" /></b>
        </a>
    </div>
</div>
<br/><br/>
<div class="modal fade" id="mySearchOptions" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend>Criterios de busqueda</legend>
                    <s:form action="Reserva" id="busqueda">
                        <s:select name="id" listKey="id" listValue="estado" headerKey="" cssClass="select2 required input"
                                  headerValue="Cualquiera" list="listEstados" key="r.estado" required="true"/>

                        <s:submit method="list" cssClass="btn submit" ondblclick="" key="Buscar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <s:form action="Reserva" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-6">
                            <fieldset>
                                <legend><s:text name="r.legend" /></legend>
                                <s:hidden name="r.id" />
                                <div class="row form-group">
                                    <div class="col-md-10">
                                        <s:select name="r.clientes.id" listKey="id" listValue="%{nombre + ' ' +  apellido}" headerKey=""
                                                  cssClass="select2 required" headerValue="%{getText('lbl.seleccione')}"
                                                  list="listClientes" key="r.cliente" required="true" />
                                    </div>
                                    <div class="col-md-2">
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

                                <s:submit method="guardar" cssClass="btn-info disabled submit" value="Guardar" key="btn.guardar" />
                            </fieldset>
                        </div>
                        <div class="col-md-6">
                            <fieldset id="toCollapse" class="collapse">
                                <s:hidden name="r.idCliente" />
                                <legend><s:text name="c.legend" /></legend>
                                <div class="form-group">
                                    <s:textfield name="r.nombre" key="c.nombre" cssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <s:textfield name="r.apellido" key="c.apellido" cssClass="form-control" />
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
                                <div class="form-group">
                                    <s:textfield name="r.nit" key="c.nit" cssClass="form-control" placeholder="0000-000000-000-0" mask="9999-99999-999-9" />
                                </div>
                                <div class="form-group">
                                    <s:textfield name="r.comprobanteIva" key="c.comprobanteIva" cssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <s:textarea name="r.descripcion" key="c.descripcion" />
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalPlatillos" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend>Agregar platillos</legend>
                    <s:form action="Reserva" class="form-horizontal">
                        <s:hidden name="idReserva" />
                        <div>
                        <select multiple="multiple" class="imagePicker">
                            <optgroup label="Cats">
                                <option data-img-src="http://placekitten.com/220/200" value="1">Cute Kitten 1</option>
                                <option data-img-src="http://placekitten.com/180/200" value="2">Cute Kitten 2</option>
                                <option data-img-src="http://placekitten.com/130/200" value="3">Cute Kitten 3</option>
                                <option data-img-src="http://placekitten.com/270/200" value="4">Cute Kitten 4</option>
                            </optgroup>
                            <optgroup label="Animals">
                                <option data-img-src="http://lorempixel.com/220/200/animals/" value="5">Animal 1</option>
                                <option data-img-src="http://lorempixel.com/180/200/animals/" value="6">Animal 2</option>
                                <option data-img-src="http://lorempixel.com/130/200/animals/" value="7">Animal 3</option>
                                <option data-img-src="http://lorempixel.com/270/200/animals/" value="8">Animal 4</option>
                            </optgroup>
                        </select>
</div>
                        <s:submit method="list" cssClass="btn submit" ondblclick="" key="Buscar" />
                    </s:form>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<div id="container">
    <table id="dataTable" class="table table-responsive table-hover table-bordered table-condensed  table-striped">
        <thead>
            <tr>
                <th><s:text name="r.cliente" /></th>
                <!--<th><s:text name="r.menu" /></th>-->
                <th><s:text name="r.fechaReserva" /></th>
                <th><s:text name="r.estado" /></th>
                <th><s:text name="r.fechaCreacion" /></th>
                <th><s:text name="r.persona" /></th>
                <th><s:text name="r.sucursal" /></th>
                <th><s:text name="r.comentario" /></th>
                <th>Usuario</th>
                <th data-priority="1"><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listReservas}">
                <fmt:formatDate value="${l.fechaReservacion}" var="fechaReserva"
                                pattern="dd/MM/yyyy hh:mm a" />
                <fmt:formatDate value="${l.fechaCreacion}" var="fechaCreacion"
                                pattern="dd/MM/yyyy hh:mm a" />
                <tr obj="${l.id}, ${l.clientes.id},
                    ${fechaReserva}, ${fechaCreacion}, ${l.numPersonas},
                    ${l.sucursales.id}, ${l.estados.id}, ${l.comentarios}">
                    <td><c:out value="${l.clientes.nombre}"/> <c:out value="${l.clientes.apellido}"/></td>
                    <td><c:out value="${fechaReserva}"/></td>
                    <td style="background-color: <c:out value="${l.estados.color}"/>;"><c:out value="${l.estados.estado}"/></td>
                    <td><c:out value="${fechaCreacion}"/></td>
                    <td><c:out value="${l.numPersonas}"/></td>
                    <td><c:out value="${l.sucursales.sucursal}"/></td>
                    <td><c:out value="${l.comentarios}"/></td>
                    <td><c:out value="${l.usuarios.usuario}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs anotherNew" data-toggle="tooltip" title="Modificar">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <a href="#" data-toggle="tooltip" class="aLinkNone" title="Eliminar">
                            <button class="btn btn-default btn-xs" data-href="./Reserva!eliminar?id=${l.id}"
                                    data-toggle="modal" data-target="#confirm-delete">
                                <span class="glyphicon glyphicon-trash"></span>
                            </button>
                        </a>
                        <a href="#" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalPlatillos" data-id-reserva="${l.id}">
                            <span class="glyphicon glyphicon-cutlery" data-toggle="tooltip" title="Platillos"></span>
                        </a>
                        <a class="btn btn-default btn-xs" href="./Detalles!obtener?id=${l.id}" data-toggle="tooltip" title="Detalles">
                            <span class="glyphicon glyphicon-eye-open"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $('#modalPlatillos').on('show.bs.modal', function (e) {
        $(e.currentTarget).find('#Reserva_idReserva').val($(e.relatedTarget).data('id-reserva'));
    });
    $('#nuevaReserva').on('click', function () {
        $("#Reserva_r_id").val(0);
        resetForm($('#Reserva'));
        $("#Reserva_r_nombres").focus();
    });
    function edit(t) {
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
    $("#dataTable > tbody > tr").dblclick(function () {
        edit($(this));
    });
    $(".anotherNew").on('click', function () {
        edit($(this).parent().parent());
    });
    $(document).ready(function () {
        $("#Reserva_r_correo").attr("type", "email");
        $("#Reserva_r_telefono").attr("type", "phone");
        $("#Reserva_r_numPersonas").attr("type", "positiveNumber");

//        icon collapse
        $('#toCollapse').on('shown.bs.collapse', function () {
            $('.glyphicon-chevron-right').attr('data-original-title', '¡Cancelar!').tooltip('fixTitle');
            $(".glyphicon-chevron-right").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-left");
            $("#Reserva_r_clientes_id").removeClass("required");
            $("#Reserva_r_idCliente").val("1");
        });
        $('#toCollapse').on('hidden.bs.collapse', function () {
            $('.glyphicon-chevron-left').attr('data-original-title', '¿Nuevo cliente?').tooltip('fixTitle');
            $(".glyphicon-chevron-left").removeClass("glyphicon-chevron-left").addClass("glyphicon-chevron-right");
            $("#Reserva_r_clientes_id").addClass("required");
            $("#Reserva_r_idCliente").val("0");
        });
    });
</script>
