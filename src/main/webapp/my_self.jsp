<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看个人信息</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/validate.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

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
        color: #009688;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
    }

    .error{
        color:red;
    }
    .form-group>div>input,.form-group>label{
        margin-left: 60px;
    }

    .uimage_border{
        position: relative;
        margin-left: 230px;
        width:90px;
        height: 90px;
        padding:2px;
        background: #ececec;
        border-radius:90px;
        box-shadow: 0px 0px 1px rgba(0,0,0,0.4);
        -moz-border-radius: 50px;


    }


    .uimage{
        width:90px;
        height:90px;
        line-height: 0;	/* remove line-height */
        display: inline-block;	/* circle wraps image */
        border-radius: 50%;	/* relative value */
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        transition: linear 0.25s;
    }

    .info{
        margin-top: 12px;
        font-size: 15px;
        font-family: 新宋体;
        margin-left: 40px;
    }
    /*太湖图片*/
    .taihu{
        width:1215px;
        height: 200px;
        background:url("img/taihu3.jpg") no-repeat ;
        margin-left: 184px;
        background-size: 100%;
        opacity: 70%;

    }

    /*用户头像*/
    .userimage{
        position: relative;
        margin-top: -100px;
    }
    /*用户昵称*/
    .user_name>div{
        position: relative;
        margin-top: -70px;
        margin-left: 350px;
        font-weight: bold;
        color: #009688;

    }

</style>
</head>
<body>

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />


<div class="container" style="width: 100%;">
    <!-- 引入header.jsp -->
    <div>
        <jsp:include page="/header.jsp"></jsp:include>
    </div>

    <div class="row" >
        <div  class="taihu"></div>
        <div class="col-md-8"
             style="background: #fff;position:relative; margin-left: 40px;margin-top: 10px; ">
            <div>&nbsp;</div>
            <form id="myForm" class="form-horizontal"  method="post" style="position:relative; margin-left: 100px   " action="edit_self.jsp">
                <div class="form-group userimage">
                    <div class="uimage_border">
                        <img id="uimage" class="uimage" name="uimage" width="64px" height="auto" src="${user.uimage}" />
                    </div>
                </div>

                <div class="form-group user_name">
                    <div class="info">欢迎&nbsp;${user.username}</div>
                </div>

                <div>
                    <%--垂直导航栏--%>
                    <div style="position:relative; margin-left: 25px;height: auto">
                        <ul class="layui-nav layui-nav-tree layui-bg-green" lay-filter="test">
                            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                            <li class="layui-nav-item layui-nav-itemed">
                                <a href="javascript:;">基本资料</a>
                                <dl class="layui-nav-child">
                                    <dd><a href="edit_self.jsp">修改个人信息</a></dd>
                                    <dd><a href="edit_password.jsp">修改密码</a></dd>
                                </dl>
                            </li>
                            <li class="layui-nav-item">
                                <a href="/order?method=viewMyOrders">我的订单</a>
                            </li>

                        </ul>
                    </div>
                    <div style="position:relative;margin-left: 250px;margin-top: -180px">
                        <%--基本信息展示--%>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-6 info">
                                    ${user.name}
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">身份证号</label>
                                <div class="col-sm-6 info">
                                    ${user.person_id}
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-6 info">
                                    ${user.email}
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-6 info">
                                    ${user.telephone}
                                </div>
                            </div>


                            <div class="form-group opt">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-6 info">
                                    ${user.sex}
                                </div>
                                <%-- 出现错误信息 --%>
                                <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">出生日期</label>
                                <div class="col-sm-6 info">
                                    ${user.birthday}
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="submit" width="100px" value="修改个人信息"
                                       style="background-color: #009688; height: 35px; width:100px;margin-left: 250px; color: white">

                            </div>
                    </div>
                </div>
            </form>


            <c:if test="${msg!=null}">
                <script>
                    alter("${msg}");
                </script>

            </c:if>
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
<script type="text/javascript">
    //将文件流以url形式读取，实现图片实时显示：
    function showPreview(source){
        var file = source.files[0];
        if(window.FileReader){
            var fr = new FileReader();
            fr.onloadend = function(e){
                document.getElementById("uimage").src=e.target.result;
            }
            fr.readAsDataURL(file);
        }
    }
</script>


</html>




