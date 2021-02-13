package com.igeek.carsys.controller;

import com.igeek.carsys.entity.*;
import com.igeek.carsys.service.BusService;
import com.igeek.carsys.service.OrderService;
import com.igeek.carsys.service.PassengerService;
import com.igeek.carsys.service.TicketService;
import com.igeek.carsys.utils.CommonUtils;
import com.igeek.carsys.vo.PageVO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "OrderServlet",urlPatterns ="/order")
public class OrderServlet extends BaseServlet {
    private OrderService orderService=new OrderService();
    private BusService busService=new BusService();
    private TicketService ticketService=new TicketService();
    private PassengerService passengerService=new PassengerService();

    //提交订单
    public void takeOrder(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {


        //汽车对象
        //根据出发站、目的地、出发时间查询车辆
        String depart_station = request.getParameter("depart_station");
        String dest_station = request.getParameter("dest_station");
        String depart_time = request.getParameter("depart_time");
        //查询车辆 属性对象
        Bus bus = busService.selectByDepartDest(depart_station,dest_station,depart_time);


        //设置Passenger属性
        //新建passenger属性对象
        String name = request.getParameter("name");
        String person_id = request.getParameter("person_id");
        String telephone = request.getParameter("telephone");
        Long pPerson_id=null;
        Passenger passenger=null;
        try {
            pPerson_id= Long.valueOf(person_id);
        }catch (Exception e){

        }finally {
           passenger= new Passenger(name,pPerson_id , telephone);
        }


        //设置ticket属性
        //设置出发日期
        String date = request.getParameter("depart_date");
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
        Date depart_date=null;
        try {
           depart_date= sdf2.parse(date);
        }catch (Exception e){

        }
        Ticket ticket = ticketService.viewTicketDepartDestTime(depart_station, dest_station, depart_date, depart_time);

        //从会话获取user对象，并获取用户user_id
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        Order order=new Order(bus,passenger,ticket,user.getUid());
        //设置订单编号
        order.setOrder_id(CommonUtils.getUUID().replaceAll("-",""));
        //设置订单生成时间  系统当前时间
        order.setOperate_time(new Timestamp(System.currentTimeMillis()));
        //设置座位号
        order.setSeat_id(new Random().nextInt(45));
        //设置车票状态
        order.setTicket_status("未付款");
        //设置检票窗口号
        order.setCheckout_id(new Random().nextInt(20));

        //设置票的类型ticket_type;
        String ticket_type = request.getParameter("ticket_type");
        order.setTicket_type(ticket_type);

        //设置是否购买保险
        String insurance = request.getParameter("insurance");
        if(insurance.equals("true")){
            order.setInsurance(true);
        }else if(insurance.equals("false")){
            order.setInsurance(false);
        }

        //设置是否携带儿童
        String if_take_children = request.getParameter("if_take_children");
        if(if_take_children.equals("true")){
            order.setIf_taken_children(true);
        }else if(if_take_children.equals("false")){
            order.setIf_taken_children(false);
        }

        //设置票价  若是儿童票，则打5折
        if(ticket_type=="1"){
            order.setTicket_price(ticket.getTicket_price()*0.5);
        }else if(ticket_type=="0.5"){
            //成人票，全票
            order.setTicket_price(ticket.getTicket_price());
        }
        System.out.println(order);
        boolean flag = orderService.insertOrder(order);
        if(flag){
            //订单生成成功，将乘客信息存储到数据库
            boolean i = passengerService.insertOne(passenger);
            System.out.println("添加乘客信息成功");
            //将数据存储
            request.setAttribute("order",order);
            session.setAttribute("order",order);
            //订单生成,跳转到支付界面
            request.getRequestDispatcher("payforOrder.jsp").forward(request,response);
        }else{
            request.setAttribute("msg","订单提交失败");
            request.getRequestDispatcher("takeOrder.jsp").forward(request,response);
        }

    }

    //确认订单
    public void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //从会话中获取当前订单信息
        HttpSession session = request.getSession();
        Order order = (Order)session.getAttribute("order");

        //更新订单中收货人信息
        boolean flag =false;
        flag=orderService.updateOrder("未检票".toString(), order.getOrder_id());

        //若更新成功，则跳转至支付页面
        if(flag){
            response.sendRedirect( "/alipay.trade.page.pay.jsp");
        }
    }

    //查看我的订单
    public void viewMyOrders(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //从会话中获取用户user_id
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String user_id = user.getUid();
        //获取pageNow,并进行转化
        String page = request.getParameter("pageNow");
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }
        //通过用户user_id查询我的订单
        PageVO<Order> vo = orderService.viewMyOrders(user_id, pageNow);
        //将查询结果存储
        request.setAttribute("vo",vo);
        request.getRequestDispatcher("orderList.jsp").forward(request,response);

    }

    //退票
    public void deleteOrder(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        boolean flag = orderService.deleteMyOrder(order_id);
        String msg=null;
        if(flag){
            System.out.println("删除成功");
            msg="订单删除成功！";
        }else{
            msg="订单删除失败！";
        }
        request.setAttribute("msg",msg);
        request.getRequestDispatcher("/order?method=viewMyOrders");
    }


    //查看某一订单详情
    public void viewOneOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        //查看某一订单详情
        Order order = orderService.viewOneOrder(order_id);
        if(order!=null){
            //订单不为空，跳转至修改订单页面
            //存储数据
            request.setAttribute("order",order);
            request.getRequestDispatcher("edit_order.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("orderList.jsp");
        }
    }

    //改签
    public void updateOrder(HttpServletRequest request,HttpServletResponse response){

    }


}
