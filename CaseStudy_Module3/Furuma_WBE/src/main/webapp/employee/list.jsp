
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="header_employee.jsp"></c:import>
<body>
<c:import url="navbar_employee.jsp"></c:import>
<h1>Trang danh sách nhân viên </h1>
<a class="btn btn-primary" href="/employee?action=add">Thêm mới</a>
<p style="color: red">${mess}</p>
<table class="table table-dark">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Id Card</th>
        <th>Salary</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position Id</th>
        <th>Education Degree Id</th>
        <th>Division Id</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="employee" items="${employeeList}" varStatus="status">
        <tr>
            <td>${employee.getId()}</td>
            <td>${employee.getName()}</td>
            <td>${employee.getBirthday()}</td>
            <td>${employee.getId_card()}</td>
            <td>${employee.getSalary()}</td>
            <td>${employee.getPhone()}</td>
            <td>${employee.getEmail()}</td>
            <td>${employee.getAddress()}</td>
            <td>${employee.getPosition_id()}</td>
            <td>${employee.getEducation_degree_id()}</td>
            <td>${employee.getDivision_id()}</td>
            <td>
                <button type="button" onclick="showInfoDelete('${p.getId()}','${p.getName()}')" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td>
                <div class="d-flex justify-content-center align-items-center">
                    <a class="btn btn-success" href="/employee?action=edit&id=${p.getId()}">Edit</a>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/employee?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="id" id="id">
                    <span>Bạn có muốn xoá nhân viên :</span> <span id="name" style="color: red"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function showInfoDelete(id, name) {
        document.getElementById("name").innerText = name;
        document.getElementById("id").value = id;
    }
</script>
</body>
</html>
