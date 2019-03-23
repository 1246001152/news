package com.zr.news.servlet;

import com.alibaba.fastjson.JSONObject;
import com.zr.news.dao.CommentDao;
import com.zr.news.dao.daoimpl.CommentDaoImpl;
import com.zr.news.entity.Comment;
import com.zr.news.entity.PageBean;
import com.zr.news.service.CommentService;
import com.zr.news.util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
       response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");
        if("add".equals(action)){
            add(request, response);
        }else if("query".equals(action)){
            query(request, response);
        }else if("delete".equals(action)){
            delete(request, response);
        }else if("deleteAll".equals(action)){
            deleteAll(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ids = request.getParameter("ids");
        CommentDao dao = new CommentDaoImpl();
        System.out.println("-----------------"+ids);
        String[] id = ids.split(",");
        int sum=0;
        for (String commentId:id) {
            int  i = dao.deleteComent(Integer.parseInt(commentId));
            sum+=i;
        }
        response.getWriter().print(""+sum);
    }
    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String newsId = request.getParameter("newsId");
        String content = request.getParameter("content");
        String ipAddr = request.getRemoteAddr();
        Comment comment= new Comment(Integer.parseInt(newsId),content,ipAddr,new Date(System.currentTimeMillis()));
        CommentService commentService =  new CommentService();
        int i = commentService.addComment(comment);
        if(i>0){
            // 将对象转为json字符串
            String strjson = JSONObject.toJSONString(comment);
//          System.out.println(strjson);
            response.getWriter().print(strjson);
        }
    }

    protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");

        PageBean pageBean = new PageBean();
        pageBean.setPageIndex(Integer.parseInt(page));
        pageBean.setPageCount(Integer.parseInt(limit));

        CommentDao dao = new CommentDaoImpl();
        pageBean.setCount(dao.queryAll().size());

        List<Comment> commentList = dao.queryByPage(pageBean);
        JSONObject array = JsonUtil.getJsonObject(commentList,pageBean);
        response.getWriter().print(array);

    }
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        CommentDao dao = new CommentDaoImpl();
        int  i = dao.deleteComent(Integer.parseInt(id));
        response.getWriter().print(i);
    }
}
