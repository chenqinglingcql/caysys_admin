package com.igeek.carsys.dao;

import com.igeek.carsys.entity.Ticket;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @Description 票工具类
 * @Author Lemon
 * @Date 2021/2/6 22:30
 */
public class TicketDao extends BaseDao<Ticket> {
    //根据起始点、目的地、出发日期查询汽车票
    public List<Ticket> selectTicketByDepartDest(String depart_city, String dest_city, Date depart_date,int begin) throws SQLException {
        List<Ticket> list=null;
        if(depart_city!=null || !depart_city.equals("")){
            String sql="select * from ticketList where depart_city=? and dest_city=? and depart_date=? limit ?,5";
           list = this.getBeanList(sql, Ticket.class, depart_city, dest_city,depart_date,begin);

        }
          return list;
    }

    //根据起始点、目的地查询汽车票的总数
    public int selectCountsByDepartDest(String depart_city,String dest_city,Date depart_date) throws SQLException {
        String sql="select count(*) from ticketList where depart_city=? and dest_city=? and depart_date=?";
        //object类型不能强转为int类型
        Long count = (Long) this.getSinglevalue(sql, depart_city, dest_city, depart_date);
        //返回long类型的int数值
        return count.intValue();
    }

    //根据起始点、目的地、出发日期、出发时间查询汽车票
    public Ticket selectTicketByDepartDestTime(String depart_station, String dest_station, Date depart_date, String depart_time) throws SQLException {
        String sql="select * from ticketList where depart_station=? and dest_station=? and depart_date=? and depart_time=?";
        Ticket ticket = this.getBean(sql, Ticket.class, depart_station, dest_station, depart_date, depart_time);
        return ticket;
    }
}
