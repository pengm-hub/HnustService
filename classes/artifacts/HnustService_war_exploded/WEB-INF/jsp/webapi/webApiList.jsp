<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/3/23
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta character="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="${ctx}/resource/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="${ctx}/resource/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="${ctx}/resource/css/magnific-popup.css">
    <link rel="stylesheet" href="${ctx}/resource/css/select2.min.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">

    <title>Web Service</title>

</head>
<body>
<!-- header -->
<%@include file="/common/utop.jsp"%>

<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <div class="row">
            <!-- main title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>Web APIs</h2>

                    <span class="main__title-stat">${pagers.total} total</span>

                    <div class="main__title-wrap">
                        <!-- search -->
                        <form action="${ctx}/webapi/webApiList" class="main__title-form">
                            <input type="text" placeholder="Find Web APIs .." name="searchWebApi">
                            <button type="submit">
                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="8.25998" cy="8.25995" r="7.48191" stroke="#2F80ED" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></circle><path d="M13.4637 13.8523L16.3971 16.778" stroke="#2F80ED" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                            </button>
                        </form>
                        <!-- end search -->
                    </div>
                </div>
            </div>
            <!-- end main title -->

            <!-- users -->
            <div class="col-12">
                <div class="main__table-wrap">
                    <table class="main__table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>API NAME</th>
                            <th>CATEGORY</th>
                            <th>TAGS</th>
                            <th>FOLLOWERS</th>
<%--                            <c:if test="${pagers.datas.get(0).api_score != 0}">--%>
<%--                                <th>Scores</th>--%>
<%--                            </c:if>--%>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
                            <div>
                                <tr>
                                    <td><div class="main__table-text main__table-text--green">${data.api_id}</div></td>
                                    <td><div class="main__table-text"><a href="${ctx}/webapi/webApiView?id=${data.api_id}">${data.api_name}</a></div></td>
                                    <td><div class="main__table-text">${data.api_category}</div></td>
                                    <c:if test="${data.api_tags==null}">
                                        <td><div class="main__table-text">NULL</div></td>
                                    </c:if>
                                    <c:if test="${data.api_tags!=null}">
                                        <td><div class="main__table-text">${data.api_tags}</div></td>
                                    </c:if>
                                    <td><div class="main__table-text">${data.api_followers}</div></td>
<%--                                    <c:if test="${pagers.datas.get(0).api_score != 0}">--%>
<%--                                        <th>${data.api_score}</th>--%>
<%--                                    </c:if>--%>
    <%--                                <td><div class="main__table-text" style="text-overflow:ellipsis;white-space:nowrap">${data.api_describe}</div></td>--%>
<%--                                    <td>--%>
<%--                                        <div class="main__table-btns">--%>
<%--                                            <a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">--%>
<%--                                                <svg t="1620354789331" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7235" width="200" height="200"><path d="M581.674667 170.666667c6.72 0 18.538667 1.429333 27.584 4.352 44.544 14.442667 70.186667 61.76 59.797333 109.12l-1.066667 4.437333-39.701333 148.906667h157.269333c19.093333 0 37.973333 7.082667 50.773334 21.248 14.293333 15.829333 19.861333 36.778667 15.616 57.109333l-1.066667 4.352-82.922667 295.253333a51.882667 51.882667 0 0 1-46.08 37.76l-3.84 0.128H298.666667V452.501333c84.949333-18.389333 209.194667-244.373333 209.194666-244.373333C525.525333 184.170667 546.944 170.666667 581.674667 170.666667zM234.666667 448v405.333333H170.666667V448h64z" p-id="7236" fill="#d81e06"></path></svg>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
                                </tr>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- end users -->

            <!-- paginator -->
    <div class="col-12">
        <div class="paginator">
                    <!--分页开始-->
                <pg:pager url="${ctx}/webapi/webApiList" maxIndexPages="20" items="${pagers.total}" maxPageItems="20" export="curPage=pageNumber">

                    <ul class="paginator__paginator">
                    <pg:first>
                        <a href="${pageUrl}">首页</a>
                    </pg:first>
                    <pg:prev>
                        <li><a href="${pageUrl}"><svg width="14" height="11" viewBox="0 0 14 11" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0.75 5.36475L13.1992 5.36475" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M5.771 10.1271L0.749878 5.36496L5.771 0.602051" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path></svg></a></li>
                    </pg:prev>
                    <pg:pages>
                        <c:choose>
                            <c:when test="${curPage eq pageNumber}">
                                <li><font color="red">[${pageNumber}]</font></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${pageUrl}">${pageNumber}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </pg:pages>
                    <pg:next>
                        <a href="${pageUrl}"><svg width="14" height="11" viewBox="0 0 14 11" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M13.1992 5.3645L0.75 5.3645" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M8.17822 0.602051L13.1993 5.36417L8.17822 10.1271" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path></svg></a>
                    </pg:next>
                    <pg:last>
                        <c:choose>
                            <c:when test="${curPage eq pageNumber}">
                                <font color="red">尾页</font>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageUrl}">尾页</a>
                            </c:otherwise>
                        </c:choose>
                    </pg:last>
                </pg:pager>
            </div>
        </div>
    </div>
</div>
</main>
<script src="${ctx}/resource/js/jquery-3.5.1.min.js"></script>
<script src="${ctx}/resource/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/resource/js/jquery.magnific-popup.min.js"></script>
<script src="${ctx}/resource/js/smooth-scrollbar.js"></script>
<script src="${ctx}/resource/js/select2.min.js"></script>
<script src="${ctx}/resource/js/admin.js"></script>
</body>
</html>
