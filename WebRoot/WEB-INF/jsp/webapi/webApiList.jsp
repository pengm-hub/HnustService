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
<html>
<head>
    <title>WebApi</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
<%@include file="/common/utop.jsp"%>

<!--webapiList-->
<div class="width1200 center_yh hidden_yh" style="margin-top: 25px;">

    <h4>共有${pagers.total}条数据</h4>
    <ul class="">
        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
            <li>
                <a href="${ctx}/webapi/webApiView?id=${data.api_id}" ><h1 class="spName">${data.api_name}</h1></a>

            </li>
        </c:forEach>
    </ul>
</div>

<%@include file="/common/ufooter.jsp"%>
</body>
</html>
