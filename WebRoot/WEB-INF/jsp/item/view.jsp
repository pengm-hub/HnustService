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
<!--导航条-->
<%--<div class="width100" style="height: 45px;background: #dd4545;margin-top: 40px;position: relative;z-index: 100;">--%>
<%--    <!--中间的部分-->--%>
<%--    <div class="width1200 center_yh relative_yh" style="height: 45px;">--%>
<%--        <!--普通导航-->--%>
<%--        <div class="left_yh font16" id="pageNav">--%>
<%--            <a href="${ctx}/login/uIndex">首页</a>--%>
<%--            <a href="${ctx}/news/list">公告</a>--%>
<%--            <a href="${ctx}/message/add">留言</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="width1200 center_yh hidden_yh font14" style="height: 40px;line-height: 40px;">
    <span>当前位置：</span><a href="${ctx}/login/uIndex" class="c_66">首页</a>
    ><a href="#" class="c_66">作品列表</a>
    ><a href="#" class="c_66">详情</a>
</div>
<div class="width1198 center_yh" style="height: 500px;">
    <div class="left_yh" style="width: 40%;height: 500px;">
        <input type="hidden" id="id" value="${obj.id}">
        <div id="preview">
            <div>
                <img src="${obj.url1}" alt="" height="500">
            </div>
        </div>
    </div>
    <div class="left_yh" style="width: 300px;height: 420px;margin-left: 80px;">
        <h3 class="font20 font100">${obj.name}</h3>
        <p class="font16 c_66" style="margin-top:25px;">
            <font style="margin-right: 20px;">作者：${obj.price}</font>
        </p>
        <p class="font16 c_66" style="margin-top:25px;">
            <font style="margin-right: 20px;">${obj.ms}</font>
        </p>
        <p class="font16 c_66" style="margin-top:25px;">
            <font style="margin-right: 20px;">收藏量：${1212}</font>
        </p>
        <div class="buyFor">
            <a href="${ctx}/sc/exAdd?itemId=${obj.id}" class="mstBuy">收藏</a>
        </div>
    </div>
</div>
<div class="width1200 hidden_yh center_yh" style="margin-top: 10px;">
    <div class="right_yh" style="width: 1200px;">
        <div class="hidden_yh" id="spXqpj">
            <a href="javascript:void(0)" class="on">评价</a>
        </div>
        <div class="width100 hidden_yh">
            <div id="spPj">
                <div class="width100 hidden_yh" style="padding-bottom: 20px;border-bottom: 1px dashed #ddd; margin-bottom: 10px;">
                    <c:forEach items="${obj.pls}" var="data" varStatus="l">
                        <div style="width: 790px;float: right;overflow:hidden;margin-top: 20px;">
                            <img src="${ctx}/resource/user/images/x.jpg" style="width: 40px;height: 40px;border-radius: 50%;float: left;border:1px solid #ddd;margin-top: 20px;margin-right: 30px;">
                            <h3 class="font16 c_33 font100" style="color: red;font-weight: bold;">${data.user.userName}</h3>
                            <p class="font14 c_99" style="margin-top: 6px;">
                                <fmt:formatDate value="${data.addTime}" pattern="yyyy-MM-dd"/>
                            </p>
                            <p class="font16 c_33" style="margin-top: 6px;">
                                ${data.content}
                            </p>
                            <div class="width100 hidden_yh" style="padding-bottom: 20px; border-bottom: 1px dashed #ddd;margin-bottom: 10px;">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#spXqpj a").click(function () {
        $(this).addClass("on").siblings().removeClass("on");
    });
    $("#spXqpj a").eq(0).click(function () {
        $("#spDetail").css({display:"block"}).siblings().css({display:"none"});
    });
    $("#spXqpj a").eq(1).click(function () {
        $("#spPj").css({display:"block"}).siblings().css({display:"none"});
    });

    $(function () {
    $(".addCar").click(function () {
        var id = $("#id").val();
        var num = $("#t_a").val();
        $.ajax({
            type:"POST",
            url:"${ctx}/car/exAdd?itemId="+id+"&num="+num,
            success:function (result) {
                var re = result;
                if(re.res == 0){
                    alert("请登录");
                    window.location.href="${ctx}/login/uLogin";
                }else {
                    window.location.href="${ctx}/car/findBySql";
                }
            }
        });
    });
});
</script>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>



















