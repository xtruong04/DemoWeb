<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
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
            <form:label path="nguoiDung.maNguoiDung" cssClass="form-label">User</form:label>
            <form:select path="nguoiDung.maNguoiDung" cssClass="form-select" required="true">
                <c:forEach items="${users}" var="user">
                    <form:option value="${user.maNguoiDung}">${user.tenNguoiDung}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="hoatDong.maHoatDong" cssClass="form-label">Activity</form:label>
            <form:select path="hoatDong.maHoatDong" cssClass="form-select" required="true">
                <c:forEach items="${activities}" var="activity">
                    <form:option value="${activity.maHoatDong}">${activity.tieuDe}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="diemSo" cssClass="form-label">Score</form:label>
            <form:input path="diemSo" cssClass="form-control" type="number" min="1" max="5" required="true"/>
        </div>
        <div class="mb-3">
            <form:label path="binhLuan" cssClass="form-label">Comment</form:label>
            <form:textarea path="binhLuan" cssClass="form-control"/>
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
        <a href="<c:url value='/admin/ratings' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>