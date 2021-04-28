<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/3/26
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>

<script src="${ctx}/resource/js/echart/echarts3/echarts-all-3.js"></script>
<script src="${ctx}/resource/js/echart/echarts3/dataTool.min.js"></script>
<script src="${ctx}/resource/js/echart/echarts3/china.js"></script>
<script src="${ctx}/resource/js/echart/echarts3/world.js"></script>
<script src="${ctx}/resource/js/echart/echarts3/bmap.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js'></script>
<script src="${ctx}/resource/js/echart/echarts-wordcloud.js"></script>
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
                ${listWebTag}
            ]
        } ]
    };

    chart.setOption(option);
    alert(listWebTag);
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