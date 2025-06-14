<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-content">
    <h1 class="mb-4">Users</h1>
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">User List</h3>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div></div>
                <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-success">+ Add New</a>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Language</th>
                        <th>Actions</th>
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
                                <a href="${pageContext.request.contextPath}/admin/users/edit/${u.maNguoiDung}" class="btn btn-sm btn-primary">Edit</a>
                                <a href="${pageContext.request.contextPath}/admin/users/delete/${u.maNguoiDung}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>