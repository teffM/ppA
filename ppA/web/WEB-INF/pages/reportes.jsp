<%-- 
    Document   : index
    Created on : 26/09/2013, 03:32:39 PM
    Author     : Unknown
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

                    <legend><s:text name="re.legend" /></legend>
                    
<div class="container">    
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
        <div class="panel panel-info" >
            <div class="panel-heading">
                <div class="panel-title">Reportes</div>
            </div>     
            <div style="padding-top:30px" class="panel-body" >
                <center>
                    <img id="logo" src="./r/images/login.png" alt=""/>
                </center>
                <br/>              
<s:form id="form" action="Reportes">
           
        <h1>Diversidad de reportes La Pampa</h1>
        
        <label>Reporte general:</label>
    <s:submit method="mostrarReporte" cssClass="btn btn-default" key="Mostrar" />
    
         <label>Reporte por estados:</label>
         <s:select id="criEst" name="estado" listKey="estado" listValue="estado" headerKey="" cssClass="select2 required input"
              headerValue="%{getText('lbl.seleccione')}" list="listEstados" key="r.estado" required="true"/>
        <br/>
    <s:submit method="mostrarReporte_estado" cssClass="btn btn-default" key="Reporte de estados" />
     
    <div class="form-group">
    <label>Fecha inicio:</label>
          <s:date name="fecha_inicio" id="createdDateId" format="dd/MM/yyyy" />
    <s:textfield name="fecha_inicio" 
                 value="%{createdDateId}" cssClass="form-control dateTime required" required="true" />
     
        <label>Fecha fin:</label>
    <s:date name="fecha_fin" id="createdDateId" format="dd/MM/yyyy" />
    <s:textfield name="fecha_fin" 
                 value="%{createdDateId}" cssClass="form-control dateTime required" required="true" />
      </div>
            <br/>
    <s:submit method="mostrarReporte_fecha" cssClass="btn btn-default" key="Reporte por fechas" />
    <label>Reporte por clientes:</label>
    <s:select id="criCli" name="idCliente" listKey="id" listValue="%{dui+' '+nombre + ' ' +  apellido}" headerKey=""
                                      cssClass="select2 required" headerValue="%{getText('lbl.seleccione')}"
                                      list="listClientes" key="r.cliente" required="true" />
        <br/>
    <s:submit method="mostrarReporte_cliente" cssClass="btn btn-default" key="Reporte de clientes" />

</s:form>
    

  </div>
        </div>
    </div> 
</div> 