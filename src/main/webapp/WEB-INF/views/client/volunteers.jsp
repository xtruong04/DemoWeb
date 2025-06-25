<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="our_volunteer_area section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section_title text-center mb-55">
                    <h3><span>Our Volunteer</span></h3>
                </div>
            </div>
        </div>

        <c:forEach var="i" begin="0" end="${fn:length(volunteers) - 1}" step="2">
            <div class="row justify-content-center mb-4">
                <!-- Thành viên thứ i -->
                <c:set var="v1" value="${volunteers[i]}" />
                <div class="col-lg-5 col-md-6">
                    <div class="single_volenteer">
                        <div class="volenteer_thumb">
                            <img src="${pageContext.request.contextPath}/${v1.imageUrl}" alt="">
                        </div>
                        <div class="voolenteer_info d-flex align-items-end">
                            <div class="social_links">
                                <ul>
                                    <li><a href="${v1.facebookUrl}"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="${v1.pinterestUrl}"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="${v1.linkedinUrl}"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="${v1.twitterUrl}"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                            <div class="info_inner">
                                <h4>${v1.name}</h4>
                                <p>${v1.role}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Thành viên thứ i + 1 (nếu có) -->
                <c:if test="${i + 1 < fn:length(volunteers)}">
                    <c:set var="v2" value="${volunteers[i + 1]}" />
                    <div class="col-lg-5 col-md-6">
                        <div class="single_volenteer">
                            <div class="volenteer_thumb">
                                <img src="${pageContext.request.contextPath}/${v2.imageUrl}" alt="">
                            </div>
                            <div class="voolenteer_info d-flex align-items-end">
                                <div class="social_links">
                                    <ul>
                                        <li><a href="${v2.facebookUrl}"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="${v2.pinterestUrl}"><i class="fa fa-pinterest"></i></a></li>
                                        <li><a href="${v2.linkedinUrl}"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="${v2.twitterUrl}"><i class="fa fa-twitter"></i></a></li>
                                    </ul>
                                </div>
                                <div class="info_inner">
                                    <h4>${v2.name}</h4>
                                    <p>${v2.role}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>

<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
