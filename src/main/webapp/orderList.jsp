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
    <title>我的订单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
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


        p,p>span{
            color: whitesmoke;
        }
        p>span>img{
            width:35px;
            height:35px;
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

            <%--表格--%>
            <div class="table">
                <table class="layui-table"  style="text-align: center;padding: 0px" title="我的订单">
                    <c:if test="${msg!=null}">
                        <script>
                            alert("${msg}");
                        </script>
                    </c:if>

                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr class="title">
                        <th style="text-align: center;">订单编号</th>
                        <th style="text-align: center;">出发日期</th>
                        <th style="text-align: center;">出发时间</th>
                        <th style="text-align: center;">班次</th>
                        <th style="text-align: center;">车型</th>
                        <th style="text-align: center;">起始站</th>
                        <th style="text-align: center;">目的地</th>
                        <th style="text-align: center;">检票窗口</th>
                        <th style="text-align: center;">车票状态</th>
                        <th style="text-align: center;">车票类型</th>
                        <th style="text-align: center;">车票价格</th>
                        <th style="text-align: center;">乘车人姓名</th>
                        <th style="text-align: center;">身份证号码</th>
                        <th style="text-align: center;">联系方式</th>
                        <th style="text-align: center;">座位号</th>
                        <th style="text-align: center;">是否购买保险</th>
                        <th style="text-align: center;">是否携带儿童</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%--若查询无结果，则显示图片--%>
                    <c:if test="${requestScope.vo.list.size()==0}">
                        <div >
                            <img style="width:450px;height: 450px;margin-left: 350px" src="img/notfound.png">
                        </div>
                    </c:if>
                    <%--查询结果不为空--%>
                    <c:if test="${requestScope.vo.list.size()!=0}">
                        <%--表格--%>
                        <div class="table" style="margin: 0px">
                            <table class="layui-table"  style="text-align: center">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>

                                <tbody>
                                <c:forEach items="${requestScope.vo.list}" var="order">
                                    <tr>
                                        <td>${order.order_id}</td>
                                        <td>${order.depart_date}</td>
                                        <td>${order.depart_time}</td>
                                        <td>${order.ticket_id}</td>
                                        <td>${order.bus_type}</td>
                                        <td>${order.depart_station}</td>
                                        <td>${order.dest_station}</td>
                                        <td>${order.checkout_id}</td>
                                        <td>${order.ticket_status}</td>

                                            <c:if test="${order.ticket_type=='1'}">
                                            <td>全票</td>
                                            </c:if>
                                            <c:if test="${order.ticket_type=='0'}">
                                                半票
                                            </c:if>

                                        <td>${order.ticket_price}</td>
                                        <td>${order.name}</td>
                                        <td>${order.person_id}</td>
                                        <td>${order.telephone}</td>
                                        <td>${order.seat_id}</td>
                                        <td>
                                            <c:if test="${order.insurance}==0}">
                                                否
                                            </c:if>
                                            <c:if test="${order.insurance}==1}">
                                                是
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${order.if_taken_children}==0}">
                                            否
                                        </c:if>
                                            <c:if test="${order.if_taken_children}==1}">
                                                是
                                            </c:if>

                                        </td>

                                        <td>
                                            <input type="button" value="改签" style="background-color: #00ad9f; width:60px;height:30px;color: whitesmoke"  onclick="viewOneorder('${path}','${order.order_id}')">
                                            <input type="button" value="退票" style="background-color: #00ad9f; width:60px;height:30px;color: whitesmoke" id="delete" onclick="deleteOrder('${path}','${order.order_id}')" >
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div style="width: 380px;margin:0px auto">
                            <ul class="pagination" style="text-align: center;">
                                <!--分页 -->
                                    <%-- 若在第一页，则不可以点击上一页 --%>
                                <c:if test="${vo.pageNow == 1}">
                                    <li class="disabled">
                                        <a href="JavaScript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                    </li>
                                </c:if>
                                    <%-- 若不在第一页，则可以点击上一页 --%>
                                <c:if test="${vo.pageNow != 1}">
                                    <li>
                                        <a href="/order?method=viewMyOrders&pageNow=${vo.pageNow-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                    </li>
                                </c:if>



                                <c:forEach begin="1" end="${vo.myPages}" var="page">

                                    <%--  若当前页码pageNow正好是page，则显示被点击的状态 --%>
                                    <c:if test="${vo.pageNow == page}">
                                        <li class="active">
                                            <a href="JavaScript:void(0)">${page}</a>
                                        </li>
                                    </c:if>

                                    <%--  若当前页码pageNow不是page，则显示可以点击的状态 --%>
                                    <c:if test="${vo.pageNow != page}">
                                        <li>
                                            <a href="/order?method=viewMyOrders&pageNow=${page}">${page}</a>
                                        </li>
                                    </c:if>

                                </c:forEach>


                                    <%-- 若在最后一页，则不可以点击下一页 --%>
                                <c:if test="${vo.pageNow == vo.myPages}">
                                    <li class="disabled">
                                        <a href="JavaScript:void(0)" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
                                    </li>
                                </c:if>

                                    <%-- 若不在最后一页，则可以点击下一页 --%>
                                <c:if test="${vo.pageNow != vo.myPages}">
                                    <li>
                                        <a href="/order?method=viewMyOrders&pageNow=${vo.pageNow+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </c:if>
                    <!-- 分页结束 -->

                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <%--尾部--%>
    <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>



</div>

<script src="layui/layui.js"></script>
<script>
    //删除单个商品
    function deleteOrder(url,order_id) {
        $.ajax({
            type:"get",
            url:url+"/order?method=deleteOrder&order_id="+order_id,
            success:function(rs){
                $(".info").html(rs);
            }
        });


    };

    /*改签*/
    function viewOneorder(url,order_id) {
        $.ajax({
            type: "post",
            url: url+"/order?method=viewOneOrder&order_id="+order_id,
            success:function (rs) {
                $("body").html(rs);
            }

        });
    }
</script>

</body>
</html>
