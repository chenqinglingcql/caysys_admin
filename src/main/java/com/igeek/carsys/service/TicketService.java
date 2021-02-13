package com.igeek.carsys.service;

import com.igeek.carsys.dao.TicketDao;
import com.igeek.carsys.entity.Ticket;
import com.igeek.carsys.vo.PageVO;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @Description 车票服务层
 * @Author Lemon
 * @Date 2021/2/6 22:52
 */
public class TicketService {
    private TicketDao dao=new TicketDao();

    //根据起始城市、目的城市、出发日期所在城市查询
    public PageVO<Ticket> viewTicketByDepartDest(String depart_city, String dest_city, Date depart_date, Integer pageNow){
        PageVO vo=null;

        try {
            //符合条件的汽车的总数量
            int count = dao.selectCountsByDepartDest(depart_city, dest_city, depart_date);
            //计算总页数  一页展示5条数据
            int mypages=(int)(count%5==0?count/5:Math.ceil(count/5.0));
            //计算起始值
            int begin=(pageNow-1)*5;
            //查询数据
            List<Ticket> ticketList = dao.selectTicketByDepartDest(depart_city, dest_city, depart_date,begin);
            //封装vo
            vo=new PageVO<>(depart_city,dest_city,depart_date,pageNow,mypages,ticketList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //根据起始站、目的地、出发日期、出发时间所在城市查询
    public Ticket viewTicketDepartDestTime(String depart_station, String dest_station, Date depart_date, String depart_time) {
        Ticket ticket = null;
        try {
            ticket = dao.selectTicketByDepartDestTime(depart_station, dest_station, depart_date, depart_time);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ticket;
    }


}
