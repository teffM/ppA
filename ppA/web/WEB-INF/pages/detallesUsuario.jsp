<%@taglib uri="/struts-tags" prefix="s"%>
<fieldset class="mainbox col-md-6 col-md-offset-3">
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
