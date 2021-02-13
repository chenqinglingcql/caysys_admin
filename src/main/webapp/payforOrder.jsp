<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/31
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>支付订单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
    <style>
        *{
            padding: 0px;
            margin: 0px;
        }

        .container{
            width:1255px;
            height:auto ;
            position: relative;
            margin: 0px auto;
        }

        .info{
            margin-left: 42px;
            height: auto;

        }

        span{
            line-height: 25px;
            font-size: 15px;
            color: #9F9F9F;
            font-family: 新宋体;
        }

        .search_index{
            background-color: #009688;
        }
        /*太湖图片*/
        .taihu{
            width:1215px;
            height: 300px;
            background:url("img/taihu2.jpg") no-repeat  ;
            background-size: 100%;
        }.goupiaoxuzhi{
             padding:10px;
             background: none;
             border:none;
             color: whitesmoke;
         }
        .goupiaoxuzhi:hover{
            color: white;
            box-shadow: grey;

        }
        .help{
            padding: 10px 10px;
            float: right;
            margin-top: -100px;
            margin-right: 500px;
        }
        p,p>span{
            color: whitesmoke;
        }
        p>span>img{
            width:35px;
            height: 35px;
        }
        th{
           text-align: center;
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
        <div class="info">

            <div  class="taihu">
            </div>
            <%--购票须知--%>
            <div class="search_index">
                <div>
                    <p><img src="img/logo_wuxi.png" style="height: 60px;padding: 10px" ></p>
                    <p><input type="button" onclick="goupiaoxuzhi()" value=">>>【网上购票须知】<<<" class="goupiaoxuzhi" ></p>
                </div>
                <div class="help">

                    <p>
                        <span><img src="img/shubiao.png">选择客票</span>
                        <span><img src="img/denglu.png">登录</span>
                        <span><img src="img/tijiaoziliao.png">填写资料</span>
                        <span><img src="img/zhifu.png">网上支付</span>
                        <span><img src="img/shouye.png.png">购票完成</span>
                    </p>
                    <p style="padding:15px;font-size: 16px">购票流程</p>
                </div>

            </div>
            <form class="form-horizontal" id="orderForm" style="margin-top: 5px; margin-left: 150px;" action="${path}/order?method=confirmOrder" method="post">

            </form>
            <%--表格--%>
            <div class="table">
                <table class="layui-table"  style="text-align: center;padding: 0px">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>车票编号</th>
                        <th>起始点</th>
                        <th>终点站</th>
                        <th>日期</th>
                        <th>发车时间</th>
                        <th>车次</th>
                        <th>车型</th>
                        <th>检票站台</th>
                        <th>座位号</th>
                        <th>汽车票状态</th>
                        <th>票价</th>
                        <th>汽车票类型</th>
                        <th>乘车人姓名</th>
                        <th>乘车人身份证号</th>
                        <th>是否购买保险</th>
                        <th>是否携带儿童</th>
                    </tr>
                    </thead>
                   <%-- <c:forEach items="${orders.itemList}" var="orderItem">--%>
                        <tbody>
                            <tr>
                                <td>${order.order_id}</td>
                                <td>${order.depart_station}</td>
                                <td>${order.dest_station}</td>
                                <td>${order.depart_date}</td>
                                <td>${order.depart_time}</td>
                                <td>${order.ticket_id}</td>
                                <td>${order.bus_type}</td>
                                <td>${order.checkout_id}</td>
                                <td>${order.seat_id}</td>
                                <td>${order.ticket_status}</td>
                                <td>￥${order.ticket_price}元</td>
                                <td>${order.ticket_type}</td>
                                <td>${order.name}</td>
                                <td>${order.person_id}</td>
                                <td>${order.insurance}</td>
                                <td>${order.if_taken_children}</td>
                            </tr>
                        </tbody>
                    <%--</c:forEach>--%>
                </table>
            </div>
            <div style="text-align: right; margin-right: 120px;">
                订单总金额: <strong style="color: #ff6600;">￥${order.ticket_price}元</strong>
            </div>

            <hr />

            <div style="margin-top: 5px; margin-left: 150px;">
                <strong>选择银行：</strong>
                <p>
                    <br />
                    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />
                    工商银行 <img src="./bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />
                    中国银行 <img src="./bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />
                    农业银行 <img src="./bank_img/abc.bmp" align="middle" /> <br /> <br />
                    <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />
                    交通银行 <img src="./bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />
                    平安银行 <img src="./bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />
                    建设银行 <img src="./bank_img/ccb.bmp" align="middle" /> <br /> <br />
                    <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />
                    光大银行 <img src="./bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />
                    招商银行 <img src="./bank_img/cmb.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="alipay" />
                    支付宝&nbsp;&nbsp;<img src="./bank_img/alipay.jpg" align="middle" width="150px" height="30px" />
                </p>

                <p style="text-align: right; margin-right: 100px;">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                        <img src="./img/finalbutton.gif" width="204" height="51" border="0" />
                    </a>
                </p>
            </div>

        </div>
    </div>
    <%--尾部--%>
    <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>



</div>

<script src="../layui/layui.js"></script>
<%--购票须知弹窗--%>
<script>
    /*日期插件*/
    layui.use('laydate',function () {
        var laydate=layui.laydate;
        laydate.render({
            elem:'#laydate'
        });
    });
    /*购物须知弹窗*/
    function goupiaoxuzhi() {
        layui.use('layer',function () {
            var layer=layui.layer;
            layer.open({
                type:1,
                /*按钮*/
                btn:['确认'],
                /*按钮居中放置*/
                btnAlign:'c',
                title:'网上购票须知',
                /*弹出动画：1 从上到下 5：渐显*/
                anim:5,
                /*是否出现滚动*/
                scrollbar:true,
                /*是否显示关闭按钮*/
                closeBtn:1,
                area:['400px','500px'],
                content:'<div style="padding: 20px">\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">一、购票范围</div>\n' +
                    '            <span>本网站购票系统24小时为您提供无锡客运有限公司所属无锡汽车客运站、新世纪站、无锡华东城、无锡招商城等始发的各线客票（有特殊通知时除外），网上售票日期为网上出现的可售票日期。目前本网站仅发售普通客票，不发售军票等优惠票，如需购买请带好相关证件到车站售票窗口购买。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">二、订票提交</div>\n' +
                    '            <span>当您在确认购票张数后，请您填写正确的个人信息（姓名、联系方式）以便于在班次变动时能及时与您取得联系。由于网上发售的客票资源有限，您需购买的客票超过限额时，请您拨打客服热线：0510-82588188，我们会给您提供及时的帮助！网上购票系统限购当前时间二小时后的客票。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">三、付款时限</div>\n' +
                    '            <span> 订票成功后请在10分钟内付款，否则系统将自动取消您的订票。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">四、购买流程</div>\n' +
                    '            <span>本网站购票可通过银联、支付宝和移动手机三种方式支付，旅客在订票成功后即可向本网站提交购票申请， 10分钟内选择以上三种支付方式中的任何一种完成支付，网站在得到银行的确认消息后，将正式为购票者记账，并将购票成功的信息反馈，同时给出《行程单》，请您务必按照操作流程及时记录您的订单号和取票密码，然后打印行程单，凭行程单或订单号可直接到检票口检票乘车！</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；"> 五、取票办法</div>\n' +
                    '            <span>您可以使用行程单或订单号直接到检票口检票上车，如需换取客票，凭网上购票时系统给出的订单号和取票密码到下列地点换取客票。换取客票后需凭客票乘车，原行程单自动作废。您的购票订单号和取票密码请注意保密，如由于您的泄密造成损失，本站概不负责。</span>\n' +
                    '        </p>\n' +
                    '    </div>'
            })
        });
    }
</script>
</body>
</html>
