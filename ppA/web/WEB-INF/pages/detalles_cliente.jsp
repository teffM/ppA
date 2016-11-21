<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="page-header">
    <h1 style="margin:0">Detalles cliente
        <div class="button-group  pull-right">
            <a href="Detalles!obtener?id=<c:out value="${id}"/>" class="btn btn-success" >
                <span class="glyphicon glyphicon-refresh"></span>
                <b>Refrescar</b>
            </a>
            <a href="Cliente" class="btn btn-warning" >
                <span class="glyphicon glyphicon-arrow-left"></span>
                <b>Regresar</b>
            </a>
        </div>
    </h1>
</div>
<div class="row">


    <div class="col-md-6">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><h3>Cliente <small>Datos generales</small></h3></div>
            <!-- List group -->
            <ul class="list-group">

                <li class="list-group-item"><b><s:text name="c.dui" /></b> <c:out value="${cli.dui}"/></li>
                <li class="list-group-item"><b><s:text name="c.nit" /></b> <c:out value="${cli.nit}"/></li>

                <li class="list-group-item"><b><s:text name="c.nombre" /></b> <c:out value="${cli.nombre}"/> </li>
                <li class="list-group-item"><b><s:text name="c.apellido" /></b> <c:out value="${cli.apellido}"/></li>
                <li class="list-group-item"><b><s:text name="c.telefono" /></b> <c:out value="${cli.telefono}"/></li>
                <li class="list-group-item"><b><s:text name="c.correo" /></b> <c:out value="${cli.correo}"/></li>

            </ul>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>Abonos <small>Hechos por el cliente</small>

                </h3>


            </div>

            <table class="table table-responsive table-hover table-bordered table-condensed  table-striped dataTable2">

                <thead>
                    <tr>
                        <th>#</th>

                        <th>Fecha</th>
                        <th>Monto</th>

                        <th data-priority="1"><s:text name="q.acciones" /></th>
                    </tr>
                </thead>
                <tbody>
                    <s:set var="counter" value="0"/>
                    <c:forEach var="l" items="${cli.abonoses}">
                        <tr>

                            <s:set var="counter" value="%{#counter+1}"/> 
                            <td><s:property value="#counter"/></td>     


                            <fmt:formatDate value="${l.fechaAbono}" var="fechaAbono"
                                            pattern="dd/MM/yyyy hh:mm a" />

                            <td><c:out value="${fechaAbono}"/></td>
                            <td>$<c:out value="${l.abono}"/></td>
                            <td>

                                <a class="" href="Detalles!obtener?id=${l.reservaciones.id}">
                                    ver Detalles
                                </a>

                            </td>
                        </tr>
                    </c:forEach>


                </tbody>

            </table>
        </div>



    </div>


</div>

<div>
    <div class="panel panel-default">
        <!-- Default panel contents -->


        <div class="panel-heading">


            <h3>Reservas

            </h3>

        </div>


        <table class="table table-responsive table-hover table-bordered table-condensed  table-striped dataTable2">
            <thead>
                <tr>
                <tr>
                    <th data-priority="1">#</th>
                    <th><s:text name="r.fechaCreacion" /></th>
                    <th><s:text name="r.fechaReserva" /></th>
                    <th><s:text name="r.sucursal" /></th>
                    <th><s:text name="r.persona" /></th>

                    <th data-priority="1"><s:text name="q.acciones" /></th>
                    <th><s:text name="r.estado" /></th>
                </tr>
                </tr>
            </thead>
            <tbody>
                <s:set var="counter" value="0"/>
                <c:forEach var="l" items="${cli.reservacioneses}">
                    <tr>

                        <s:set var="counter" value="%{#counter+1}"/> 
                        <td><s:property value="#counter"/></td>  
                        <fmt:formatDate value="${l.fechaReservacion}" var="fechaReserva"
                                        pattern="dd/MM/yyyy hh:mm a" />
                        <fmt:formatDate value="${l.fechaCreacion}" var="fechaCreacion"
                                        pattern="dd/MM/yyyy hh:mm a" />



                        <td><c:out value="${fechaCreacion}"/></td>
                        <td><c:out value="${fechaReserva}"/></td>
                        <td><c:out value="${l.sucursales.sucursal}"/></td>
                        <td><c:out value="${l.numPersonas}"/></td>
                        <td>

                            <a class="" href="Detalles!obtener?id=${l.id}">
                                ver Detalles
                            </a>

                        </td>
                        <td style="background-color: <c:out value="${l.estados.color}"/>;"><c:out value="${l.estados.estado}"/></td>




                        </td>
                    </tr>
                </c:forEach>

            </tbody>

        </table>

    </div> 
</div> 



