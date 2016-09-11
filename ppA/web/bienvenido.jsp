<%-- 
    Document   : bienvenido
    Created on : 23-ago-2012, 20:54:16
    Author     : Java
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenido <s:property value="usuario"/></h1>
        <h2>La clave ingresada fué <s:property value="clave"/></h2>
    </body>
</html>
