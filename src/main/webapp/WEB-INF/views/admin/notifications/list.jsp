<%-- 
    Document   : list
    Created on : Jun 14, 2025, 01:57 AM
    Author     : ADMIN
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-content">
    <h1 class="mb-4">Notification</h1>
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">Notification List</h3>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div></div> <!-- Placeholder để căn chỉnh -->
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Mã Thông báo</th>
                        <th>Người dùng</th>
                        <th>Hoạt động</th>
                        <th>Nội dung</th>
                        <th>Ngày gửi</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="n" items="${notifications}">
                        <tr>
                            <td>${n.maThongBao}</td>
                            <td>${n.nguoiDung.tenNguoiDung}</td>
                            <td>${n.hoatDong != null ? n.hoatDong.tieuDe : 'N/A'}</td>
                            <td>${n.noiDung}</td>
                            <td>${n.ngayGui}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/notifications/edit/${n.maThongBao}" class="btn btn-sm btn-primary">Sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/notifications/delete/${n.maThongBao}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty notifications}">
                        <tr><td colspan="6" class="text-center">Không có dữ liệu.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>