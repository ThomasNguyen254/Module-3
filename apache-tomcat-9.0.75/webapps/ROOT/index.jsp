<%--
  Created by IntelliJ IDEA.
  User: thomasnguyen
  Date: 30/05/2023
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/ProductDiscountCalculator" method="post">
    <input type="text" name="p_Description" placeholder="Product Description">
    <input type="text" name="ListPrice" placeholder="List Price">
    <input type="text" name="DiscountPercent" placeholder="Discount Percent">
    <button type="submit">Calculate Discount</button>
  </form>
  </body>
</html>
