<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Activities</h2>
    <a href="${pageContext.request.contextPath}/activities/add" class="btn btn-success">+ Thêm mới</a>
</div>
<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>Mã Hoạt động</th>
            <th>Tiêu đề</th>
            <th>Ngày giờ</th>
            <th>Địa điểm</th>
            <th>Số lượng tối đa</th>
            <th>Hình ảnh</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="a" items="${activities}">
            <tr>
                <td>${a.maHoatDong}</td>
                <td>${a.tieuDe}</td>
                <td>${a.ngayGio}</td>
                <td>${a.diaDiem}</td>
                <td>${a.soLuongToiDa}</td>
                <td>${a.hinhAnh}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/activities/edit/${a.maHoatDong}" class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/activities/delete/${a.maHoatDong}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>