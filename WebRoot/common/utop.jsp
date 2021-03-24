<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<div class="width100" style="height: 25px;background: #f0f0f0;">
    <div class="width1200 center_yh font14 c_66" style="height: 25px;line-height: 25px;">
        <font class="left_yh">欢迎来到画渣世界！</font>
        <div class="right_yh" id="fast_jump">
            <c:if test="${userId!=null}">
                <a href="#">欢迎您：${username}</a>
                <b></b>
                <a href="${ctx}/login/uTui">退出</a>
                <b></b>

            </c:if>
            <c:if test="${userId==null}">
                <a href="${ctx}/login/uLogin">登录</a>
                <b></b>
                <a href="${ctx}/login/res">注册</a>
                <b></b>
            </c:if>
            <a href="${ctx}/user/view">个人中心</a>
        </div>
    </div>
</div>
<div class="width100 hidden_yh">
    <div class="width1200 center_yh hidden_yh">
            <img src="${ctx}/resource/images/mylogo2.png" alt="" style="height: 70px">
        <div class="right_yh" style="height:28px;width:316px;border:2px solid #dd4545;margin-top:-40px;">
            <form action="${ctx}/item/shoplist" method="post">
                <input type="text" placeholder="关键词查询" class="search" name="condition" value="${condition}">
                <input type="submit" class="btnSearh" value="搜索">
            </form>
        </div>
    </div>
</div>

<div class="width100" style="height: 45px;background: #dd4545;margin-top: 40px;position: relative;z-index: 100;">
    <!--中间的部分-->
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
        <!--列表导航-->
        <%--        <div class="left_yh Selected" style="width: 150px;height: 45px;" id="hiddenShow">--%>
        <%--            <!--头部的图标-->--%>
        <%--            <img src="${ctx}/resource/user/images/cd.png" class="left_yh" style="margin-left: 24px;" alt="">--%>
        <%--            <span class="block_yh left_yh fff" style="height: 45px;line-height: 44px;margin-left: 10px;">分类</span>--%>
        <%--            <!--导航展开部分-->--%>
        <%--            <div class="downSlide">--%>
        <%--                <c:forEach items="${lbs}" var="data" varStatus="l">--%>
        <%--                    <div class="n1Nav">--%>
        <%--                        <font>${data.father.name}</font>--%>
        <%--                        <img src="${ctx}/resource/user/images/jt.png" alt="">--%>
        <%--                        <div class="n2Nav">--%>
        <%--                            <div class="n3Nav">--%>
        <%--                                <h3>${data.father.name}</h3>--%>
        <%--                                <c:forEach items="${data.childrens}" var="child" varStatus="ll">--%>
        <%--                                    <a href="${ctx}/item/shoplist?categoryIdTwo=${child.id}">${child.name}</a>--%>
        <%--                                </c:forEach>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </c:forEach>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav">
            <a href="${ctx}/login/uIndex">首页</a>
            <a href="${ctx}/webapi/webApiList">Web Api</a>
            <a href="${ctx}/message/add">Mashup</a>
            <a href="${ctx}/news/list">服务网络</a>
            <a href="${ctx}/message/add">相关成果</a>
            <a href="${ctx}/news/list">公告</a>
            <a href="${ctx}/message/add">留言</a>
        </div>
    </div>
</div>