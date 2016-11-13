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
           
        <h1>Diversidad de reportes de La Pampa</h1>
        <s:submit method="mostrarReporte" cssClass="btn-info disabled submit" key="Reporte General" />
      <s:select id="criEst" name="estado" listKey="estado" listValue="estado" headerKey="" cssClass="select2 required input"
                                      headerValue="%{getText('lbl.seleccione')}" list="listEstados" key="r.estado" required="true"/>
        <s:submit method="mostrarReporte_estado" cssClass="btn-info disabled submit" key="Reporte de estados" />
     
        </s:form>
    

  </div>
        </div>
    </div> 
</div> 