<!-- /WEB-INF/views/registrations/list.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Registrations</h2>
    <a href="${pageContext.request.contextPath}/registrations/add" class="btn btn-success">+ Thêm mới</a>
</div>
<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>Mã Đăng Ký</th>
            <th>Người Dùng</th>
            <th>Hoạt Động</th>
            <th>Ngày Đăng Ký</th>
            <th>Trạng Thái Check-In</th>
            <th>Hành Động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="r" items="${registrations}">
            <tr>
                <td>${r.maDangKy}</td>
                <td>${r.nguoiDung.tenNguoiDung} (${r.nguoiDung.email})</td>
                <td>${r.hoatDong.tieuDe}</td>
                <td>${r.ngayDangKy}</td>
                <td>${r.trangThaiCheckIn ? 'Đã Check-In' : 'Chưa Check-In'}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/registrations/edit/${r.maDangKy}" class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/registrations/delete/${r.maDangKy}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>