package com.zr.news.dao;

import com.zr.news.entity.News;
import com.zr.news.entity.PageBean;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public interface NewsDao {

    public List<News> findAll();

    public List<News> findImageNews();

    public News findHeadNews();

    public List<News> findNewNews();

    public List<News> findClickNews();

    public List<News> findHotNews();

    public List<News> findNewsByType(int typeId);

    public List<News> findNewsListByType(int typeId, PageBean pageBean);

    public int findNewsCountByType(int typeId);

    public News findNewsById(int newsId);

    public News findUpNewsById(int newsId);

    public News findDownNewsById(int newsId);

    public void addClick(int newsId);

    int addNews(News news);


    List<News> queryPage(PageBean pageBean);

    int delete(String newsId);

    int updateNews(News news);
}
