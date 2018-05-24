<%@taglib uri="/struts-tags" prefix="s"%>

<div class="container">    
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
        <div class="panel panel-info" >
            <div class="panel-heading">
                <div class="panel-title">Iniciar sesión</div>
            </div>     
            <div style="padding-top:30px" class="panel-body" >
                <center>
                    <img id="logo" src="./r/images/login.png" alt=""/>
                </center>
                <br/>
                <s:form id="form"  action="Login">
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <s:textfield cssClass="form-control input" name="usuario"  placeholder="Usuario" />
                    </div>
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <s:password cssClass="form-control input" name="clave"  placeholder="Contraseña" />
                    </div>

                    <s:submit cssClass="btn btn-default" key="btn.ingresar" />
                </s:form>
            </div>
            <div>
                <a href="./Registro">Registrarse.</a></li>
            </div>
        </div>
    </div> 
</div> 
<script>
    $(document).ready(function () {
        $(".myContainer").css("background-color", "transparent");
    });
</script>