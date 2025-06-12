<!-- /WEB-INF/views/notifications/list.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Notifications</h2>
    <a href="${pageContext.request.contextPath}/notifications/add" class="btn btn-success">+ Thêm mới</a>
</div>
<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>Mã Thông Báo</th>
            <th>Người Dùng</th>
            <th>Hoạt Động</th>
            <th>Nội Dung</th>
            <th>Ngày Gửi</th>
            <th>Hành Động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="n" items="${notifications}">
            <tr>
                <td>${n.maThongBao}</td>
                <td>${n.nguoiDung.tenNguoiDung} (${n.nguoiDung.email})</td>
                <td>${n.hoatDong != null ? n.hoatDong.tieuDe : 'Không có'}</td>
                <td>${n.noiDung}</td>
                <td>${n.ngayGui}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/notifications/edit/${n.maThongBao}" class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/notifications/delete/${n.maThongBao}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>