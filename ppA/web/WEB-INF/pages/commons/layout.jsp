<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="es">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--jQuery-->
        <script src="./r/js/jquery.com_jquery-2.1.1.min.js" type="text/javascript"></script>
        <!--<script src="./r/js/jquery-3.1.0.min.js" type="text/javascript"></script>-->
        <!--boostrap-->
        <link href="./r/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        <!--toaster-->
        <link href="./r/toastr/css/toastr.css" rel="stylesheet" type="text/css"/>
        <script src="./r/toastr/js/toastr.js" type="text/javascript"></script> 
        <!--customs-->
        <link href="./r/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="./r/js/functions.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="navbar-header">
                <a class="navbar-brand" href="./index">Restaurante La Pampa</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="./Reserva">RESERVACIONES</a></li>
                <li><a href="./Usuario">USUARIOS</a></li>
                <li><a href="./Sucursal">SUCURSALES</a></li>
                <li><a href="#">REPORTES</a></li>
            </ul>
        </nav>
        <div class="page-header">
            It is header tile
        </div>
        <div class="container">
            <tiles:insertAttribute name="body" />
        </div>
        <!--modal confirm delete-->
        <div class="navbar-fixed-bottom">
            It is footer tile
        </div><div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        Advertencia!
                    </div>
                    <div class="modal-body">
                        Seguro de eliminar el registro?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger btn-ok">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <!--boostrap--> 
        <script src="./r/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/moment-with-locales.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/validator.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                if ($('#toast-container').length == 0) {
            <s:if test="%{msg != null && msg != ''}">
                    msg("success", "<s:property escape="false" value="msg" />");
            </s:if>
            <s:if test="%{errorMsg != null && errorMsg != ''}">
                    msg("error", "<s:property escape="false" value="errorMsg" />");
            </s:if>
                }
            });
            $('#confirm-delete').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        </script>
    </body>
</html>