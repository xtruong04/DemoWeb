<!-- /WEB-INF/views/ratings/form.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-4">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${rating.maDanhGia != null}">
                Edit Rating
            </c:when>
            <c:otherwise>
                Add New Rating
            </c:otherwise>
        </c:choose>
    </h3>
    <form:form modelAttribute="rating" method="post" cssClass="needs-validation">
        <form:hidden path="maDanhGia" />
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
            <form:select path="hoatDong.maHoatDong" cssClass="form-select" required="true">
                <c:forEach items="${activities}" var="activity">
                    <form:option value="${activity.maHoatDong}">${activity.tieuDe}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="diemDanhGia" cssClass="form-label">Rating (1-5)</form:label>
            <form:input path="diemDanhGia" cssClass="form-control" type="number" min="1" max="5" required="true"/>
        </div>
        <div class="mb-3">
            <form:label path="binhLuan" cssClass="form-label">Comment</form:label>
            <form:textarea path="binhLuan" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <form:label path="ngayTao" cssClass="form-label">Created At</form:label>
            <form:input path="ngayTao" cssClass="form-control" type="datetime-local"/>
        </div>
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${rating.maDanhGia != null}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/ratings' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>