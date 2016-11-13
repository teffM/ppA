<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="es" class="body">
    <head>
        <title>La Pampa Argentina</title>
        <link rel="shortcut icon" type="image/x-icon" href="./r/images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--jQuery-->
        <script src="./r/js/jquery-2.1.1.min.js" type="text/javascript"></script>
        <!--boostrap-->
        <link href="./r/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/select2-bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--toaster-->
        <link href="./r/toastr/css/toastr.css" rel="stylesheet" type="text/css"/>
        <script src="./r/toastr/js/toastr.js" type="text/javascript"></script>
        <!--customs-->
        <link href="./r/image-picker/image-picker.css" rel="stylesheet" type="text/css"/>
        <link href="./r/css/loading.css" rel="stylesheet" type="text/css"/>
        <link href="./r/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="./r/js/functions.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="particles-js"></div>
    <nav class="navbar navbar-inverse twoRow" role="navigation">
        <div class="container">
            <div class="navbar-header col-md-2">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-left" href="./index"><img src="./r/images/logo.png" width="150px" height="50px" /></a>
            </div>
            <div class="collapse navbar-collapse " id="collapse">
                <ul class="nav navbar-nav col-md-8">
                    <s:if test="%{#session.userRol != null}">
                        <li class="navItem"><a href="./Reserva">RESERVACIONES</a></li>
                        <li class="navItem"><a href="./Cliente">CLIENTES</a></li>
                        <li><a href="./Reportes">REPORTES</a></li>
                        <s:if test="%{#session.userRol == 'administrador'}">
                            <li class="dropdown navItem">
                                <a data-toggle="dropdown">
                                    ADMINISTRACIÓN<span class="caret"></span>
                                </a>
                                <ul class="navbar-inverse dropdown-menu">
                                    <li><a href="./Usuario">USUARIOS</a></li>
                                    <li><a href="./Sucursal">SUCURSALES</a></li>
                                    <li><a href="./Menu">PLATILLOS</a></li>
                                    <li><a href="./CategoriaMenu">CATEGORIAS DE PLATILLOS</a></li>
                                    <li><a href="./Estado">ESTADOS</a></li>
                                    <!--
                                    <li><a href="./Rol">ROLES</a></li>
                                    -->
                                </ul>
                            </li>
                        </s:if>
                    </s:if>
                </ul>
                <s:if test="%{#session.userRol != null && #session.userRol != null}">
                    <ul class="nav navbar-nav navbar-right" col-md-2>
                        <li class="inactive">
                            <a href="./Login!cerrarSesion">CERRAR SESIÓN</a>
                        </li>
                    </ul>
                </s:if>
            </div>
        </div>
    </nav>
    <s:if test="%{#session.userRol == null}">
        <div id="loader-wrapper">
            <div id="loader">
                <header class="entry-header">
                    <h1 class="entry-title">Cargando...</h1>
                </header>
            </div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
        </div>
    </s:if>
    <div class="container myContainer twoContainer">
        <tiles:insertAttribute name="body" />
    </div>
    <!--modal confirm delete-->
    <div class="navbar-inverse footer navbar-fixed-bottom">
        © Copyright Restaurantes La Pampa, 2016 Derechos reservados / All Rights Reserved
    </div>
    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog">
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
    <script src="./r/bootstrap/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/dataTables.select.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/dataTables.responsive.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/responsive.bootstrap.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/buttons.print.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/jszip.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/pdfmake.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/vfs_fonts.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/buttons.html5.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/buttons.colVis.min.js" type="text/javascript"></script>
    <script src="./r/bootstrap/js/select2.full.min.js" type="text/javascript"></script>
    <!--jQuery-->
    <script src="./r/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="./r/js/jquery-validate.bootstrap-tooltip.min.js" type="text/javascript"></script>
    <script src="./r/js/messages_es.js" type="text/javascript"></script>
    <script src="./r/js/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script src="./r/image-picker/image-picker.min.js" type="text/javascript"></script>
    <!--particles-->
    <!--    <script src="./r/js/particles.min.js" type="text/javascript"></script>
        <script src="./r/js/particles-conf.js" type="text/javascript"></script>-->
    <script type="text/javascript">
        $(document).ready(function () {
        $(".select2").after("<span class='input-group-addon'>\n\
                <li class='glyphicon glyphicon-search'></li></span>");
        $(".select2").select2({
        theme: "bootstrap"
        }); $(document).on('focus', '.select2', function() {
        $(this).siblings('select').select2('open');
        });
        $('.form-group').find('.input-group-addon').on('click', function(){
        $(this).parent().find('select').trigger('focus');
        });
        $(".imagePicker").imagepicker({ show_label : true });
        if ($('#toast-container').length == 0) {
        <s:if test="%{msg != null && msg != ''}">
            msg("success", "<s:property escape="false" value="msg" />");
                </s:if>
                <s:if test="%{errorMsg != null && errorMsg != ''}">
                    msg("error", "<s:property escape="false" value="errorMsg" />");
                    </s:if>
        }
        $('#dataTable').DataTable({
        dom: 'lBfrtip',
                buttons: [
                {extend: 'colvis', text: '<s:text name="btn.colVis" />'},
                {extend: 'copyHtml5', text: '<s:text name="btn.copy" />',
                        exportOptions: {columns: ':visible'}},
                {extend: 'copyHtml5', text: '<s:text name="btn.copySelected" />',
                        exportOptions: {columns: ':visible', modifier: {selected: true}}},
                {extend: 'excelHtml5', text: 'EXCEL',
                        exportOptions: {columns: ':visible'}},
                {extend: 'csvHtml5', text: 'CSV',
                        exportOptions: {columns: ':visible'}},
                {extend: 'pdfHtml5', text: 'PDF',
                        exportOptions: {columns: ':visible'}},
                {extend: 'print', text: '<s:text name="btn.print" />',
                        exportOptions: {columns: ':visible'}},
                {extend: 'print', text: '<s:text name="btn.printSelected" />',
                        exportOptions: {columns: ':visible', modifier: {selected: true}}}],
                select: true,
                "pagingType": "full_numbers",
                language: {
                processing: "<s:text name="dt.sProcessing" />",
                        search: "<s:text name="dt.sSearch" />",
                        lengthMenu: "<s:text name="dt.sLengthMenu" />",
                        info: "<s:text name="dt.sInfo" />",
                        infoEmpty: "<s:text name="dt.sInfoEmpty" />",
                        infoFiltered: "<s:text name="dt.sInfoFiltered" />",
                        loadingRecords: "<s:text name="dt.sLoadingRecords" />",
                        zeroRecords: "<s:text name="dt.sZeroRecords" />",
                        emptyTable: "<s:text name="dt.sEmptyTable" />",
                        paginate: {
                        first: "<s:text name="dt.sFirst" />",
                                previous: "<s:text name="dt.sPrevious" />",
                                next: "<s:text name="dt.sNext" />",
                                last: "<s:text name="dt.sLast" />"
                        },
                        aria: {
                        sortAscending: "<s:text name="dt.sSortAscending" />",
                                sortDescending: "<s:text name="dt.sSortDescending" />"
                        },
                        buttons: {
                        copyTitle: "<s:text name="dt.copyTitle" />",
                                copySuccess: {
                                _: "<s:text name="dt.copyFiles" />",
                                        1: "<s:text name="dt.copyOneFile" />"
                                }
                        },
                        select: {
                        rows: {
                        _: "<s:text name="dt.selectFile" />",
                                0: "<s:text name="dt.selectClickFile" />",
                                1: "<s:text name="dt.selectOneFile" />"
                        }
                        }
                }
        });
        $(".dateTime").datetimepicker({locale: 'es', format: 'DD/MM/YYYY hh:mm:ss A'});
        $(".dateTime").after("<span class='input-group-addon'>\n\
                <span class='glyphicon glyphicon-calendar'></span></span>");
        $(".dateTimeMinNow").datetimepicker({locale: 'es', format: 'DD/MM/YYYY hh:mm:ss A', minDate: moment()});
        $(".dateTimeMinNow").after("<span class='input-group-addon'>\n\
                <span class='glyphicon glyphicon-calendar'></span></span>");
        $(".dateTimeMaxNow").datetimepicker({locale: 'es', format: 'DD/MM/YYYY hh:mm:ss A', maxDate: moment()});
        $(".dateTimeMaxNow").after("<span class='input-group-addon'>\n\
                <span class='glyphicon glyphicon-calendar'></span></span>");
        $('.form-group').find('.input-group-addon').on('click', function(){
        $(this).parent().find('input').trigger('focus');
        });
        $(".colorpicker").colorpicker({format: "hex"});
        $(".wwctrl").addClass("input-group");
        $(".input").removeClass("input");
        $("input[mask]").each(function () {
        $(this).mask($(this).attr("mask"));
        });
        $("form").submit(function () {
        $('body').removeClass('loaded');
        });
        $("a").click(function () {
        $('body').removeClass('loaded');
        });
        $('body').addClass('loaded');
        $("[data-toggle='tooltip']").tooltip();
        });
        function resetForm(f) {
        f[0].reset();
        var v = f.validate({lang: 'es'});
        v.resetForm();
        $(".select2").val('').trigger('change');
        $("div.tooltip").remove();
        }
        $('#confirm-delete').on('show.bs.modal', function (e) {
        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
        });
        $.validator.methods.email = function (value, element) {
        return this.optional(element) || /[a-z]+@[a-z]+\.[a-z]+/.test(value);
        };
        $.validator.addMethod("phone", function (value, element) {
        return this.optional(element) || /^[2|6|7][0-9]{7}$/.test(value);
        }, '<s:text name="err.phone" />');
        $.validator.addMethod('positiveNumber',
                function (value) {
                return Number(value) > 0;
                }, '<s:text name="err.mayorCero" />');
    </script>
</body>
</html>
