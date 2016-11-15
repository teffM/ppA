<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<br/>
 <div class="button-group  pull-right">
           <a id="estado" href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
        <b><s:text name="e.btnNuevo" /></b>
</a>
        </div>
<br/><br/>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="e.legend" /></legend>
                    <s:form action="Estado">
                        <s:hidden name="e.id" />
                        <s:textfield name="e.estado" key="e.estado" cssClass="form-control required" required="true" />
                        <s:textfield name="e.color" key="e.color" cssClass="form-control colorpicker required" required="true" />
                        <s:textfield name="e.descripcion" key="e.descripcion" cssClass="form-control required" required="true" />

                        <s:submit method="guardar" cssClass="btn btn-default" key="btn.guardar" />
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
                <th><s:text name="e.estado" /></th>
                <th><s:text name="e.color" /></th>
                <th><s:text name="e.descripcion" /></th>
                <th data-priority="1"><s:text name="q.acciones" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listEstados}">
                <tr obj="${l.id}, ${l.estado}, ${l.color}, ${l.descripcion}">
                    <td><c:out value="${l.estado}"/></td>
                    <td style="background-color: <c:out value="${l.color}"/>;"><c:out value="${l.color}"/></td>
                    <td><c:out value="${l.descripcion}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs anotherNew">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <button class="btn btn-default btn-xs" data-href="./Estado!eliminar?id=${l.id}"
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
    $('#nuevoEstado').on('click', function () {
        $("#Estado_r_id").val(0);
        resetForm($('#Estado'));
        $("#Estado_r_estado").focus();
    });
    function edit(t) {
        resetForm($('#Estado'));
        var l = $(t).attr("obj").split(",");
        $("#Estado_e_id").val($.trim(l[0]));
        $("#Estado_e_estado").val($.trim(l[1]));
        $("#Estado_e_color").val($.trim(l[2]));
        $("#Estado_e_descripcion").val($.trim(l[3]));
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