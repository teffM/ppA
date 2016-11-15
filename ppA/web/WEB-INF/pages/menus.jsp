<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<br/>


<div class="page-header">
    <h1 style="margin:0">Menús
        <div class="button-group  pull-right">
           <a id="nuevoMenu" href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-plus-sign"></span>
       <b><s:text name="m.btnNuevo" /></b>
</a>
        </div>
    </h1>
</div>
<div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset>
                    <legend><s:text name="m.legend" /><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></legend>
                    <s:form action="Menu">
                        <s:hidden name="m.id" />
                        <div class="form-group">
                            <s:select name="m.categoriasMenus.id" listKey="id" listValue="categoriaMenu" headerKey="" cssClass="select2 required"
                                      headerValue="%{getText('lbl.seleccione')}" list="listCategorias" key="m.categoriaMenu" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="m.menu" key="m.menu" cssClass="form-control required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="m.precio" key="m.precio" cssClass="form-control required" required="true" />
                        </div>
                        <div class="form-group">
                            <s:textfield name="m.descripcion" key="m.descripcion" cssClass="form-control required" required="true" />
                        </div>
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
                <th data-priority="1"><s:text name="q.acciones" /></th>
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
                        <button class="btn btn-default btn-xs anotherNew">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
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
    function edit(t) {
        resetForm($('#Menu'));
        var l = $(t).attr("obj").split(",");
        $("#Menu_m_id").val($.trim(l[0]));
        $("#Menu_m_categoriasMenus_id").val($.trim(l[1])).trigger("change");
        $("#Menu_m_menu").val($.trim(l[2]));
        $("#Menu_m_precio").val($.trim(l[3]));
        $("#Menu_m_descripcion").val($.trim(l[4]));
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
