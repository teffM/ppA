<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="es">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--boostrap-->
        <link href="./r/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="./r/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!--jQuery-->
        <script src="./r/js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <!--toaster-->
        <link href="./r/toastr/css/toastr.css" rel="stylesheet" type="text/css"/>
        <script src="./r/toastr/js/toastr.js" type="text/javascript"></script>
        <!--customs-->
        <script src="./r/js/functions.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="navbar-header">
                <a class="navbar-brand" href="./index">WebSiteName</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="./reserva">RESERVA</a></li>
                <li><a href="#">Page 1</a></li>
                <li><a href="#">Page 2</a></li>
                <li><a href="#">Page 3</a></li>
            </ul>
        </nav>
        <div class="page-header">
            It is header tile
        </div>
        <div class="container">
            <tiles:insertAttribute name="body" />
        </div>
        <div class="navbar-fixed-bottom" onclick="msg('success', 'success');">
            It is footer tile
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                if ($('#toast-container').length == 0) {
            <s:if test="%{errorMsg != null && errorMsg != ''}">
                    msg("error", "<s:property escape="false" value="errorMsg" />");
            </s:if>
                }
            });
        </script>
    </body>
</html>