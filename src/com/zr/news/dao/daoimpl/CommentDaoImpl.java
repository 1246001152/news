package com.zr.news.dao.daoimpl;

import com.zr.news.dao.CommentDao;
import com.zr.news.entity.Comment;
import com.zr.news.entity.PageBean;
import com.zr.news.framework.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
public class CommentDaoImpl implements CommentDao {
    private QueryRunner qr = new QueryRunner();
    @Override
    public int addComment(Comment comment) {

        String sql="insert into comment (news_id,content,ip_addr,comment_date) values(?,?,?,?)";
        Object[] objs = {comment.getNewsId(),comment.getContent(),comment.getIpAddr(),comment.getCommentDate()};
        try {
            return  qr.update(JdbcUtils.getConnection(),sql,objs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Comment> queryByNewsId(int newsId) {

        String sql="select * from comment where news_id= ? order by comment_date desc ";
        try {
            List<Comment> commentList = qr.query(JdbcUtils.getConnection(),sql, new BeanListHandler<>(Comment.class), newsId);
            return commentList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public List<Comment> queryAll() {

        String sql="select * from comment";
        try {
            List<Comment> commentList = qr.query(JdbcUtils.getConnection(),sql, new BeanListHandler<>(Comment.class));
            return commentList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Comment> queryByPage(PageBean pageBean) {
        String sql="select c.* ,n.title title from comment c,news n where c.news_id=n.news_id limit ?,?";
        try {
            List<Comment> commentList = qr.query(JdbcUtils.getConnection(),sql,
                    new BeanListHandler<>(Comment.class),pageBean.getIndex(),pageBean.getPageCount());
            return commentList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int deleteComent(int id) {

        String sql="delete from comment where c_id=? ";
        try {
            return  qr.update(JdbcUtils.getConnection(),sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteComentByNews(int newId) {

        String sql="delete from comment where news_id=? ";
        try {
            return  qr.update(JdbcUtils.getConnection(),sql,newId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
