<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
    <%@include file="/common/utop.jsp"%>
<!--热门商品-->
<div class="width1200 center_yh hidden_yh">
    <div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 10px;">
        <font class="left_yh font20">标签云</font>
    </div>
<%--    <div class="width100 hidden_yh" style="height: 480px;">--%>
<%--        <div class="normalPic">--%>
<%--            <c:forEach items="${rxs}" var="data" varStatus="l">--%>
<%--                <a href="${ctx}/item/view?id=${data.id}">--%>
<%--                    <img src="${data.url1}" height="180" alt="" style="margin:0 auto">--%>
<%--                    <h3 class="yihang c_33 font14 font100" style="padding-left: 0px;padding-right: 0px;">${data.name}  ${data.price}</h3>--%>
<%--                </a>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div id="tab_1">
        <iframe src="https://scrapir.org/data-management?api=GitHub_Search_Code"
                height="500"
                width="1500"
                frameborder="0"
                scrolling="0"
        ></iframe>
    </div>
<%--    <%@include file="${ctx}/webtag/webtagcloud.jsp"%>--%>
</div>
    <%@include file="/common/ufooter.jsp"%>
</body>
</html>



















