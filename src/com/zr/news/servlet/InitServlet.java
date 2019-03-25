package com.zr.news.servlet;

import com.zr.news.dao.CommentDao;
import com.zr.news.dao.LinkDao;
import com.zr.news.dao.NewsDao;
import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoimpl.CommentDaoImpl;
import com.zr.news.dao.daoimpl.LinkDaoImpl;
import com.zr.news.dao.daoimpl.NewsDaoImpl;
import com.zr.news.dao.daoimpl.NewsTypeDaoImpl;
import com.zr.news.entity.Comment;
import com.zr.news.entity.Link;
import com.zr.news.entity.News;
import com.zr.news.entity.NewsType;
import com.zr.news.service.NewsService;
import com.zr.news.service.NewsTypeService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author : 张晋飞
 * date : 2019/3/15
 */
@WebServlet(name="InitServlet",urlPatterns = "/InitServlet",loadOnStartup = 1)
public class InitServlet extends HttpServlet {
    private  NewsTypeService service = new NewsTypeService();
    private  NewsService newsService = new NewsService();
    @Override
    public void init() throws ServletException {
        ServletContext application = this.getServletContext();
        // 新闻类别加载
        List<NewsType> typeList = service.findAll();
        application.setAttribute("typeList", typeList);

        // 最新新闻
        List<News> newNewsList = newsService.findNewNews();
        application.setAttribute("newNewsList", newNewsList);

        // 热门新闻
        List<News> clickNewsList = newsService.findClickNews();
        application.setAttribute("clickNewsList", clickNewsList);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 新闻类别加载
        ServletContext application = this.getServletContext();
        // 新闻类别加载
        List<NewsType> typeList = service.findAll();
        application.setAttribute("typeList", typeList);

        // 最新新闻
        List<News> newNewsList = newsService.findNewNews();
        application.setAttribute("newNewsList", newNewsList);

        // 热门新闻
        List<News> clickNewsList = newsService.findClickNews();
        application.setAttribute("clickNewsList", clickNewsList);
        loginInfo(request,response);
        PrintWriter out = response.getWriter();

        response.sendRedirect(request.getContextPath()+"/background/commons/backgroundIndex.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void setNews() {

    }
    private void loginInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 创建一次会话， 如果有会话就直接使用
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");

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
}
