<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="l" items="${listReservas}">
    <c:out value="${l.nombres}"/> <br/>
</c:forEach>