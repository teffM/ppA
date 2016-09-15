<%@taglib uri="/struts-tags" prefix="s"%>

<s:form action="Login">
    <s:textfield name="usuario" label="Usuario"/>
    <s:password name="clave" label="Clave"/>
    <s:submit/>
</s:form>
