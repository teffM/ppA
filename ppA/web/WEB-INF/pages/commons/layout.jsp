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
        <link href="./r/bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./r/bootstrap/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                <li class="inactive"><a href="./Reserva">RESERVACIONES</a></li>
                <li class="dropdown">
                <li class="dropdown">
                    <a data-toggle="dropdown">
                        ADMINISTRACIÓN<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="./Usuario">USUARIOS</a></li>
                        <li><a href="./Sucursal">SUCURSALES</a></li>
                        <li><a href="#">REPORTES</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
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
        <script src="./r/bootstrap/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/responsive.bootstrap.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/jszip.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="./r/bootstrap/js/buttons.html5.min.js" type="text/javascript"></script>
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
                $('#dataTable').DataTable({
                    dom: 'Bfrtip',
                    buttons: ['copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5'],
                    "pagingType": "full_numbers",
                    language: {
                        processing: "Traitement en cours...",
                        search: "Rechercher&nbsp;:",
                        lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
                        info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                        infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                        infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                        infoPostFix: "",
                        loadingRecords: "Chargement en cours...",
                        zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
                        emptyTable: "Aucune donnée disponible dans le tableau",
                        paginate: {
                            first: "Premier",
                            previous: "Pr&eacute;c&eacute;dent",
                            next: "<s:text name="dt.sNext" />",
                            last: "Dernier"
                        },
                        aria: {
                            sortAscending: ": activer pour trier la colonne par ordre croissant",
                            sortDescending: ": activer pour trier la colonne par ordre décroissant"
                        }
                    }
                });
            });
            $('#confirm-delete').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        </script>
    </body>
</html>