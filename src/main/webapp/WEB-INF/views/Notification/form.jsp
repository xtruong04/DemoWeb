<!-- /WEB-INF/views/notifications/form.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-4">
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
            <form:label path="nguoiDung" cssClass="form-label">User</form:label>
            <form:select path="nguoiDung.maNguoiDung" cssClass="form-select" required="true">
                <c:forEach items="${users}" var="user">
                    <form:option value="${user.maNguoiDung}">${user.tenNguoiDung} (${user.email})</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="hoatDong" cssClass="form-label">Activity</form:label>
            <form:select path="hoatDong.maHoatDong" cssClass="form-select">
                <form:option value="">-- None --</form:option>
                <c:forEach items="${activities}" var="activity">
                    <form:option value="${activity.maHoatDong}">${activity.tieuDe}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="noiDung" cssClass="form-label">Message</form:label>
            <form:textarea path="noiDung" cssClass="form-control" required="true"/>
        </div>
        <div class="mb-3">
            <form:label path="ngayGui" cssClass="form-label">Sent At</form:label>
            <form:input path="ngayGui" cssClass="form-control" type="datetime-local"/>
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
        <a href="<c:url value='/notifications' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>