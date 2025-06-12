<!-- /WEB-INF/views/ratings/list.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Ratings</h2>
    <a href="${pageContext.request.contextPath}/ratings/add" class="btn btn-success">+ Thêm mới</a>
</div>
<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>Mã Đánh Giá</th>
            <th>Người Dùng</th>
            <th>Hoạt Động</th>
            <th>Điểm Đánh Giá</th>
            <th>Bình Luận</th>
            <th>Ngày Tạo</th>
            <th>Hành Động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="r" items="${ratings}">
            <tr>
                <td>${r.maDanhGia}</td>
                <td>${r.nguoiDung.tenNguoiDung} (${r.nguoiDung.email})</td>
                <td>${r.hoatDong.tieuDe}</td>
                <td>${r.diemDanhGia}</td>
                <td>${r.binhLuan}</td>
                <td>${r.ngayTao}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/ratings/edit/${r.maDanhGia}" class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/ratings/delete/${r.maDanhGia}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>