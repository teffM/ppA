<%@taglib uri="/struts-tags" prefix="s"%>
<center class="bgLogin">
    <b>Ingrese usuario y contraseña</b>
    <s:form action="Login">
        <s:textfield name="usuario" label="Usuario"/>
        <s:password name="clave" label="Clave"/>
        <s:submit cssClass="btn-info disabled" key="btn.ingresar" />
    </s:form>
</center>
<script>
    $(document).ready(function () {
        $(".myContainer").css("background-color", "transparent");
    });
</script>