<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page-header">
    <h1 style="margin:0">
        Registro
    </h1>
</div>
<div class="container">    
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
        <div class="panel panel-info" >
            <div class="panel-heading">
                <div class="panel-title"><s:text name="nu.legend" /></div>
            </div>     
            <div style="padding-top:30px" class="panel-body" >
                <s:form action="Registro">
                    <s:hidden name="nu.id" />
                    <div class="form-group">
                        <s:textfield name="nu.nombre" key="nu.nombre" cssClass="form-control required" required="true" />
                    </div>
                    <div class="form-group">
                        <s:textfield name="nu.apellido" key="nu.apellido" cssClass="form-control required" required="true" />
                    </div>
                    <div class="form-group">
                        <s:textfield name="nu.usuario" key="nu.usuario" cssClass="form-control required" required="true" />
                    </div>

                    <div class="form-group">
                        <s:password name="nu.clave" key="nu.clave" cssClass="form-control required" required="true" />
                    </div>
                    <s:submit method="registrar" cssClass="btn btn-default" value="Registrar" key="btn.guardar" />
                </s:form>
            </div>
        </div>
    </div>
</div>