package com.zr.news.servlet;

import com.zr.news.entity.Link;
import com.zr.news.entity.News;
import com.zr.news.entity.NewsType;
import com.zr.news.service.LinkService;
import com.zr.news.service.NewsService;
import com.zr.news.service.NewsTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/14
 */
@WebServlet(name = "GoIndexServlet",urlPatterns = "/goIndex")
public class GoIndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        NewsService newsService = new NewsService();
        NewsTypeService typeService = new NewsTypeService();

        // 新闻分类
        List<NewsType> typeList = typeService.findAll();
        request.setAttribute("typeList",typeList);
        // 图片新闻
        List<News> imageNewsList = newsService.findImageNews();
        request.setAttribute("imageNewsList",imageNewsList);
        // 头条新闻
        News headNews = newsService.findHeadNews();
        request.setAttribute("headNews",headNews);
        // 最近新闻
        List<News> newNewsList = newsService.findNewNews();
        request.setAttribute("newNewsList",newNewsList);
        // 热点新闻
        List<News> hotNewsList = newsService.findHotNews();
        request.setAttribute("hotNewsList",hotNewsList);
        // 新闻类别分类
        List<List<News>> newsByTypeList = newsService.findNewsByType();
        request.setAttribute("newsByTypeList",newsByTypeList);

        LinkService service = new LinkService();
        List<Link> linkList = service.findAll();
        request.setAttribute("linkList",linkList);

        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
