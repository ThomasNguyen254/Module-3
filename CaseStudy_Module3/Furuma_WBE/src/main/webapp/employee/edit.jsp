
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.css">
</head>
<body>
<p>
    <a class="btn-close" href="/employee">Back to employee list</a>
</p>
<form method="post" action="/employee?action=edit">
    <fieldset>
        <legend>Employee information</legend>
        <input type="hidden" name="id" value="${employee.id}">
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" value="${employee.name}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="birthday" value="${employee.birthday}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="id_card" value="${employee.id_card}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="salary" value="${employee.salary}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="phone" value="${employee.phone}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="email" value="${employee.email}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="address" value="${employee.address}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="position_id" value="${employee.position_id}"></td>
            </tr>
            <tr>
                <td>Manufacturer: </td>
                <td><input type="text" name="education_degree_id" value="${employee.education_degree_id}"></td>
            </tr>
            <tr>
                <td>Manufacturer: </td>
                <td><input type="text" name="division_id" value="${employee.division_id}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update employee"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>