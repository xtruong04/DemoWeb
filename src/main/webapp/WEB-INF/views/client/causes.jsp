<%-- 
    Document   : causes
    Created on : Jun 25, 2025, 12:10:30 PM
    Author     : ADMIN
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="popular_causes_area section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section_title text-center mb-55">
                    <h3><span>Popular Causes</span></h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="causes_active owl-carousel">
                    <c:forEach var="cause" items="${causes}">
                        <div class="single_cause">
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/${cause.imageUrl}" alt="">
                            </div>
                            <div class="causes_content">
                                <div class="custom_progress_bar">
                                    <div class="progress">
                                        <div class="progress-bar"
                                             role="progressbar"
                                             style="width: ${cause.raised / cause.goal * 100}%"
                                             aria-valuenow="${cause.raised / cause.goal * 100}"
                                             aria-valuemin="0"
                                             aria-valuemax="100">

                                            <span class="progres_count">
                                                <fmt:formatNumber value="${cause.raised / cause.goal * 100}" maxFractionDigits="0"/>%
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="balance d-flex justify-content-between align-items-center">
                                    <span>Raised: $${cause.raised}</span>
                                    <span>Goal: $${cause.goal}</span>
                                </div>
                                <h4>${cause.title}</h4>
                                <p>${cause.description}</p>
                                <a class="read_more" href="${pageContext.request.contextPath}/cause_details.html">Read More</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>