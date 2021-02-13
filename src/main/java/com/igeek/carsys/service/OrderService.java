package com.igeek.carsys.service;

import com.igeek.carsys.dao.OrderDao;
import com.igeek.carsys.entity.Order;
import com.igeek.carsys.vo.PageVO;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description 订单服务层
 * @Author Lemon
 * @Date 2021/2/8 12:13
 */
public class OrderService {
    private OrderDao dao=new OrderDao();

    //插入订单
    public boolean insertOrder(Order order){
        int i = 0;
        try {
            i = dao.insertOne(order);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }

    //修改订单状态
    public boolean updateOrder(String ticket_status,String order_id){
        int i = 0;
        try {
            i = dao.updateorder(ticket_status, order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }

    //查看我的订单
    public PageVO<Order> viewMyOrders(String user_id,int pageNow){
        PageVO<Order> vo=null;
        try {
            //获得我的订单的总数
            Long counts = dao.getMyOrdersCount(user_id);
            //获取页数myPages
            int mypages=(int)(counts%5==0?counts/5:Math.ceil(counts/5.0));
            //计算起始值
            int begin=(pageNow-1)*5;
            //我的订单所有订单数据
            List<Order> orderList = dao.getMyOrders(user_id, begin);
           vo = new PageVO<>(null, null, null, pageNow, mypages, orderList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //查看某一订单详情
    public Order viewOneOrder(String order_id){
        Order order = null;
        try {
            order = dao.getOneOrder(order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  order;
    }

    //删除我的订单
    public boolean deleteMyOrder(String order_id){
        int i = 0;
        try {
            i = dao.deleteOne(order_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0?true:false;
    }
}
