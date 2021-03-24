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

    <script>
        var chart = echarts.init(document.getElementById('main'));

        var option = {
            tooltip: {},
            series: [ {
                type: 'wordCloud',
                gridSize: 2,
                sizeRange: [12, 50],
                rotationRange: [-90, 90],
                shape: 'pentagon',
                width: 600,
                height: 400,
                drawOutOfBound: true,
                textStyle: {
                    color: function () {
                        return 'rgb(' + [
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160)
                        ].join(',') + ')';
                    }
                },
                emphasis: {
                    textStyle: {
                        shadowBlur: 10,
                        shadowColor: '#333'
                    }
                },
                data:[
                    {
                        name: 'example',
                        value: 1,
                        textStyle: {
                            color: 'black'
                        },
                        emphasis: {
                            textStyle: {
                                color: 'red'
                            }
                        }
                    },
                    ${apiTag}
                ]
            } ]
        };

        chart.setOption(option);
        alert(apiTag);
        window.onresize = chart.resize;
    </script>


    <style>
        html, body, #main {
            width: 100%;
            height: 100%;
            margin: 0;
        }
    </style>
    <div id='main' style="width: 800px; margin: 0px auto; height: 500px; border: 1px solid #ffffff; "></div>

</div>
    <%@include file="/common/ufooter.jsp"%>
</body>
</html>



















