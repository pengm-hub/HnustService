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
<%--    <link type="text/css" rel="stylesheet" href="${ctx}/resource/css/bulma/bulma.min.css">--%>
<%--    <link type="text/css" rel="stylesheet" href="${ctx}/resource/css/bulma/bulma.css">--%>
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
<%@include file="/common/utop.jsp"%>

<!--webapiList-->
<div class="width1200 center_yh hidden_yh" style="margin-top: 25px;">

<%--    <div class="width100 hidden_yh" style="background: #f0f0f0;padding-top:34px;padding-bottom: 34px;">--%>
<%--        <div class="width1200 hidden_yh center_yh">--%>
<%--            <div id="vipRight" style="width: 1200px">--%>
<%--                <h3>共${pagers.total}条数据</h3>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="hidden_yh bj_fff" style="width: 1198px;border: 1px solid #ddd;">
        <c:forEach items="${pagers.datas}" var="data" varStatus="l">
                <div class="hidden_yh" style="padding:20px;width: 1100px;margin: 0 auto">
                    <div class="width100 hidden_yh" style="border-bottom: 1px dashed #ddd;padding-top: 10px;padding-bottom: 10px;">
                        <div class="left_yh" style="width:100%;color: black">
                            <a href="${ctx}/webapi/webApiView?id=${data.api_id}" ><h1 class="spName1">${data.api_name}</h1></a>
                            <p class="spName2">类别：${data.api_category}</p>
                            <p class="spName2">标签：${data.api_tags}</p>
                            <p class="spName2" style="height: 25px;text-overflow:ellipsis;white-space:nowrap">简介：${data.api_describe}</p>
                        </div>
                    </div>
                </div>
        </c:forEach>
    </div>
</div>
<div id="navs">
    <div class="pagelist">
        <!--分页开始-->
        <pg:pager url="${ctx}/webapi/webApiList" maxIndexPages="20" items="${pagers.total}" maxPageItems="50" export="curPage=pageNumber">
            <pg:last>
                共${pagers.total}记录，共${pageNumber}页，
            </pg:last>
            当前第${curPage}页
            <pg:first>
                <a href="${pageUrl}">首页</a>
            </pg:first>
            <pg:prev>
                <a href="${pageUrl}">上一页</a>
            </pg:prev>
            <pg:pages>
                <c:choose>
                    <c:when test="${curPage eq pageNumber}">
                        <font color="red">[${pageNumber}]</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </pg:pages>
            <pg:next>
                <a href="${pageUrl}">下一页</a>
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
<%@include file="/common/ufooter.jsp"%>
</body>
</html>
