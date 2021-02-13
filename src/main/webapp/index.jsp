<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
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
            height: 500px;
        }
        font {
            color: #666;
            font-size: 22px;
            font-weight: normal;
            padding-right: 17px;
        }

        .search{
            position: relative;
            margin-top: 30px;
            margin-left: 180px;
            padding-left: 20px;
            display: inline-block;
            width: 450px;
            border: 1px solid #E7E7E7;
            border-radius: 5px;
            background: #fff;

        }
        #test1{
            position: relative;
            margin-left: 680px;
            margin-top:-280px;
            display: inline-block;
        }
        .adv_body{
            width: 800px;
            height: auto;
            margin-left: 200px;
            border: #1b6d85;
            border-radius: 15px;
        }

        .advs1{
            width:500px;
            height: auto;
            font-size: 14px;
            line-height: 20px;
            float: left;
            margin-top: -260px;

        }
        .advs2{
            width:500px;
            height:auto;
            font-size: 14px;
            line-height: 20px;
            float: right;
            margin-top: -260px;
            margin-right: -300px;
        }
        .advs_title{
            width: 300px;
            height: 45px;
            vertical-align: center;
            background: -webkit-gradient(linear,left top ,right bottom, from(#00a89a), to(white));
           /* background-color: #009688;*/
            border-radius: 30px;
            padding: 10px;
            color: whitesmoke;
            line-height: 25px;
            font-size: 18px;
        }
        a{
            color: #9F9F9F;
            text-decoration: none;
        }
        a:hover{
            text-decoration: darkgrey;
            text-decoration-line: underline;

        }


    </style>

</head>
<body>
<div class="header">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<%--头部--%>
<c:set value="${pageContext.request.contextPath}" scope="application" var="path"></c:set>
<%--中间--%>
<div>
    <div class="container"
         style="width: 100%; height: 600px;">
        <div class="row">
            <div >
                <div class="search" >
                    <font style="margin-left: 120px">快速查询</font>
                    <div>&nbsp;</div>
                    <form class="form-horizontal"  method="post"  action="/ticket?method=viewTicketByDepartDest">
                        <div class="form-group">
                            <label for="depart_city" class="col-sm-2 control-label" style="width:100px;text-align: center" >出发城市</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="depart_city" name="depart_city" placeholder="请输入出发城市" style="width: 250px;height: 37px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="dest_city" class="col-sm-2 control-label"  style="width:100px;text-align: center" >到达城市</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="dest_city" name="dest_city" placeholder="请输入到达城市" style="width: 250px;height: 37px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="depart_date" class="col-sm-2 control-label"  style="width:100px;text-align: center">出发日期</label>
                            <div class="col-sm-6">
                                <input type="date" class="form-control" id="depart_date" name="depart_date" style="width: 250px;height: 37px;">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" width="100" value="搜索" name="submit" style="background-color: #009688; height: 35px; width: 100px; color: white;margin-left: 60px;margin-top: 15px" >
                            </div>
                        </div>
                    </form>
                </div>
                <%--轮播图--%>
                <div class="layui-carousel" id="test1">
                    <div carousel-item>
                        <div><img src="img/120200805203059155704.jpg"></div>
                        <div><img src="img/taihu.jpg" ></div>
                        <div><img src="img/w.jpg" ></div>
                        <div><img src="img/w3.jpg"></div>
                        <div><img src="img/w4.jpg"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--新闻--%>
<div class="adv_body">
    <div class="advs1">
        <div class="advs_title">&nbsp;&nbsp;&nbsp;&nbsp;车站咨询&gt;&gt;&gt;</div>
        <%--面板--%>
        <div class="layui-collapse" style="border: none; ">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="background-color: white;">七旬老人车站迷路 员工热心帮助老人回...</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">疫情防控再加码，应急演练筑防线</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">为莘莘学子保驾护航 庚子年校园接送业...</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">无锡汽车客运站下客区防疫设施升级改造</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">凝聚点滴爱心 温暖弱势群体</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">市总领导慰问客运一线员工</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
        </div>
    </div>
    <div class="advs2">
        <div class="advs_title">&nbsp;&nbsp;&nbsp;&nbsp;客运动态&gt;&gt;&gt;</div>
        <%--面板--%>
        <div class="layui-collapse" style="border: none; ">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="background-color: white;">七旬老人车站迷路 员工热心帮助老人回...</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">疫情防控再加码，应急演练筑防线</h2>
                <div class="layui-colla-content ">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">为莘莘学子保驾护航 庚子年校园接送业...</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">无锡汽车客运站下客区防疫设施升级改造</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">凝聚点滴爱心 温暖弱势群体</h2>
                <div class="layui-colla-content ">内容区域</div>
            </div>
            <div class="layui-colla-item" style="border: none; ">
                <h2 class="layui-colla-title" style="background-color: white;">市总领导慰问客运一线员工</h2>
                <div class="layui-colla-content">内容区域</div>
            </div>
        </div>
    </div>
</div>
<div>
    <jsp:include page="footer.jsp"></jsp:include>

</div>
</body>
<script src="layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,arrow: 'always' //始终显示箭头
            ,width:'700px'
            //,anim: 'updown' //切换动画方式
        });
    });
</script>

</html>
