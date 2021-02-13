<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/31
  Time: 13:59
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
        width:950px;
    }

    span{
        line-height: 25px;
        font-size: 15px;
        color: #9F9F9F;
        font-family: 新宋体;
    }
    .title{
        line-height: 30px;
        font-size: 16px;
        color: dimgrey;
    }



</style>
<body>
<div class="container">
    <%--头部--%>
    <div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <%--主体--%>
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
                        <dd><a href="ticketList.jsp">班车时刻表</a></dd>
                        <dd><a href="">班线景点推荐</a></dd>
                        <dd><a href="info.jsp">乘客须知</a></dd>
                        <dd><a href="">城市交通地图</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">常见问题</a></li>
            </ul>
        </div>
        <div class="info">
            <p>
            <div class="title"> 一、购票提醒</div>
            <span>1、成人及身高超过1.50米的儿童购买全价票。持一张全价票的旅客可免费携带1.20米以下儿童一人乘车，但不供给座位。携带免费乘车儿童超过一人或者要求供给座位时，须购买儿童票。</span>
            <span>2、身高1.20—1.50米的儿童乘车购买儿童票，供给座位。革命伤残军人、因公致残的人民警察乘车分别凭《中华人民共和国残疾军人证》、《中华人民共和国伤残人民警察证》购买优待票，享受全价票旅客待遇。儿童票和优待票优待票按照具体执行票价的50％计算。</span>
            <span>3、执行防汛、抢险、救灾等紧急任务的人员，以及新闻记者、军人、劳动模范、教师等可优先购票。</span>
            <span>4、购票时应仔细核对所购客票的车次、乘车日期、开车时间、到达站名和票价等内容，并且当面点清票款。如有差错，应立即向售票员核实纠正。</span>　　
            </p>
            <br>
            <p>
            <div class="title">二、窗口设置</div>
            <span>1、汽车客运站售票大厅设在二楼。共设有45个售票窗，其中1号为退票窗，各售票窗均可发售各线客票。</span>
            <span>2、车站票窗售票时间为早上5：30，晚上至22：00，（节假日相应调整）</span>
            <span>3、汽车客运站候车大厅内设绿色通道应急补票窗，设在三楼42号检票门旁，发售1小时内各线客票。如果您需乘坐的班车即将发车，可直接到补票窗补票上车。</span>
            <span>4、本站在市内设有100多个售票代售点，您可就近到各代售点购票。(详情请查询客票网点)</span>
            　 　
            </p>
            <br>
            <p>
            <div class="title">三、联网售票</div>
            <span>1、无锡汽车客运站和各售票代售点间实行电脑联网售票，您可在任何一个窗口或代售点，购买无锡汽车客运站的各线客票。</span>
            <span>2、各售票窗和市内各代售点均可预售15天内各线客票，节运期间客票预售天数请留意车站公告。</span>
            　 　
            </p>
            <br>
            <p>
            <div class="title">四、实名制购票</div>
            <span>根据《道路旅客运输及客运站管理规定》，无锡汽车客运站自2017年3月1日起实施实名制售票、乘车，现将实名制售票、乘车有关事项公告如下：</span>
            <span>1、旅客窗口购票时，请主动出示乘车人有效身份证件；携带半票儿童、免票儿童的旅客请携带好户口簿。旅客通过网络平台购票时，请认真核对有效身份证件的姓名、号码等信息，以备查验。</span>
            <span>2、实名制验证乘车时，乘车人请主动出示本人的有效身份证件，车票所载明的旅客身份信息与有效身份证件原件信息及旅客本人不一致的，不得乘车。</span>
            　　
            </p>

        </div>
    </div>
    <%--尾部--%>
    <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>

</div>

</body>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</html>
