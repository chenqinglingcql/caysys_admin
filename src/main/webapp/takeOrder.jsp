<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>在线预定</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/validate.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
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
             style="background: #fff;position:relative; margin-left: 80px;margin-top: 10px; ">
            <font style="margin-left: 350px;font-size: large;">在线预定</font>
            <div>&nbsp;</div>
            <form id="takeOrderForm" class="form-horizontal" action="/order?method=takeOrder&ticket=${requestScope.ticket}" style="margin-top: 5px;" method="post">
                <div class="form-group">
                    <label for="depart_date" class="col-sm-2 control-label">日期</label>
                    <div class="col-sm-6">
                        <input type="text"readonly class="form-control" id="depart_date" name="depart_date" value="${requestScope.ticket.depart_date}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_time" class="col-sm-2 control-label">出发时间</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="depart_time" name="depart_time" value="${requestScope.ticket.depart_time}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_station" class="col-sm-2 control-label">始发站</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="depart_station" name="depart_station" value="${requestScope.ticket.depart_station}" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="dest_station" class="col-sm-2 control-label">终点站</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="dest_station" name="dest_station" value="${requestScope.ticket.dest_station}" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">乘车人姓名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="person_id" class="col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="person_id" name="person_id">
                    </div>
                </div>

                <div class="form-group">
                    <label for="telephone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input type="tel" class="form-control" id="telephone" name="telephone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket_type1" class="col-sm-2 control-label">车票类型</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" id="ticket_type1" name="ticket_type" value="1">全票
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="ticket_type2" name="ticket_type" value="0.5">半票
                        </label>
                    </div>
                </div>

                <div class="form-group opt">
                    <label for="insurance1" class="col-sm-2 control-label">是否购买保险</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" id="insurance1" name="insurance" value="true">是
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="insurance2" name="insurance" value="false">否
                        </label>
                    </div>
                    <%-- 出现错误信息 --%>
                    <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
                </div>
                <div class="form-group opt">
                    <label for="if_take_children1" class="col-sm-2 control-label">是否携带儿童</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" id="if_take_children1" name="if_take_children" value="true">是
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="if_take_children2" name="if_take_children" value="flase">否
                        </label>
                    </div>
                    <%-- 出现错误信息 --%>
                    <%--<lable for="sex" class="error" style="display:none">必选</lable>--%>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="提交订单"
                               style="background-color: #009688; height: 35px; width: 100px;margin-left: 200px;  color: white;">
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
</html>




