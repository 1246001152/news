package com.zr.news.servlet;

import com.alibaba.fastjson.JSONObject;
import com.zr.news.dao.CommentDao;
import com.zr.news.dao.NewsDao;
import com.zr.news.dao.daoimpl.CommentDaoImpl;
import com.zr.news.dao.daoimpl.NewsDaoImpl;
import com.zr.news.entity.Comment;
import com.zr.news.entity.News;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.PageBean;
import com.zr.news.service.NewsService;
import com.zr.news.service.NewsTypeService;
import com.zr.news.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/15
 */
@WebServlet(name = "NewsServlet",urlPatterns = "/NewsServlet",initParams ={@WebInitParam(name="pageCount",value="10")} )
public class NewsServlet extends HttpServlet {

    private NewsService newsService = new NewsService();
    private NewsTypeService newsTypeService = new NewsTypeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");
        System.out.println("NewsServlet........."+action);
        if("query".equals(action)){
            query(request, response);
        }else if("queryOne".equals(action)){
            queryOne(request, response);
        }else if("toadd".equals(action)){
            toadd(request, response);
        }else if("add".equals(action)){
            add(request, response);
        }else if("queryPage".equals(action)){
            queryPage(request, response);
        }else if("delete".equals(action)){
            delete(request, response);
        }else if("deleteAll".equals(action)){
            deleteAll(request, response);
        }else if("queryOneBack".equals(action)){
            queryOneBack(request, response);
        }else if("update".equals(action)){
            update(request, response);
        }

    }
    protected void queryOneBack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int newsId = Integer.parseInt(id);

        NewsDao  dao= new NewsDaoImpl();
        News news = dao.findNewsById(newsId);
        List<NewsType> typeList = newsTypeService.findAll();
        request.setAttribute("news",news);
        request.setAttribute("typeList",typeList);
        request.getRequestDispatcher("/background/news/newsUpdate.jsp").forward(request,response);


    }
    protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ids = request.getParameter("ids");
        String[] idArr = ids.split(",");
        int sum=0;
        for (String newsId:idArr) {
            int i =  newsService.delete(newsId);
            sum+=i;
        }
        response.getWriter().print(sum);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String newsId = request.getParameter("newsId");
            int i =  newsService.delete(newsId);
            response.getWriter().print(i);
    }

    private void queryPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageIndex = request.getParameter("page");
        PageBean pageBean =  new PageBean();
        if(!StringUtil.isEmpty(pageIndex)){
            pageBean.setPageIndex(Integer.parseInt(pageIndex));
        }
        String pageCount = request.getParameter("limit");
        pageBean.setPageCount(Integer.parseInt(pageCount));
        pageBean.setCount(newsService.findAll().size());
        List<News> newsList= newsService.queryPage(pageBean );
        JSONObject jsonObject = JsonUtil.getJsonObject(newsList, pageBean);
        response.getWriter().print(jsonObject);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String typeId = request.getParameter("typeId");
        String hot = request.getParameter("hot");
        String isImage = request.getParameter("isImage");
        String publishDate = request.getParameter("publishDate");
        String content = request.getParameter("content");

        int ishot=0;
        if(hot!=null){
            ishot=1;
        }
        int isImg=0;
        if(isImage!=null){
            isImg=1;
        }

        String image = (String)request.getSession().getAttribute("image");
        request.getSession().removeAttribute("image");
        News news = new News(0,title,content,author,
                Integer.parseInt(typeId), DateUtil.formatString(publishDate,"yyyy-MM-dd HH:mm:ss")
                ,isImg, image!=null?image:"",0,ishot);

        int i = newsService.addNews(news);
        response.getWriter().print(i);
    }


    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String newsId = request.getParameter("newsId");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String typeId = request.getParameter("typeId");
        String hot = request.getParameter("hot");
        String isImage = request.getParameter("isImage");
        String publishDate = request.getParameter("publishDate");
        String content = request.getParameter("content");

        int ishot=0;
        if(hot!=null){
            ishot=1;
        }
        int isImg=0;
        if(isImage!=null){
            isImg=1;
        }

        String image = (String)request.getSession().getAttribute("image");
        request.getSession().removeAttribute("image");
        News news = new News(Integer.parseInt(newsId),title,content,author,
                Integer.parseInt(typeId), DateUtil.formatString(publishDate,"yyyy-MM-dd HH:mm:ss")
                ,isImg, image!=null?image:"",0,ishot);
        System.out.println("========================="+news);
        int i = newsService.updateNews(news);
        response.getWriter().print(i);

    }


    private void toadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NewsType> typeList = newsTypeService.findAll();
        request.setAttribute("typeList",typeList);
        request.getRequestDispatcher("/background/news/newsAdd.jsp").forward(request,response);
    }

    private void queryOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsId = request.getParameter("newsId");
        News news = newsService.findNewsById(Integer.parseInt(newsId));

        // 导航栏
        String newsNav = NavUtil.getavNewsById(news.getTypeId(), news.getTypeName(), news.getTitle());

        List<News> newsUpAndDown = newsService.getNewsUpAndDown(Integer.parseInt(newsId));
        String upAndDown = NewsUpAndDownUtil.getUpAndDown(newsUpAndDown);
        CommentDao dao = new CommentDaoImpl();
        List<Comment> commentList = dao.queryByNewsId(Integer.parseInt(newsId));
        request.setAttribute("commentList",commentList);
        request.setAttribute("newsNav",newsNav);
        request.setAttribute("newsUpAndDown",upAndDown);
        request.setAttribute("news",news);
        request.setAttribute("mainJsp","newInfo.jsp");
        request.getRequestDispatcher("/foreground/newModel.jsp").forward(request,response);
    }

    private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeId = request.getParameter("typeId");
        String pageIndex = request.getParameter("pageIndex");
        PageBean pageBean =  new PageBean();
        if(!StringUtil.isEmpty(pageIndex)){
            pageBean.setPageIndex(Integer.parseInt(pageIndex));
        }
        String pageCount = getInitParameter("pageCount");
        pageBean.setPageCount(Integer.parseInt(pageCount));

        pageBean.setCount(newsService.findNewsCountByType(Integer.parseInt(typeId)));
        List<News> newsList = newsService.findNewsListPage(Integer.parseInt(typeId), pageBean);

        NewsTypeService typeService =  new NewsTypeService();

        //导航栏
        NewsType newsType = typeService.findTypeById(Integer.parseInt(typeId));
        String newsListNav = NavUtil.getNavNewsListByType(newsType);


        String newListPager = PageUtil.getPager(Integer.parseInt(typeId), pageBean);

        request.setAttribute("newListPager",newListPager);
        request.setAttribute("newsListNav",newsListNav);
        request.setAttribute("newsList",newsList);
        request.setAttribute("mainJsp","newList.jsp");
        request.getRequestDispatcher("/foreground/newModel.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}
