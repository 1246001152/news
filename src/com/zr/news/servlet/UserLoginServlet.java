package com.zr.news.servlet;

import com.alibaba.fastjson.JSONObject;
import com.zr.news.dao.CommentDao;
import com.zr.news.dao.LinkDao;
import com.zr.news.dao.NewsDao;
import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoimpl.*;
import com.zr.news.entity.*;
import com.zr.news.util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        System.out.println("UserLoginServlet.post.....");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("UserLoginServlet.post....."+username+"======="+password);
        UserDaoImpl dao =  new UserDaoImpl();
        User user = dao.queryOne(username);
        ResultCode rc = null;
        if(user!=null){
            //用户名正确
          //  rc = new ResultCode("1001","用户名正确");
            if(user.getPassword().equals(password)){
                //密码正确
                rc = new ResultCode("1001","登录成功");
                request.getSession().setAttribute("currentDate", DateUtil.formatDate(new Date(),"yyyy-MM-dd HH:mm:ss"));
               loginInfo(request,response);
            }else{
                //密码不正确
                rc = new ResultCode("1002","密码不正确");
            }
        }else{
            //用户名不存在
            rc = new ResultCode("1000","你是不是不知道账号密码！？？？");
        }
        response.getWriter().print(JSONObject.toJSONString(rc));
    }

    private void loginInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 创建一次会话， 如果有会话就直接使用
        HttpSession session = request.getSession();
        String username = request.getParameter("username");

        NewsDao newsDao=new NewsDaoImpl();
        NewsTypeDao newsTypeDao=new NewsTypeDaoImpl();
        LinkDao linkDao=new LinkDaoImpl();
        CommentDao commentDao=new CommentDaoImpl();
        List<News> newsList = newsDao.findAll();
        List<NewsType> newsTypeList = newsTypeDao.findAll();
        List<Link> linkList = linkDao.findAll();
        List<Comment> commentList = commentDao.queryAll();

        int clickSum=0;
        for (News news:newsList) {
            clickSum+= news.getClick();
        }

        Set<String> set=new HashSet<>();
        for (Comment comment:commentList) {
            set.add(comment.getIpAddr());
        }

        session.setAttribute("username",username);
        session.setAttribute("newsListCount",newsList.size());
        session.setAttribute("newsTypeListCount",newsTypeList.size());
        session.setAttribute("commentListCount",commentList.size());
        session.setAttribute("linkListCount",linkList.size());
        session.setAttribute("clickSum",clickSum);
        session.setAttribute("ipCount",set.size());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
