<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/2/6
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆界面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
</head>
<style>

    .login{
        width: 445px;
        border: 1px solid #E7E7E7;
        border-radius: 5px;
        margin-bottom: 200px;
        margin-left: 500px;
        background: #fff;
        position: center;
    }
</style>
<body style="background-image: url(img/2.jpg)" >
<div class="login"  >
    <font style="margin-left: 120px;">用户登录</font>
    <div>&nbsp;</div>
    <form class="form-horizontal"  method="post"  action="/user?method=login" >
        <div class="form-group">
            <label for="telephone" class="col-sm-2 control-label" style="text-align: center;">账号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="telephone" name="telephone" placeholder="请输入手机号/身份证号" style="width: 250px;height: 37px;">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label" style="text-align: center">密码</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" style="width: 250px;height: 37px;">
            </div>
        </div>
        <c:if test="${msg}!=null">
            <div class="form-group">
                <div class="col-sm-6">
                    <span id="msg" style="color: red">${msg}</span>
                </div>
            </div>
        </c:if>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"  name="free" value="free"> 自动登录
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label>
                        <input type="checkbox" name="remember" value="remember"> 记住用户名
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" width="100" value="登录" name="submit" style="background-color: #009688; height: 35px; width: 100px; color: white;margin-left: 40px;">
            </div>
        </div>
    </form>
</div>

<div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>



</body>
<script src="layui/layui.js"></script>

</html>
