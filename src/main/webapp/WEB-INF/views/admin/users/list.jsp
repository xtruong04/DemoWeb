<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-content">
    <h1 class="mb-4">Users</h1>
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">User List</h3>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div></div> <!-- Placeholder để căn chỉnh -->
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Mã Người Dùng</th>
                        <th>Email</th>
                        <th>Tên</th>
                        <th>Vai Trò</th>
                        <th>Số Điện Thoại</th>
                        <th>Địa Chỉ</th>
                        <th>Ngôn Ngữ Ưu Tiên</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td>${u.maNguoiDung}</td>
                            <td>${u.email}</td>
                            <td>${u.tenNguoiDung}</td>
                            <td>${u.vaiTro}</td>
                            <td>${u.soDienThoai}</td>
                            <td>${u.diaChi}</td>
                            <td>${u.ngonNguUuTien}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/users/edit/${u.maNguoiDung}" class="btn btn-sm btn-primary">Sửa</a>
                                <a href="${pageContext.request.contextPath}/users/delete/${u.maNguoiDung}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>