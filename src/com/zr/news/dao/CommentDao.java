package com.zr.news.dao;

import com.zr.news.entity.Comment;
import com.zr.news.entity.PageBean;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
public interface CommentDao {

    public int addComment(Comment comment);

    public List<Comment> queryByNewsId(int newsId);

    public List<Comment> queryAll();

    public List<Comment> queryByPage(PageBean pageBean);

    public int deleteComent(int id);

    public int deleteComentByNews(int newId);
}
