<%-- 
    Document   : index
    Created on : 23-ago-2012, 19:21:55
    Author     : Java
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Primera aplicación en Struts 2</title>
    </head>
    <body>
        <h1>Login de usuario</h1>
        <s:form action="Login">
            <s:textfield name="usuario" label="Usuario"/>
            <s:password name="clave" label="Clave"/>
            <s:submit/>
        </s:form>
    </body>
</html>
