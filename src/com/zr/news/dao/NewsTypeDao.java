package com.zr.news.dao;

import com.zr.news.entity.NewsType;
import com.zr.news.entity.PageBean;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public interface NewsTypeDao {

    public List<NewsType> findAll();

    public NewsType findTypeById(int typeId);

    public int addNewsType(NewsType newsType);

    public int deleteNewsType(int id);

    public int updateNewsType(NewsType newsType);

    public List<NewsType> queryByPage(PageBean pageBean);

}
