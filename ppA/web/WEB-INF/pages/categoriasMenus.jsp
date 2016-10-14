<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="nuevaCategoriaMenu" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="cm.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="cm.legend" /></legend>
                    <s:form action="CategoriaMenu">
                        <s:hidden name="cm.id" />
                        <s:textfield name="cm.categoriaMenu" key="cm.categoriaMenu" cssClass="form-control required" required="true" />
                        <s:textfield name="cm.descripcion" key="cm.descripcion" cssClass="form-control required" required="true" />

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
                <th><s:text name="cm.categoriaMenu" /></th>
                <th><s:text name="cm.descripcion" /></th>
                <th><s:text name="q.eliminar" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listCategoriasMenus}">
                <tr obj="${l.id}, ${l.categoriaMenu}, ${l.descripcion}">
                    <td><c:out value="${l.categoriaMenu}"/></td>
                    <td><c:out value="${l.descripcion}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs" data-href="./CategoriaMenu!eliminar?id=${l.id}"
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
    $('#nuevaCategoriaMenu').on('click', function () {
        $("#CategoriaMenu_ca_id").val(0);
        resetForm($('#CategoriaMenu'));
        $("#CategoriaMenu_ca_categoriaMenu").focus();
    });
    $("#dataTable > tbody > tr").dblclick(function () {
        resetForm($('#CategoriaMenu'));
        var l = $(this).attr("obj").split(",");
        $("#CategoriaMenu_ca_id").val($.trim(l[0]));
        $("#CategoriaMenu_ca_categoriaMenu").val($.trim(l[1]));
        $("#CategoriaMenu_ca_descripcion").val($.trim(l[2]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>
