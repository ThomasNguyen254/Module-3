<%--
  Created by IntelliJ IDEA.
  User: thomasnguyen
  Date: 30/05/2023
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%
    double ListPrice = Double.parseDouble(request.getParameter("ListPrice"));
    double DiscountPercent = Double.parseDouble(request.getParameter("DiscountPercent"));
    double DiscountAmount = ListPrice+DiscountPercent;
%>
<h1> Ket qua: <%=DiscountAmount%></h1>
</body>
</html>
