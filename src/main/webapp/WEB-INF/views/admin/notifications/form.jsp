<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${notification.maThongBao != null}">
                Edit Notification
            </c:when>
            <c:otherwise>
                Add New Notification
            </c:otherwise>
        </c:choose>
    </h3>
    <form:form modelAttribute="notification" method="post" cssClass="needs-validation">
        <form:hidden path="maThongBao" />
        <div class="mb-3">
            <form:label path="nguoiDung.maNguoiDung" cssClass="form-label">Ng??i dùng</form:label>
            <form:select path="nguoiDung.maNguoiDung" cssClass="form-select" required="true">
                <c:forEach items="${users}" var="user">
                    <form:option value="${user.maNguoiDung}">${user.tenNguoiDung}</form:option>
                </c:forEach>
            </form:select>
            <div class="invalid-feedback">Please select a user.</div>
        </div>
        <div class="mb-3">
            <form:label path="hoatDong.maHoatDong" cssClass="form-label">Ho?t ??ng</form:label>
            <form:select path="hoatDong.maHoatDong" cssClass="form-select">
                <form:option value="">Ch?n ho?t ??ng</form:option>
                <c:forEach items="${activities}" var="activity">
                    <form:option value="${activity.maHoatDong}">${activity.tieuDe}</form:option>
                </c:forEach>
            </form:select>
            <div class="invalid-feedback">Please select an activity (optional).</div>
        </div>
        <div class="mb-3">
            <form:label path="noiDung" cssClass="form-label">N?i dung</form:label>
            <form:textarea path="noiDung" cssClass="form-control" required="true"/>
            <div class="invalid-feedback">Please enter the content.</div>
        </div>
        <div class="mb-3">
            <form:label path="ngayGui" cssClass="form-label">Ngày g?i</form:label>
            <form:input path="ngayGui" cssClass="form-control" type="datetime-local" required="true"/>
            <div class="invalid-feedback">Please enter the date and time.</div>
        </div>
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${notification.maThongBao != null}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/admin/notifications' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>