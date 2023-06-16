<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="../../header.jsp"></c:import>
<body>
<c:import url="../../navbar.jsp"></c:import>
<h1>Trang danh sách sản phẩm </h1>
<a class="btn btn-primary" href="/product?action=add">Thêm mới</a>
<p style="color: red">${mess}</p>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Manufacturer</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="p" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${p.getId()}</td>
            <td>
                <a href="product?action=view&id=${p.getId()}">${p.getName()} </a>
            </td>
            <td>${p.getPrice()}</td>
            <td>${p.getManufacturer()}</td>
            <td>
                <button type="button" onclick="showInfoDelete('${p.getId()}','${p.getName()}')" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td>
                <div class="d-flex justify-content-center align-items-center">
                    <a class="btn btn-success" href="/product?action=edit&id=${p.getId()}">Edit</a>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/product?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="id" id="id">
                    <span>Bạn có muốn xoá </span> <span id="name"></span>
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

<p>${myDate}</p>
<p><fmt:formatDate value="${myDate}" pattern="dd/MM/yyyy"></fmt:formatDate></p>
</body>
</html>