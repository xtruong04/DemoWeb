<%-- 
    Document   : reasons
    Created on : Jun 25, 2025, 12:09:43 PM
    Author     : ADMIN
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="reson_area section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section_title text-center mb-55">
                    <h3><span>Reason of Helping</span></h3>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <c:forEach var="reason" items="${reasons}">
                <div class="col-lg-4 col-md-6">
                    <div class="single_reson">
                        <div class="thum">
                            <div class="thum_1">
                                <img src="${pageContext.request.contextPath}/${reason.imageUrl}" alt="">
                            </div>
                        </div>
                        <div class="help_content">
                            <h4>${reason.title}</h4>
                            <p>${reason.description}</p>
                            <a href="#" class="read_more">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>