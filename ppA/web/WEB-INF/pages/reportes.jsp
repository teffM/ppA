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
    <fieldset>
                    <legend><s:text name="re.legend" /></legend>
                    
              
    <s:form action="Reportes">
           <img id="logo" src="./r/reportes/login.png" alt=""/>
        <h1>Diversidad de reportes de La Pampa</h1>
        <s:submit method="mostrarReporte" cssClass="btn-info disabled submit" key="Reporte General" />
     
        </s:form>
    
  </fieldset>
