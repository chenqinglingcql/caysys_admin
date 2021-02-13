<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/validate.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">

<style>
    body {
        margin-top: 20px;
        margin: 0 auto;
    }

    .carousel-inner .item img {
        width: 100%;
        height: 300px;
    }

    font {
        color: #3164af;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
    }

    .error{
        color:red;
    }
</style>
</head>
<body>

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />


<div class="container" style="width: 100%; background: url('#');">
    <!-- 引入header.jsp -->
    <div>
        <jsp:include page="/header.jsp"></jsp:include>
    </div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 40px; margin: 30px; border: 7px solid #ccc;">
            <font style="margin-left: 250px;font-size: large">用户注册</font>
            <div>&nbsp;</div>
            <form id="registForm" class="form-horizontal" action="/user?method=regist" style="margin-top: 5px;" method="post">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="username" name="username" placeholder="请输入昵称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="confirmpwd" name="confirmpwd" placeholder="请输入确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入真实姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="person_id" class="col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="person_id" name="person_id" placeholder="请输入有效身份证号">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input type="tel" class="form-control" id="telephone" name="telephone" placeholder="请输入联系方式">
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-2 control-label">地址</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="address" name="address" placeholder="请输入地址">
                    </div>
                </div>

                <div class="form-group opt">
                    <label for="sex1" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" id="sex1" name="sex" value="男">男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="sex2" name="sex" value="女">女
                        </label>
                    </div>
                    <%-- 出现错误信息 --%>
                    <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="birthday" name="birthday" >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="注册"
                               style="background-color: #009688; height: 35px; width: 100px; color: white;">
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>



    <!-- 引入footer.jsp -->
    <div class="footer" >
        <jsp:include page="footer.jsp"></jsp:include>
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




