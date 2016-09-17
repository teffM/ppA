<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html lang="es">
    <head>
        <title>hello</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--boostrap-->
        <link href="./r/boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
        <div class="container">
            <h2>It is header tile</h2>
        </div>
        <div class="container">
            <tiles:insertAttribute name="body" />
        </div>
        <div class="container">
            <h2 onclick="msg('success', 'success');">It is footer tile</h2>
        </div>
    </body>
</html>