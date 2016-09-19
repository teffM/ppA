<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a id="nuevaReserva" href="#" class="btn btn-info btn-lg">
    <span class="glyphicon glyphicon-plus-sign"></span>
    <b> Nueva Reservación</b>
</a>
<div id="nuevaReservacion">
    <s:form action="Reserva">
        <s:textfield name="r.nombres" label="Nombre: " />
        <s:select name="r.idSucursal" headerKey="-1"
                    headerValue="--- Seleccione una sucursal ---" list="{'apple','banana','grape','pear'}" />
        <s:submit method="agregar" cssClass="btn-info" value="Guardar" />
    </s:form>
</div>

<div id="container">
    <c:forEach var="l" items="${listReservas}">
        <c:out value="${l.nombres}"/> <br/>
    </c:forEach>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#nuevaReservacion").hide();
        $("#nuevaReserva").click(function () {
            if ($("#nuevaReservacion").is(":visible")) {
                $("#Reserva")[0].reset();
                $("#nuevaReserva > b").text(" Nueva Reservación");
                $("#nuevaReservacion").hide();
            } else {
                $("#nuevaReserva > b").text(" Cancelar");
                $("#nuevaReservacion").show();
            }
        });
    });
</script>