<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="header.jsp"></c:import>
<body>
<c:import url="navbar.jsp"></c:import>
<h1>List Customer</h1>
<table class="table table-dark table-striped">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Address</th>
        <th>Img</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <td>${customer.getName()}</td>
        <td>${customer.getBirthday()}</td>
        <td>${customer.getAddress()}</td>
        <td>${customer.getImg()}</td>
        <td><button class="btn btn-danger">Delete</button></td>
    </tr>
    </c:forEach>
</table>
<p>${myDate}</p>
<p><fmt:formatDate value="${myDate}" pattern="dd/MM/yyyy"></fmt:formatDate></p>
</body>
</html>
