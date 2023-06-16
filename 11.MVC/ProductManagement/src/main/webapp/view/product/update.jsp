
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
    <a class="btn-close" href="/product">Back to customer list</a>
</p>
<form method="post" action="/product?action=edit">
    <fieldset>
        <legend>Product information</legend>
        <input type="hidden" name="id" value="${product.id}">
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" value="${product.name}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" value="${product.price}"></td>
            </tr>
            <tr>
                <td>Manufacturer: </td>
                <td><input type="text" name="manufacturer" value="${product.manufacturer}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>