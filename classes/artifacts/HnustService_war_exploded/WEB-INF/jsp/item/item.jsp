<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>管理员后台</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">

    <table class="table table-hover text-center">
        <tr>
            <th>作品名称</th>
            <th>作品图片</th>
            <th>作者</th>
            <th>作品分类</th>
            <th>审核情况</th>
            <th>操作</th>
        </tr>
    <c:forEach items="${pagers.datas}" var="data" varStatus="l">
        <tr>
            <td>${data.name}</td>
            <td><img src="${data.url1}" alt="" style="width: 100px;height: 100px;"></td>
            <td>${data.price}</td>
            <td>${data.yiji.name}</td>
            <td>
                <c:if test="${data.isExamine==1}">
                    通过
                </c:if>
                <c:if test="${data.isExamine==0}">
                    未通过
                </c:if>
            </td>
            <td>
                <a class="button border-main" href="${ctx}/item/update?id=${data.id}"><span class="icon-edit">通过</span> </a>
                <a class="button border-red" href="${ctx}/item/delete?id=${data.id}"><span class="icon-trash-o">不通过</span> </a>
            </td>

        </tr>
    </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <!--分页开始-->
                    <pg:pager url="${ctx}/item/findBySql" maxIndexPages="5" items="${pagers.total}" maxPageItems="15" export="curPage=pageNumber">
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
            </td>
        </tr>
    </table>
</div>
<script>
    function changeSearch(){
        $("#listform").submit();
    }
</script>
</body>

</html>