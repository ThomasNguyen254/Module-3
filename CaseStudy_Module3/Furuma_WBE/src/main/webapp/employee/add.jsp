<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="header_employee.jsp"></c:import>
<body>
<c:import url="navbar_employee.jsp"></c:import>
<div style="margin-left: 300px">
    <h2>Trang thêm mới</h2>
    <p>${mess}</p>
    <form action="/employee?action=add" method="post">
        <%--        <input name="id" placeholder="Nhập id"><br>--%>
        <input name="name" oninput="checkName()" required placeholder="nhập tên" id="name"><br>
        <small id="nameError" style="color: red"></small>
        <input name="birthday" placeholder="Nhập birthday"><br>
        <input name="id_card" placeholder="Nhập id card"><br>
        <input name="salary" placeholder="Nhập salary"><br>
        <input name="phone" placeholder="Nhập phone"><br>
        <input name="email" placeholder="Nhập email"><br>
        <input name="address" placeholder="Nhập address"><br>
        <input name="position_id" placeholder="Nhập position id"><br>
        <input name="education_degree_id" placeholder="Nhập education degree id"><br>
        <input name="division_id" placeholder="Nhập division_id"><br>
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