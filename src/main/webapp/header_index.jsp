<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/31
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    *{
        padding: 0px;
        margin: 0px;
    }

    .container{
        width:1220px;
        height:680px ;
        position: relative;
        margin: 0px auto;
    }
    .index{
        float: left;
    }
    .info{
        float: right;
        height: 600px;
        background-color: #00F7DE;
        width:950px;
    }

    span{
        line-height: 25px;
        font-size: 15px;
        color: #9F9F9F;
        font-family: 新宋体;
    }


</style>
<body>
<div class="container">
    <%--头部--%>
    <div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>
     <%--主体--%>
    <div>
        <div class="main">
            <div class="index" style="margin-left: 25px;">
                <ul class="layui-nav layui-nav-tree layui-bg-green" lay-filter="test">
                    <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">最近活动</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">客运动态</a></dd>
                            <dd><a href="javascript:;">车站资讯</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">客运服务</a>
                        <dl class="layui-nav-child">
                            <dd><a href="">班车时刻表</a></dd>
                            <dd><a href="">班线景点推荐</a></dd>
                            <dd><a href="">乘客须知</a></dd>
                            <dd><a href="">城市交通地图</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="">常见问题</a></li>
                </ul>
            </div>
        </div>
        <div class="info">

        </div>


    </div>
        <%--尾部--%>
    <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>

</body>
</html>
