<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            /*background-color: #009688;*/
        }
    </style>
</head>

<body>

<c:set value="${pageContext.request.contextPath}" scope="application" var="path"></c:set>
<div class="header"  style="background-color: #009688">
    <div class="layui-container layui-bg-green">
        <div class="layui-row " style="width: 1200px;">
            <div class="layui-col-xs9 layui-col-sm6 layui-col-md9">
                <ul class="layui-nav layui-bg-green" lay-filter="">
                    <li class="layui-nav-item"><a href="index.jsp">首页</a></li>
                    <li class="layui-nav-item">
                        <a href="info.jsp">客运服务</a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                            <dd><a href="ticketList.jsp">在线预定</a></dd>
                            <dd><a href="">经营路线</a></dd>
                            <dd><a href="">班线旅游景点推荐</a></dd>
                            <dd><a href="">城市地图</a></dd>
                            <dd><a href="">乘客须知</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="">常见问题</a></li>
                    <li class="layui-nav-item"><a href="info.jsp">乘客须知</a></li>
                </ul>
            </div>
            <div class="layui-col-xs2 layui-col-sm6 layui-col-md3" >

                <ul class="layui-nav layui-bg-green">
                   <%-- <li class="layui-nav-item">
                        <a href="">控制台<span class="layui-badge">9</span></a>
                    </li>--%>
                    <c:if test="${sessionScope.user==null}">
                        <li class="layui-nav-item">
                            <a href="login.jsp">登录</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="regist.jsp">注册</a>
                        </li>
                    </c:if>
                   <%--从会话中获取user对象，不为空则表明--%>
                    <c:if test="${sessionScope.user!=null}">
                        <li class="layui-nav-item">
                            <a href=""><img src="${sessionScope.user.uimage}" class="layui-nav-img">我</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/order?method=viewMyOrders">我的订单</a></dd>
                                <dd><a href="/user?method=viewMySelf">个人中心<span class="layui-badge-dot"></span></a></dd>
                                <dd><a href="edit_self.jsp">修改信息</a></dd>
                                <dd><a href="${path}/user?method=logout">退了</a></dd>
                            </dl>
                        </li>
                    </c:if>

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
