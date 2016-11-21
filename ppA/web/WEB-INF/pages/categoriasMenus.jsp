<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="page-header">
    <h1 style="margin:0">Menús
        <div class="button-group  pull-right">
            <a id="nuevaCategoriaMenu" href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                <span class="glyphicon glyphicon-plus-sign"></span>
                <b><s:text name="cm.btnNuevo" /></b>
            </a>
        </div>
    </h1>
</div>
<div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="cm.legend" /><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></legend>
                    <s:form action="CategoriaMenu">
                        <s:hidden name="cm.id" />
                        <div class="form-group">
                            <s:textfield name="cm.categoriaMenu" key="cm.categoriaMenu" cssClass="form-control required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="cm.descripcion" key="cm.descripcion" cssClass="form-control required" required="true" />
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
            <th><s:text name="cm.categoriaMenu" /></th>
            <th><s:text name="cm.descripcion" /></th>
            <th data-priority="1"><s:text name="q.acciones" /></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="l" items="${listCategoriasMenus}">
            <tr obj="${l.id}, ${l.categoriaMenu}, ${l.descripcion}">
                <td><c:out value="${l.categoriaMenu}"/></td>
                <td><c:out value="${l.descripcion}"/></td>
                <td>
                    <button class="btn btn-default btn-xs anotherNew" title="Modificar">
                        <span class="glyphicon glyphicon-edit"></span>
                    </button>
                    <button class="btn btn-default btn-xs" data-href="./CategoriaMenu!eliminar?id=${l.id}"
                            data-toggle="modal" data-target="#confirm-delete" title="Eliminar">
                        <span class="glyphicon glyphicon-trash"></span>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script type="text/javascript">
    $('#nuevaCategoriaMenu').on('click', function () {
        $("#CategoriaMenu_ca_id").val(0);
        resetForm($('#CategoriaMenu'));
        $("#CategoriaMenu_ca_categoriaMenu").focus();
    });
    function edit(t) {
        resetForm($('#CategoriaMenu'));
        var l = $(t).attr("obj").split(",");
        $("#CategoriaMenu_ca_id").val($.trim(l[0]));
        $("#CategoriaMenu_ca_categoriaMenu").val($.trim(l[1]));
        $("#CategoriaMenu_ca_descripcion").val($.trim(l[2]));
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
