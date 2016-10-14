<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a id="nuevoMenu" href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b><s:text name="m.btnNuevo" /></b>
</a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="m.legend" /></legend>
                    <s:form action="Menu">
                        <s:hidden name="m.id" />
                         <s:select name="m.categoriasMenus.id" listKey="id" listValue="categoriaMenu" headerKey="" cssClass="required"
                                  headerValue="%{getText('lbl.seleccione')}" list="listCategorias" key="m.categoriaMenu" required="true" />
                        <s:textfield name="m.menu" key="m.menu" cssClass="form-control required" required="true" />
                        <s:textfield name="m.precio" key="m.precio" cssClass="form-control required" required="true" />
                        <s:textfield name="m.descripcion" key="m.descripcion" cssClass="form-control required" required="true" />

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
                <th><s:text name="m.categoriaMenu" /></th>
                <th><s:text name="m.menu" /></th>
                <th><s:text name="m.precio" /></th>
                <th><s:text name="m.descripcion" /></th>
                <th><s:text name="q.eliminar" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${listMenus}">
                <tr obj="${l.id}, ${l.categoriasMenus.id}, ${l.menu}, ${l.precio}, ${l.descripcion}">
                    <td><c:out value="${l.categoriasMenus.categoriaMenu}"/></td>
                    <td><c:out value="${l.menu}"/></td>
                    <td><c:out value="${l.precio}"/></td>
                    <td><c:out value="${l.descripcion}"/></td>
                    <td>
                        <button class="btn btn-default btn-xs" data-href="./Menu!eliminar?id=${l.id}"
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
    $('#nuevoMenu').on('click', function () {
        $("#Menu_m_id").val(0);
        resetForm($('#Menu'));
        $("#Menu_m_menu").focus();
    });
    $("#dataTable > tbody > tr").dblclick(function () {
        resetForm($('#Menu'));
        var l = $(this).attr("obj").split(",");
        $("#Menu_m_id").val($.trim(l[0]));
        $("#Menu_m_categoriasMenus_id").val($.trim(l[1]));
        $("#Menu_m_menu").val($.trim(l[2]));
        $("#Menu_m_precio").val($.trim(l[3]));
        $("#Menu_m_descripcion").val($.trim(l[4]));
        $('#myModal').modal({
            show: 'false'
        });
    });
</script>
