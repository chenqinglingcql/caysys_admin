<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/24
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>header</title>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <style>

        .header{
            padding: 0px;
            margin: 0px;
        }
    </style>
</head>

<body>
<div class="header">
    <div class="layui-container layui-bg-green">
        <div class="layui-row ">
            <div class="layui-col-xs9 layui-col-sm6 layui-col-md9">
                <ul class="layui-nav layui-bg-green" lay-filter="">
                    <li class="layui-nav-item"><a href="">最新活动</a></li>
                 <%--   <li class="layui-nav-item layui-this"><a href="">产品</a></li>
                    <li class="layui-nav-item"><a href="">大数据</a></li>--%>
                    <li class="layui-nav-item">
                        <a href="javascript:;">票务查询</a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                            <dd><a href="">汽车票网上订票</a></dd>
                            <dd><a href="">汽车时刻表</a></dd>
                            <dd><a href="">汽车站</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="">常见问题</a></li>
                </ul>
            </div>
            <div class="layui-col-xs3 layui-col-sm6 layui-col-md3">
                <ul class="layui-nav layui-bg-green">
                   <%-- <li class="layui-nav-item">
                        <a href="">控制台<span class="layui-badge">9</span></a>
                    </li>--%>
                    <li class="layui-nav-item">
                        <a href="">个人中心<span class="layui-badge-dot"></span></a>
                    </li>
                    <li class="layui-nav-item">
                        <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">修改信息</a></dd>
                            <dd><a href="javascript:;">安全管理</a></dd>
                            <dd><a href="javascript:;">退了</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


</body>
<script src="../layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>

</html>
