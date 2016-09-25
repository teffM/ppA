<%@taglib uri="/struts-tags" prefix="s"%>
    <b>Ingrese usuario y contraseña</b>
<s:form action="Login">
    <s:textfield name="usuario" label="Usuario"/>
    <s:password name="clave" label="Clave"/>
    <s:submit cssClass="btn-info disabled" key="btn.guardar" />
</s:form>
