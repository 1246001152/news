package com.zr.news.service;

import com.zr.news.dao.NewsDao;
import com.zr.news.dao.daoimpl.NewsDaoImpl;
import com.zr.news.entity.News;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.PageBean;
import com.zr.news.util.StringUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class NewsService {


    private NewsDao dao = new NewsDaoImpl();

    public List<News> findImageNews(){
        return  dao.findImageNews();
    }


    public News findHeadNews(){

        News headNews = dao.findHeadNews();
        String context = headNews.getContext();
        String text = StringUtil.html2Text(context);
        if(text.length()>=40){
            text=text.substring(0,40);
        }
        headNews.setContext(text);
        return headNews;
    }


    public List<News> findNewNews(){
        return  dao.findNewNews();
    }
    public List<News> findClickNews(){
        return  dao.findClickNews();
    }


    public List<News> findHotNews(){

        return  dao.findHotNews();
    }


    public List<List<News>> findNewsByType(){
        List<List<News>> listsnewsLists =  new ArrayList<>();
        NewsTypeService service = new NewsTypeService();
        List<NewsType> typeList = service.findAll();
        for (NewsType newsType:typeList) {
            List<News> newsList = dao.findNewsByType(newsType.getTypeId());
            if(newsList!=null && !newsList.isEmpty()) {
                listsnewsLists.add(newsList);
            }
        }
        return  listsnewsLists;
    }

    public List<News> findNewsListPage(int typeId, PageBean pageBean){
        List<News> newsList = dao.findNewsListByType(typeId,pageBean);
        return newsList;
    }

    public int findNewsCountByType(int typeId){
        return  dao.findNewsCountByType(typeId);
    }
    public News findNewsById(int id){
        dao.addClick(id);
        return dao.findNewsById(id);
    }

    public List<News> getNewsUpAndDown(int newsId){
        List<News> newsUpAndDownList =  new ArrayList<>();
        News upNews = dao.findUpNewsById(newsId);
        News downNews = dao.findDownNewsById(newsId);
        newsUpAndDownList.add(upNews);
        newsUpAndDownList.add(downNews);
        return newsUpAndDownList;
    }

    public int addNews(News news) {
       return dao.addNews(news);
    }


    public List<News> queryPage(PageBean pageBean) {
        return dao.queryPage(pageBean);
    }

    public List<News> findAll(){
        return dao.findAll();
    }

    public int delete(String newsId) {
        return dao.delete(newsId);
    }

    public int updateNews(News news) {
        return dao.updateNews(news);
    }
}
