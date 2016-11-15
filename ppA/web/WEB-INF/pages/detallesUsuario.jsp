<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <div class="modal-dialog">
       
            <div class="modal-body">
                <fieldset>
                    <h1> Detalles de mi usuario</h1> 
                   <br/>
                    <label>NOMBRES:</label>
                    <s:property value="#session.userNombre" />
                    <br/><br/>
                    <label>APELLIDOS:</label>
                    <s:property value="#session.userApellidos" />
                    <br/><br/>
                    <label>USUARIO:</label>
                    <s:property value="#session.userName" />
                    <br/><br/>
                    <label>ROL DE USUARIO:</label>
                    <s:property value="#session.userRol" />
                    <br/><br/>
                    <label>CAMBIAR CONTRASEÑA:</label>
                    <s:form action="Usuario">
               
                        <s:hidden name="idCliente" value="%{session.userId}" />
                        <div class="form-group">
                            <s:password name="nu.clave" cssClass="form-control required" required="true" />
                        </div>

                        <s:submit method="modificar" cssClass="btn btn-default" value="Modificar" key="btn.guardar" />
                    </s:form>
                </fieldset>
            
        </div>
    </div>

    </body>
</html>
