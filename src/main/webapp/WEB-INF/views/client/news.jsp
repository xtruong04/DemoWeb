<%-- 
    Document   : news
    Created on : Jun 25, 2025, 12:11:12 PM
    Author     : ADMIN
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="news__area section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section_title text-center mb-55">
                    <h3><span>News & Updates</span></h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="news_active owl-carousel">
                    <c:forEach var="news" items="${newsList}">
                        <div class="single__blog d-flex align-items-center">
                            <div class="thum">
                                <img src="${pageContext.request.contextPath}/${news.imageUrl}" alt="">
                            </div>
                            <div class="newsinfo">
                                <span>${news.date}</span>
                                <a href="${news.link}">
                                    <h3>${news.title}</h3>
                                </a>
                                <p>${news.description}</p>
                                <a class="read_more" href="${news.link}">Read More</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>