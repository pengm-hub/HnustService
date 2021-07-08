<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/6/16
  Time: 16:03
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

    <!-- JS -->
    <script src="${ctx}/resource/js/jquery-3.5.1.min.js"></script>
    <script src="${ctx}/resource/js/bootstrap.bundle.min.js"></script>
    <script src="${ctx}/resource/js/jquery.magnific-popup.min.js"></script>
    <script src="${ctx}/resource/js/smooth-scrollbar.js"></script>
    <script src="${ctx}/resource/js/select2.min.js"></script>
    <script src="${ctx}/resource/js/admin.js"></script>
    <script src="${ctx}/resource/js/go.js"></script>

    <title>Web Service</title>

</head>
<body>
<%@include file="/common/utop.jsp"%>
<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <!-- main title -->
        <div class="col-12">
            <div class="main__title">
                <h2>YouTube Test</h2>
            </div>
        </div>
        <!-- end main title -->
    </div>
    <div id="sample" style="width: 100%; margin: 0 auto; background-color: #ffffff" >

      <textarea id="desOfUsers" style="width:100%;height:100px">
         通过输入关键字得到youtube上视频的相关信息（类型、标题、id、描述、浏览、上传者等信息），能够查看视频的状态，提供下载地址、文件大小、缩略图等，可以观看视频，对视频进行截图
      </textarea>
        <button id="commitDes" style="float: right;">提交</button>
        <div style="width: 100%; display: flex; justify-content: space-between">
            <div id="myPaletteDiv" style="width: 200px; margin-right: 2px; background-color: whitesmoke; border: solid 1px black"></div>
            <div id="myDiagramDiv" style="flex-grow: 1; height: 500px; border: solid 1px black"></div>
            <div id="myDesDiv" style="width: 400px; margin-right: 2px; background-color: whitesmoke; border: solid 1px black"></div>
        </div>
        <button id="executeButton">测试</button>
        <button id="composeButton">组合</button>
        <button id="gojsButton">查看GOJS</button>
        <button id="printButton">用SVG打印</button>
        <div class="content" id="chooseParam" style="visibility: hidden; margin-left: 20px">
            <form action="#" method="post">
                <div style="width:30%; float:left; margin:5px 0;">
                    <label for="apiParamSelect" id="apiParam">API参数（From YouTube Search Results）:</label>
                    <select name="apiParamSelect" id="apiParamSelect" placeholder="选择参数" style="width:calc(100% - 20px); float:left; padding:10px; font-family:inherit;">
                        <option value="id">id</option>
                        <option value="url">url</option>
                        <option value="title">title</option>
                        <option value="other">....</option>
                    </select>
                </div>
                <div style="width:50%; float:left; margin:5px 0;">
                    <label for="paramValue" id="paramValue">参数值:</label>
                    <select name="paramValueSelect" id="paramValueSelect" placeholder="选择参数值" style="width:calc(100% - 20px); float:left; padding:10px; font-family:inherit;">
                        <option value="1">RsEZmictANA</option>
                        <option value="2">tCXGJQYZ9JA</option>
                        <option value="3">FuXNumBwDOM</option>
                        <option value="4">....</option>
                    </select>
                </div>
            </form>
        </div>
        <textarea id="mySavedModel" style="visibility: hidden;width:100%;height:300px"></textarea>
        <!-- <textarea id="responeseShow" style="visibility: hidden;width:100%;height:300px"></textarea> -->
        <!-- <textarea id="testShow" style="visibility: hidden;width:100%;height:300px"></textarea> -->
        <pre><code id="responeseShow"></code></pre>
    </div>
</main>
<script>
    var ctxt = $('textarea').val();  // 获取 textarea 内容
    ctxt = ctxt.replace(/\n|\r\n/g,"<br>");

    // Preparar o select
    //pickout.to('.pickout');
    pickout.to({
        el:'.city',
        theme: 'white',
        search: true
    });

    pickout.to({
        el:'.state',
        theme: 'clean',
    });

    // Caso o valor já venha do servidor, já atribui a seleção automaticamente
    pickout.updated('.city');


</script>
<script>
    window.onload = function() {
        var $ = go.GraphObject.make;    // 创建画布

        var myDiagram =
            $(go.Diagram, "myDiagramDiv",   // 必须与Div元素的id属性一致
                {
                    initialContentAlignment: go.Spot.Center, // 居中显示内容
                    "undoManager.isEnabled": true, // 启用Ctrl-Z和Ctrl-Y撤销重做功能
                    allowDrop: true,  // 是否允许从Palette面板拖入元素
                    "LinkDrawn": showLinkLabel,  // 每次画线后调用的事件：为条件连线加上标签，该方法再后面定义
                    "LinkRelinked": showLinkLabel,  // 每次重画线后调用的事件：同上LinkDrawn
                    scrollsPageOnFocus: false   // 图选中时页面不会滚动
                });

        // 设置节点位置风格，并与模型"loc"属性绑定，该方法会在初始化各种节点模板时使用
        function nodeStyle() {
            return [
                // 将节点位置信息 Node.location 同节点模型数据中 "loc" 属性绑定：
                // 节点位置信息从 节点模型 "loc" 属性获取, 并由静态方法 Point.parse 解析.
                // 如果节点位置改变了, 会自动更新节点模型中"loc"属性, 并由 Point.stringify 方法转化为字符串
                new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
                {
                    // 节点位置 Node.location 定位在节点的中心
                    locationSpot: go.Spot.Center
                }
            ];
        }

        // 创建"port"方法，"port"是一个透明的长方形细长图块，在每个节点的四个边界上，如果鼠标移到节点某个边界上，它会高亮
        // "name": "port" ID，即GraphObject.portId,
        // "align": 决定"port" 属于节点4条边的哪条
        // "spot": 控制连线连入/连出的位置，如go.Spot.Top指, go.Spot.TopSide
        // "output" / "input": 布尔型，指定是否允许连线从此"port"连入或连出
        function makePort(name, align, spot, output, input) {
            // 如果是上、下边界，则是水平"port"
            var horizontal = align.equals(go.Spot.Top) || align.equals(go.Spot.Bottom);

            return $(go.Shape,
                {
                    fill: "transparent",            // 默认透明不现实
                    strokeWidth: 0,                 // 无边框
                    width: horizontal ? NaN : 8,    // 垂直"port"则8像素宽
                    height: !horizontal ? NaN : 8,  // 水平"port"则8像素
                    alignment: align,               // 同其节点对齐
                    stretch: (horizontal ? go.GraphObject.Horizontal : go.GraphObject.Vertical), // 自动同其节点一同伸缩
                    portId: name,                   // 声明ID
                    fromSpot: spot,                 // 声明连线头连出此"port"的位置
                    fromLinkable: output,           // 布尔型，是否允许连线从此"port"连出
                    toSpot: spot,                   // 声明连线尾连入此"port"的位置
                    toLinkable: input,              // 布尔型，是否允许连线从此"port"连出
                    cursor: "pointer",              // 鼠标由指针改为手指，表示此处可点击生成连线
                    mouseEnter: function(e, port) { // 鼠标移到"port"位置后，高亮
                        if (!e.diagram.isReadOnly) port.fill = "rgba(255,0,255,0.5)";
                    },
                    mouseLeave: function(e, port) { // 鼠标移出"port"位置后，透明
                        port.fill = "transparent";
                    }
                });
        }

        // 图形上的文字风格
        function textStyle() {
            return {
                font: "11pt Helvetica, Arial, sans-serif",
                stroke: "whitesmoke"
            }
        }

        // 定义开始节点的模板
        myDiagram.nodeTemplateMap.add("API",
            $(go.Node, "Table", nodeStyle(),
                // 开始节点是一个圆形图块，文字不可编辑
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { minSize: new go.Size(40, 40), fill: "#79C900", strokeWidth: 0 }),
                    $(go.TextBlock, "API", textStyle(),
                        new go.Binding("text"))
                ),

                // 左、右、下可以出，但都不可入
                makePort("T", go.Spot.Top, go.Spot.Top, true, true),
                makePort("L", go.Spot.Left, go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, go.Spot.Bottom, true, true)
            )
        );

        // 初始化连接线的模板
        myDiagram.linkTemplate =
            $(go.Link,  // 所有连接线
                {
                    routing: go.Link.AvoidsNodes,   // 连接线避开节点
                    curve: go.Link.JumpOver,
                    corner: 5, toShortLength: 4,    // 直角弧度，箭头弧度
                    relinkableFrom: true,   // 允许连线头重设
                    relinkableTo: true,     // 允许连线尾重设
                    reshapable: true,       // 允许线形修改
                    resegmentable: true,    // 允许连线分割（折线）修改
                    // 鼠标移到连线上后高亮
                    mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },
                    mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; },
                    selectionAdorned: false
                },
                new go.Binding("points").makeTwoWay(),  // 双向绑定模型中"points"数组属性
                $(go.Shape,  // 隐藏的连线形状，8个像素粗细，当鼠标移上后显示
                    { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }
                ),
                $(go.Shape,  // 连线规格（颜色，选中/非选中，粗细）
                    { isPanelMain: true, stroke: "gray", strokeWidth: 2 },
                    new go.Binding("stroke", "isSelected", function(sel) { return sel ? "dodgerblue" : "gray"; }).ofObject()
                ),
                $(go.Shape,  // 箭头规格
                    { toArrow: "standard", strokeWidth: 0, fill: "gray"}
                ),
                $(go.Panel, "Auto",  // 连线标签，默认不显示
                    { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5},
                    new go.Binding("visible", "visible").makeTwoWay(),  // 双向绑定模型中"visible"属性
                    $(go.Shape, "RoundedRectangle",  // 连线中显示的标签形状
                        { fill: "#F8F8F8", strokeWidth: 0 }),
                    $(go.TextBlock, "是",  // 连线中显示的默认标签文字
                        {
                            textAlign: "center",
                            font: "10pt helvetica, arial, sans-serif",
                            stroke: "#333333",
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())  // 双向绑定模型中"text"属性
                )
            );

        // 此事件方法由整个画板的LinkDrawn和LinkRelinked事件触发
        // 如果连线是从”conditional"条件节点出发，则将连线上的标签显示出来
        function showLinkLabel(e) {
            var label = e.subject.findObject("LABEL");
            if (label !== null) {
                label.visible = (e.subject.fromNode.data.category === "Conditional");
            }
        }

        // 临时的连线（还在画图中），包括重连的连线，都保持直角
        myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
        myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;

        // 在图形页面的左边初始化图例Palette面板
        myPalette =
            $(go.Palette, "myPaletteDiv",  // 必须同HTML中Div元素id一致
                {
                    scrollsPageOnFocus: false,  // 图选中时页面不会滚动
                    nodeTemplateMap: myDiagram.nodeTemplateMap,  // 同myDiagram公用一种node节点模板
                    model: new go.GraphLinksModel([  // 初始化Palette面板里的内容
                        { category: "API", text: "YouTube Search Results" },
                        { category: "API", text: "Youtube To Mp3" },
                        { category: "API", text: "Youtube Videos" },
                        { category: "API", text: "youtube-screenshot" }
                    ])
                });

        var Select_Port = null;
        var select_node = null;

        // myDiagram.addDiagramListener("ObjectSingleClicked", function(e) {
        //     document.getElementById("mySavedModel").style.visibility="visible";
        //     //Select_Port = e.subject.part.data.key;    e.subject.part.data即获取到的data
        //     if(e.subject.part.data.key == "-1"){
        //         document.getElementById("chooseParam").style.visibility="visible";
        //         document.getElementById("mySavedModel").value = "import requests \
        // url = \"https://youtube-search-results.p.rapidapi.com/youtube-search/\"\
        // querystring = {\"q\":\"justin+bieber\"}\
        // headers = {\'x-rapidapi-key\': \"8bf2a7f2f9msh678f4857e76bd45p16f005jsn25b2a7721455\",\'x-rapidapi-host\': \"youtube-search-results.p.rapidapi.com\"}\
        // response = requests.request(\"GET\", url, headers=headers, params=querystring)\
        // print(response.text);"
        //     }
        //     if(e.subject.part.data.key == "-2"){
        //         document.getElementById("chooseParam").style.visibility="visible";//显示
        //         document.getElementById("mySavedModel").value = "名称：Youtube To Mp3\
        // url ： https://youtube-to-mp32.p.rapidapi.com/yt_to_mp3\
        // 描述 ： Get Direct Mp3 Download Link.\
        // Required Parameters ： video_id"
        //     }
        //     if(e.subject.part.data.key == "-3"){
        //         document.getElementById("chooseParam").style.visibility="visible";//显示
        //         document.getElementById("mySavedModel").value = "名称：Youtube Videos\
        // url ： https://youtube-videos.p.rapidapi.com/mp4\
        // 描述 ： An easy-to-use API to fetch videos from Youtube in MP4 format.\
        // Required Parameters ： videoId"
        //     }
        //     if(e.subject.part.data.key == "-4"){
        //         document.getElementById("chooseParam").style.visibility="visible";//显示
        //         document.getElementById("mySavedModel").value = "名称：youtube-screenshot\
        // url ： https://youtube-screenshot1.p.rapidapi.com/frames/\
        // 描述 ： Capture images from youtube videos\
        // Required Parameters ： youtube_id"
        //     }
        //     select_node = e.subject.part.data.key;
        //
        // });

        // 将go模型以JSon格式保存在文本框内
        document.getElementById("gojsButton").addEventListener("click", function() {
            document.getElementById("mySavedModel").style.visibility="visible";
            document.getElementById("mySavedModel").value = myDiagram.model.toJson();
            myDiagram.isModified = false;
        });

        // 读取文本框内JSon格式的内容，并转化为gojs模型
        document.getElementById("composeButton").addEventListener("click", function() {
            document.getElementById("mySavedModel").style.visibility="visible";
            // myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
        });

        // 在新窗口中将图形转化为SVG，并分页打印
        document.getElementById("printButton").addEventListener("click", function() {
            document.getElementById("mySavedModel").style.visibility="visible";
            var svgWindow = window.open();
            if (!svgWindow) return;  // 创建新窗口失败
            var printSize = new go.Size(700, 960);
            var bnds = myDiagram.documentBounds;
            var x = bnds.x;
            var y = bnds.y;
            while (y < bnds.bottom) {
                while (x < bnds.right) {
                    var svg = myDiagram.makeSVG({ scale: 1.0, position: new go.Point(x, y), size: printSize });
                    svgWindow.document.body.appendChild(svg);
                    x += printSize.width;
                }
                x = bnds.x;
                y += printSize.height;
            }
            setTimeout(function() { svgWindow.print(); }, 1);
        });

        myDiagram.addDiagramListener("ObjectSingleClicked", function(e) {
            document.getElementById("mySavedModel").style.visibility="visible";
            document.getElementById("chooseParam").style.visibility="visible";
            var  div = document.getElementById( 'myDesDiv' ); //获取一个id是divid的div节点，往这个节点中添加p节点
            var  p = document.createElement( 'p' ); //创建p节点

            if(e.subject.part.data.key == "-1"){
                div.innerHTML = "";
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '名称：YouTube Search Results' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'url：https://youtube-search-results.p.rapidapi.com/youtube-search/' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '描述：Fetch the YouTube Search Results and the information for each item for a specific search term, without any limits!' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'Parameters：q' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                //             document.getElementById("mySavedModel").value = "import requests \
                // url = \"https://youtube-search-results.p.rapidapi.com/youtube-search/\"\
                // querystring = {\"q\":\"justin+bieber\"}\
                // headers = {\'x-rapidapi-key\': \"8bf2a7f2f9msh678f4857e76bd45p16f005jsn25b2a7721455\",\'x-rapidapi-host\': \"youtube-search-results.p.rapidapi.com\"}\
                // response = requests.request(\"GET\", url, headers=headers, params=querystring)\
                // print(response.text);"
            }
            if(e.subject.part.data.key == "-2"){
                div.innerHTML = "";
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '名称：Youtube To Mp3' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'url：https://youtube-to-mp32.p.rapidapi.com/yt_to_mp3' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '描述：Get Direct Mp3 Download Link.' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'Parameters： video_id[Required]' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
            }
            if(e.subject.part.data.key == "-3"){
                div.innerHTML = "";
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '名称：Youtube Videos' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'url：https://youtube-videos.p.rapidapi.com/mp4' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '描述：An easy-to-use API to fetch videos from Youtube in MP4 format.' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'Parameters： videoId[Required]' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
            }
            if(e.subject.part.data.key == "-4"){
                div.innerHTML = "";
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '名称：youtube-screenshot' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'url：https://youtube-screenshot1.p.rapidapi.com/frames/' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  '描述：Capture images from youtube videos' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
                var  p = document.createElement( 'p' ); //创建p节点
                p.innerHTML =  'Parameters： youtube_id[Required]' ; //p节点显示的文字
                div.appendChild(p); //往div中添加p节点
            }

            select_node = e.subject.part.data.key;  // 注意这一行！！！
        });

        // 点击了API后，获取到其信息，执行API测试
        document.getElementById("executeButton").addEventListener("click", function() {
            document.getElementById("mySavedModel").style.visibility="visible";
            // document.getElementById("testShow").style.visibility="visible";
            // document.getElementById("testShow").value = select_node;
            // document.getElementById("responeseShow").style.visibility="visible";
            var url = null, xRapidapiHost = null;
            if(select_node == "-1"){
                url = "https://youtube-search-results.p.rapidapi.com/youtube-search/?q=justin%2Bbieber";
                xRapidapiHost = "youtube-search-results.p.rapidapi.com";
                fetchClassic(url, xRapidapiHost);
            }
            if(select_node == "-2"){
                url = "https://youtube-to-mp32.p.rapidapi.com/yt_to_mp3?video_id=edPREMPZ5RA";
                xRapidapiHost = "youtube-to-mp32.p.rapidapi.com";
                fetchClassic(url, xRapidapiHost);
            }
            if(select_node == "-3"){
                url = "https://youtube-videos.p.rapidapi.com/mp4?videoId=RsEZmictANA";
                xRapidapiHost = "youtube-videos.p.rapidapi.com";
                fetchClassic(url, xRapidapiHost);
            }
            if(select_node == "-4"){
                url = "https://youtube-screenshot1.p.rapidapi.com/frames/?youtube_id=UxxajLWwzqY&seconds=3";
                xRapidapiHost = "youtube-screenshot1.p.rapidapi.com";
                fetchClassic(url, xRapidapiHost);
            }
        });

        // 测试API，返回json结果
        function fetchClassic(url, xRapidapiHost) {
            fetch(url, {
                method: "GET",
                headers: {
                    "x-rapidapi-key": "8bf2a7f2f9msh678f4857e76bd45p16f005jsn25b2a7721455",
                    "x-rapidapi-host": xRapidapiHost
                    // "content-type": "application/json"
                }
            })
                .then(response => { return response.json();}) // 这一层返回的是promise
                .then(function(myJson){
                    // $('#responeseShow').html(JSON.stringify(myJson));
                    var show = document.getElementById('responeseShow'),
                        newData = JSON.stringify(myJson, null, 4);
                    show.innerHTML = newData; //需要添加JSON.stringify(myJson)转为json
                });
        }
    } // windows.onload
</script>
</body>
<%--<body>--%>
<%--<!-- header -->--%>
<%--<%@include file="/common/utop.jsp"%>--%>



<%--    <!-- main content -->--%>
<%--    <div id="sample" style="width: 100%; margin: 0 auto; background-color: #ffffff" >--%>
<%--      <h2> 通过输入关键字得到youtube上视频的相关信息（类型、标题、id、描述、浏览、上传者等信息），能够查看视频的状态，提供下载地址、文件大小、缩略图等，可以观看视频，对视频进行截图.</h2>--%>
<%--        <div style="width: 100%; display: flex; justify-content: space-between">--%>
<%--            <div id="myPaletteDiv" style="width: 200px; margin-right: 2px; background-color: whitesmoke; border: solid 1px black"></div>--%>
<%--            <div id="myDiagramDiv" style="flex-grow: 1; height: 500px; border: solid 1px black"></div>--%>
<%--            <div id="myDesDiv" style="width: 400px; margin-right: 2px; background-color: whitesmoke; border: solid 1px black">--%>
<%--&lt;%&ndash;                <div id="myDesDiv" style="visibility: hidden;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <h2>YouTube Search Results</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>价格： FREEMIUM</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>描述： Fetch the YouTube Search Results and the information for each item for a specific search term, without any limits!</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>请求方法： GET</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>参数名称：q  [STRING]</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>样例： justin+bieber</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>说明：【REQUIRED】The URL Encoded search Query </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div style="margin-left: 20px">--%>
<%--            <button id="executeButton">测试</button>--%>
<%--            <button id="composeButton">组合</button>--%>
<%--            <button id="gojsButton">查看GOJS</button>--%>
<%--            <button id="printButton">用SVG打印</button>--%>
<%--        </div>--%>


<%--        <pre><code id="responeseShow"></code></pre>--%>
<%--        <textarea id="mySavedModel" style="visibility: hidden;margin-left:10px;width:99%;height:300px"></textarea>--%>
<%--    </div>--%>
<%--    <script>--%>
<%--        window.onload = function() {--%>
<%--            var $ = go.GraphObject.make;    // 创建画布--%>

<%--            var myDiagram =--%>
<%--                $(go.Diagram, "myDiagramDiv",   // 必须与Div元素的id属性一致--%>
<%--                    {--%>
<%--                        initialContentAlignment: go.Spot.Center, // 居中显示内容--%>
<%--                        "undoManager.isEnabled": true, // 启用Ctrl-Z和Ctrl-Y撤销重做功能--%>
<%--                        allowDrop: true,  // 是否允许从Palette面板拖入元素--%>
<%--                        "LinkDrawn": showLinkLabel,  // 每次画线后调用的事件：为条件连线加上标签，该方法再后面定义--%>
<%--                        "LinkRelinked": showLinkLabel,  // 每次重画线后调用的事件：同上LinkDrawn--%>
<%--                        scrollsPageOnFocus: false   // 图选中时页面不会滚动--%>
<%--                    });--%>

<%--            // 设置节点位置风格，并与模型"loc"属性绑定，该方法会在初始化各种节点模板时使用--%>
<%--            function nodeStyle() {--%>
<%--                return [--%>
<%--                    // 将节点位置信息 Node.location 同节点模型数据中 "loc" 属性绑定：--%>
<%--                    // 节点位置信息从 节点模型 "loc" 属性获取, 并由静态方法 Point.parse 解析.--%>
<%--                    // 如果节点位置改变了, 会自动更新节点模型中"loc"属性, 并由 Point.stringify 方法转化为字符串--%>
<%--                    new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),--%>
<%--                    {--%>
<%--                        // 节点位置 Node.location 定位在节点的中心--%>
<%--                        locationSpot: go.Spot.Center--%>
<%--                    }--%>
<%--                ];--%>
<%--            }--%>

<%--            // 创建"port"方法，"port"是一个透明的长方形细长图块，在每个节点的四个边界上，如果鼠标移到节点某个边界上，它会高亮--%>
<%--            // "name": "port" ID，即GraphObject.portId,--%>
<%--            // "align": 决定"port" 属于节点4条边的哪条--%>
<%--            // "spot": 控制连线连入/连出的位置，如go.Spot.Top指, go.Spot.TopSide--%>
<%--            // "output" / "input": 布尔型，指定是否允许连线从此"port"连入或连出--%>
<%--            function makePort(name, align, spot, output, input) {--%>
<%--                // 如果是上、下边界，则是水平"port"--%>
<%--                var horizontal = align.equals(go.Spot.Top) || align.equals(go.Spot.Bottom);--%>

<%--                return $(go.Shape,--%>
<%--                    {--%>
<%--                        fill: "transparent",            // 默认透明不现实--%>
<%--                        strokeWidth: 0,                 // 无边框--%>
<%--                        width: horizontal ? NaN : 8,    // 垂直"port"则8像素宽--%>
<%--                        height: !horizontal ? NaN : 8,  // 水平"port"则8像素--%>
<%--                        alignment: align,               // 同其节点对齐--%>
<%--                        stretch: (horizontal ? go.GraphObject.Horizontal : go.GraphObject.Vertical), // 自动同其节点一同伸缩--%>
<%--                        portId: name,                   // 声明ID--%>
<%--                        fromSpot: spot,                 // 声明连线头连出此"port"的位置--%>
<%--                        fromLinkable: output,           // 布尔型，是否允许连线从此"port"连出--%>
<%--                        toSpot: spot,                   // 声明连线尾连入此"port"的位置--%>
<%--                        toLinkable: input,              // 布尔型，是否允许连线从此"port"连出--%>
<%--                        cursor: "pointer",              // 鼠标由指针改为手指，表示此处可点击生成连线--%>
<%--                        mouseEnter: function(e, port) { // 鼠标移到"port"位置后，高亮--%>
<%--                            if (!e.diagram.isReadOnly) port.fill = "rgba(255,0,255,0.5)";--%>
<%--                        },--%>
<%--                        mouseLeave: function(e, port) { // 鼠标移出"port"位置后，透明--%>
<%--                            port.fill = "transparent";--%>
<%--                        }--%>
<%--                    });--%>
<%--            }--%>

<%--            // 图形上的文字风格--%>
<%--            function textStyle() {--%>
<%--                return {--%>
<%--                    font: "11pt Helvetica, Arial, sans-serif",--%>
<%--                    stroke: "whitesmoke"--%>
<%--                }--%>
<%--            }--%>

<%--            // 定义开始节点的模板--%>
<%--            myDiagram.nodeTemplateMap.add("API",--%>
<%--                $(go.Node, "Table", nodeStyle(),--%>
<%--                    // 开始节点是一个圆形图块，文字不可编辑--%>
<%--                    $(go.Panel, "Auto",--%>
<%--                        $(go.Shape, "Rectangle",--%>
<%--                            { minSize: new go.Size(40, 40), fill: "#79C900", strokeWidth: 0 }),--%>
<%--                        $(go.TextBlock, "API", textStyle(),--%>
<%--                            new go.Binding("text"))--%>
<%--                    ),--%>

<%--                    // 左、右、下可以出，但都不可入--%>
<%--                    makePort("T", go.Spot.Top, go.Spot.Top, true, true),--%>
<%--                    makePort("L", go.Spot.Left, go.Spot.Left, true, true),--%>
<%--                    makePort("R", go.Spot.Right, go.Spot.Right, true, true),--%>
<%--                    makePort("B", go.Spot.Bottom, go.Spot.Bottom, true, true)--%>
<%--                )--%>
<%--            );--%>

<%--            // 初始化连接线的模板--%>
<%--            myDiagram.linkTemplate =--%>
<%--                $(go.Link,  // 所有连接线--%>
<%--                    {--%>
<%--                        routing: go.Link.AvoidsNodes,   // 连接线避开节点--%>
<%--                        curve: go.Link.JumpOver,--%>
<%--                        corner: 5, toShortLength: 4,    // 直角弧度，箭头弧度--%>
<%--                        relinkableFrom: true,   // 允许连线头重设--%>
<%--                        relinkableTo: true,     // 允许连线尾重设--%>
<%--                        reshapable: true,       // 允许线形修改--%>
<%--                        resegmentable: true,    // 允许连线分割（折线）修改--%>
<%--                        // 鼠标移到连线上后高亮--%>
<%--                        mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },--%>
<%--                        mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; },--%>
<%--                        selectionAdorned: false--%>
<%--                    },--%>
<%--                    new go.Binding("points").makeTwoWay(),  // 双向绑定模型中"points"数组属性--%>
<%--                    $(go.Shape,  // 隐藏的连线形状，8个像素粗细，当鼠标移上后显示--%>
<%--                        { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }--%>
<%--                    ),--%>
<%--                    $(go.Shape,  // 连线规格（颜色，选中/非选中，粗细）--%>
<%--                        { isPanelMain: true, stroke: "gray", strokeWidth: 2 },--%>
<%--                        new go.Binding("stroke", "isSelected", function(sel) { return sel ? "dodgerblue" : "gray"; }).ofObject()--%>
<%--                    ),--%>
<%--                    $(go.Shape,  // 箭头规格--%>
<%--                        { toArrow: "standard", strokeWidth: 0, fill: "gray"}--%>
<%--                    ),--%>
<%--                    $(go.Panel, "Auto",  // 连线标签，默认不显示--%>
<%--                        { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5},--%>
<%--                        new go.Binding("visible", "visible").makeTwoWay(),  // 双向绑定模型中"visible"属性--%>
<%--                        $(go.Shape, "RoundedRectangle",  // 连线中显示的标签形状--%>
<%--                            { fill: "#F8F8F8", strokeWidth: 0 }),--%>
<%--                        $(go.TextBlock, "是",  // 连线中显示的默认标签文字--%>
<%--                            {--%>
<%--                                textAlign: "center",--%>
<%--                                font: "10pt helvetica, arial, sans-serif",--%>
<%--                                stroke: "#333333",--%>
<%--                                editable: true--%>
<%--                            },--%>
<%--                            new go.Binding("text").makeTwoWay())  // 双向绑定模型中"text"属性--%>
<%--                    )--%>
<%--                );--%>

<%--            // 此事件方法由整个画板的LinkDrawn和LinkRelinked事件触发--%>
<%--            // 如果连线是从”conditional"条件节点出发，则将连线上的标签显示出来--%>
<%--            function showLinkLabel(e) {--%>
<%--                var label = e.subject.findObject("LABEL");--%>
<%--                if (label !== null) {--%>
<%--                    label.visible = (e.subject.fromNode.data.category === "Conditional");--%>
<%--                }--%>
<%--            }--%>

<%--            // 临时的连线（还在画图中），包括重连的连线，都保持直角--%>
<%--            myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;--%>
<%--            myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;--%>

<%--            // 在图形页面的左边初始化图例Palette面板--%>
<%--            myPalette =--%>
<%--                $(go.Palette, "myPaletteDiv",  // 必须同HTML中Div元素id一致--%>
<%--                    {--%>
<%--                        scrollsPageOnFocus: false,  // 图选中时页面不会滚动--%>
<%--                        nodeTemplateMap: myDiagram.nodeTemplateMap,  // 同myDiagram公用一种node节点模板--%>
<%--                        model: new go.GraphLinksModel([  // 初始化Palette面板里的内容--%>
<%--                            { category: "API", text: "YouTube Search Results" },--%>
<%--                            { category: "API", text: "Youtube To Mp3" },--%>
<%--                            { category: "API", text: "Youtube Videos" },--%>
<%--                            { category: "API", text: "youtube-screenshot" }--%>
<%--                        ])--%>
<%--                    });--%>

<%--            // var select_node = e.subject.part.data.key;--%>



<%--            // 将go模型以JSon格式保存在文本框内--%>
<%--            document.getElementById("gojsButton").addEventListener("click", function() {--%>
<%--                document.getElementById("mySavedModel").style.visibility="visible";--%>
<%--                document.getElementById("mySavedModel").value = myDiagram.model.toJson();--%>
<%--                myDiagram.isModified = false;--%>
<%--            });--%>

<%--            // 读取文本框内JSon格式的内容，并转化为gojs模型--%>
<%--            document.getElementById("composeButton").addEventListener("click", function() {--%>
<%--                document.getElementById("mySavedModel").style.visibility="visible";--%>
<%--                // myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);--%>
<%--            });--%>

<%--            // 在新窗口中将图形转化为SVG，并分页打印--%>
<%--            document.getElementById("printButton").addEventListener("click", function() {--%>
<%--                document.getElementById("mySavedModel").style.visibility="visible";--%>
<%--                var svgWindow = window.open();--%>
<%--                if (!svgWindow) return;  // 创建新窗口失败--%>
<%--                var printSize = new go.Size(700, 960);--%>
<%--                var bnds = myDiagram.documentBounds;--%>
<%--                var x = bnds.x;--%>
<%--                var y = bnds.y;--%>
<%--                while (y < bnds.bottom) {--%>
<%--                    while (x < bnds.right) {--%>
<%--                        var svg = myDiagram.makeSVG({ scale: 1.0, position: new go.Point(x, y), size: printSize });--%>
<%--                        svgWindow.document.body.appendChild(svg);--%>
<%--                        x += printSize.width;--%>
<%--                    }--%>
<%--                    x = bnds.x;--%>
<%--                    y += printSize.height;--%>
<%--                }--%>
<%--                setTimeout(function() { svgWindow.print(); }, 1);--%>
<%--            });--%>

<%--            // 点击了API后，获取到其信息，执行API测试--%>
<%--            document.getElementById("executeButton").addEventListener("click", function() {--%>
<%--                document.getElementById("mySavedModel").style.visibility="hidden";--%>
<%--                // document.getElementById("testShow").style.visibility="visible";--%>
<%--                // document.getElementById("testShow").value = select_node;--%>
<%--                // document.getElementById("responeseShow").style.visibility="visible";--%>
<%--                var url = null, xRapidapiHost = null;--%>
<%--                if(e.subject.part.data.key == "-1"){--%>
<%--                    url = "https://youtube-search-results.p.rapidapi.com/youtube-search/?q=justin%2Bbieber";--%>
<%--                    xRapidapiHost = "youtube-search-results.p.rapidapi.com";--%>
<%--                    fetchClassic(url, xRapidapiHost);--%>
<%--                }--%>
<%--                if(e.subject.part.data.key == "-2"){--%>
<%--                    url = "https://youtube-to-mp32.p.rapidapi.com/yt_to_mp3?video_id=edPREMPZ5RA";--%>
<%--                    xRapidapiHost = "youtube-to-mp32.p.rapidapi.com";--%>
<%--                    fetchClassic(url, xRapidapiHost);--%>
<%--                }--%>
<%--                if(e.subject.part.data.key == "-3"){--%>
<%--                    url = "https://youtube-videos.p.rapidapi.com/mp4?videoId=RsEZmictANA";--%>
<%--                    xRapidapiHost = "youtube-videos.p.rapidapi.com";--%>
<%--                    fetchClassic(url, xRapidapiHost);--%>
<%--                }--%>
<%--                if(e.subject.part.data.key == "-4"){--%>
<%--                    url = "https://youtube-screenshot1.p.rapidapi.com/frames/?youtube_id=UxxajLWwzqY&seconds=3";--%>
<%--                    xRapidapiHost = "youtube-screenshot1.p.rapidapi.com";--%>
<%--                    fetchClassic(url, xRapidapiHost);--%>
<%--                }--%>
<%--            });--%>

<%--            // 测试API，返回json结果--%>
<%--            function fetchClassic(url, xRapidapiHost) {--%>
<%--                fetch(url, {--%>
<%--                    method: "GET",--%>
<%--                    headers: {--%>
<%--                        "x-rapidapi-key": "8bf2a7f2f9msh678f4857e76bd45p16f005jsn25b2a7721455",--%>
<%--                        "x-rapidapi-host": xRapidapiHost--%>
<%--                        // "content-type": "application/json"--%>
<%--                    }--%>
<%--                })--%>
<%--                    .then(response => { return response.json();}) // 这一层返回的是promise--%>
<%--                    .then(function(myJson){--%>
<%--                        // $('#responeseShow').html(JSON.stringify(myJson));--%>
<%--                        var show = document.getElementById('responeseShow');--%>
<%--                        var newData = JSON.stringify(myJson, null, 4);--%>
<%--                        show.innerHTML = newData; //需要添加JSON.stringify(myJson)转为json--%>
<%--                    });--%>
<%--            }--%>
<%--        } // windows.onload--%>

<%--    </script>--%>
<%--</main>--%>
<%--</body>--%>
</html>
