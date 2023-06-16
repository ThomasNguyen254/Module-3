
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Customer detail</h1>
<p>
    <a href="/product" class="btn btn-info ms-1">Back to product list</a>
</p>
<table class="table-bordered">
    <tr>
        <td>Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Manufacturer:</td>
        <td>${product.getManufacturer()}</td>
    </tr>
</table>
</body>
</html>
