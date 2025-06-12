<%-- 
    Document   : list
    Created on : Jun 11, 2025, 2:27:07 PM
    Author     : ADMIN
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-content">
    <h1 class="mb-4">Templates</h1>
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">Template List</h3>
            <table class="table table-hover">
                <thead>
                    <tr>
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
        </div>
    </div>
</div>


