package com.igeek.carsys.controller;

import com.igeek.carsys.entity.Ticket;
import com.igeek.carsys.service.TicketService;
import com.igeek.carsys.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "TicketServlet",urlPatterns = "/ticket")
public class TicketServlet extends BaseServlet {
    private TicketService service=new TicketService();
    public void viewTicketByDepartDest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String depart_city = request.getParameter("depart_city");
        String dest_city = request.getParameter("dest_city");
        String time = request.getParameter("depart_date");
        System.out.println("time="+time);
        String page = request.getParameter("pageNow");
        //对page进行处理，获得pageNow
        int pageNow=1;
        if(page!=null&&!"".equals(page)){
            pageNow=Integer.parseInt(page);
        }

        Date depart_date = null;
        if(time!=null&&!"".equals(time)){
            try {
                //对出发时间进行解析   Sun Feb 07 00:00:00 CST 2021
                SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", Locale.UK);
                depart_date= sdf.parse(time);
                //将初步解析后的日期再次进行解析
                //SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
               /* String sDate=sdf2.format(newdate);
                System.out.println("解析完毕后的日期");*/
            } catch (ParseException e) {
                SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
                try {
                    depart_date=sdf2.parse(time);
                    System.out.println("depart_date="+depart_date);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
        }

        //获取所有的商品信息
        PageVO<Ticket> vo = service.viewTicketByDepartDest(depart_city, dest_city, depart_date, pageNow);
        //将查询数据存储d到request中
        request.setAttribute("vo",vo);
        //跳转页面
        request.getRequestDispatcher("ticketList.jsp").forward(request,response);
    }

    public void viewTicketByDepartDestTime(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String depart_station = request.getParameter("depart_station");
        String dest_station = request.getParameter("dest_station");
        String depart_time = request.getParameter("depart_time");
        String date = request.getParameter("depart_date");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date depart_date = null;
        try {
            depart_date = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //查找对应的车票
        Ticket ticket = service.viewTicketDepartDestTime(depart_station, dest_station, depart_date, depart_time);
        //将车票信息存储
        request.setAttribute("ticket",ticket);
        //页面跳转
        request.getRequestDispatcher("takeOrder.jsp").forward(request,response);
    }
}
