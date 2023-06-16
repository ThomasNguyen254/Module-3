<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="../../header.jsp"></c:import>
<body>
<c:import url="../../navbar.jsp"></c:import>
<div style="margin-left: 300px">
    <h2>Trang thêm mới</h2>
    <p>${mess}</p>
    <form action="/product?action=add" method="post">
        <input name="name" oninput="checkName()" required placeholder="nhập tên" id="name"><br>
        <small id="nameError" style="color: red"></small>
        <input name="price" placeholder="Nhập price"><br>
        <input name="manufacturer" placeholder="Nhập manufacturer"><br>
        <button type="submit">Save</button>
    </form>
    <script>
        function checkName() {
            let name = document.getElementById("name").value;
            if (name.length < 6) {
                document.getElementById("nameError").innerText = "Tên quá ngắn";
            } else {
                document.getElementById("nameError").innerText = "";
            }
        }
    </script>
</div>
</body>
</html>