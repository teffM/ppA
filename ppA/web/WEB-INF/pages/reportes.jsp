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
    <title></title>
</head>

<h2><s:text name="re.legend" /></h2>
<hr/>
<div class="container">
    <div class="row">
        <s:form id="form" action="Reportes">

            <div  class="panel panel-primary col-md-12" style="padding: 0;">
                <div class="panel-heading">Reporte general:</div>
                <div class="panel-body">
                    <p>Reporte general de las reservaciones del sistema. Mostrando datos 
                        con información de todos los registros.</p>
                </div>
                <div class="panel-footer">
                    <s:submit method="mostrarReporte" cssClass="btn btn-default" key="Generar" />
                </div>

            </div>
            <div  class="panel panel-primary col-md-12" style="padding: 0;">
                <div class="panel-heading">Reporte por estados:</div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <p>
                            Reporte general de las reservaciones del sistema. Mostrando datos 
                            con información de todos los registros filtrados por el estado de la reserva.
                        </p>
                    </div>
                    <div class="col-md-6">
                        <s:select id="criEst" name="estado" listKey="estado" listValue="estado" headerKey="" cssClass="select2 required input"
                                  headerValue="%{getText('lbl.seleccione')}" list="listEstados" key="r.estado" required="true"/>
                    </div>
                </div>
                <div class="panel-footer">
                    <s:submit method="mostrarReporte_estado" cssClass="btn btn-default" key="Generar" />
                </div>
            </div>

            <div  class="panel panel-primary col-md-12" style="padding: 0;">
                <div class="panel-heading">Reporte por rango de fechas:</div>


                <div class="panel-body">
                    <div class="col-md-6">
                        <p>
                            Reporte general de las reservaciones del sistema. Mostrando datos 
                            con información de todos los registros filtrados por el estado de la reserva.
                        </p>
                    </div>
                     <div class="col-md-6">
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
                       </div>
                </div>
                <div class="panel-footer">
                    <s:submit method="mostrarReporte_fecha" cssClass="btn btn-default" key="Generar" />
                </div>
            </div>

            <div  class="panel panel-primary col-md-12" style="padding: 0;">
                <div class="panel-heading">Reporte por clientes:</div>

                <div class="panel-body">
                    <div class="col-md-6">
                        <p>
                            Reporte general de las reservaciones del sistema. Mostrando datos 
                            con información de todos los registros filtrados por el estado de la reserva.
                        </p>
                    </div>
                    <div class="col-md-6">
                        <s:select id="criCli" name="idCliente" listKey="id" listValue="%{dui+' '+nombre + ' ' +  apellido}" headerKey=""
                                  cssClass="select2 required" headerValue="%{getText('lbl.seleccione')}"
                                  list="listClientes" key="r.cliente" required="true" />
                    </div>
                </div>
                <div class="panel-footer">
                    <s:submit method="mostrarReporte_cliente" cssClass="btn btn-default" key="Generar" />
                </div>
            </div>   
        </s:form>
    </div>              



</div> 