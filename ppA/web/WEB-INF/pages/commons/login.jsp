<%@taglib uri="/struts-tags" prefix="s"%>

<center id="bgLogin">
    <img id="logo" src="./r/images/login.png" alt=""/>
    <s:form id="form"  action="Login">
        <s:textfield cssClass="form-control input" name="usuario"  placeholder="Usuario" />
        <s:password cssClass="form-control input"name="clave"  placeholder="Contraseña" />
        <s:submit cssClass="btn btn-default" key="btn.ingresar" />
    </s:form>
</center>
<script>
    $(document).ready(function () {
        $(".myContainer").css("background-color", "transparent");
    });
</script>