package com.zr.news.dao.daoimpl;

import com.zr.news.dao.NewsDao;
import com.zr.news.entity.News;
import com.zr.news.entity.PageBean;
import com.zr.news.framework.JdbcUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class NewsDaoImpl implements NewsDao {

    @Override
    public int delete(String newsId) {
        String sql ="delete from news where  news_id = ?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1,newsId);
            int i = ps.executeUpdate();
            return  i;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close();
        }
        return  0;
    }

    public void addClick(int newsId){

        String sql ="update news set click = click+1 where  news_id = ?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,newsId);
            int i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close();
        }
    }
    @Override
    public int addNews(News news) {
        String sql ="INSERT INTO newsdb.news (title, context, author, type_id, publish_date, is_image, image_url, click, is_hot) " +
                "VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);

            Object[] obj = {news.getTitle(),news.getContext(),news.getAuthor(),
                    news.getTypeId(),news.getPublishDate(),news.getIsImage(),
                    news.getImageUrl(),news.getClick(),news.getIsHot()};
            setParten(ps,obj);
            int i = ps.executeUpdate();
            return  i;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close();
        }
        return 0;
    }

    @Override
    public int updateNews(News news) {
        String sql ="update news set title=?,context=? ,author=?, type_id=?," +
                " publish_date=?, is_image=? ,image_url=?, is_hot=? where news_id=?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);

            Object[] obj = {news.getTitle(),news.getContext(),news.getAuthor(),
                    news.getTypeId(),news.getPublishDate(),news.getIsImage(),
                    news.getImageUrl(),news.getIsHot(),news.getNewsId()};
            setParten(ps,obj);
            int i = ps.executeUpdate();
            return  i;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.close();
        }
        return 0;
    }

    @Override
    public List<News> queryPage(PageBean pageBean) {
        String sql="select * from news n , news_type t where n.type_id =t.type_id order by publish_date desc limit ?,?";
        List<News> list =  new ArrayList<>();
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,pageBean.getIndex());
            ps.setInt(2,pageBean.getPageCount());
            rs = ps.executeQuery();
            while (rs.next()){
                News news =  new News();
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPublishDate(rs.getDate("publish_date"));
                news.setIsImage(rs.getInt("is_image"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
                news.setTypeName(rs.getString("type_name"));
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return list;
    }



    public void setParten(PreparedStatement ps,Object... obj) throws SQLException {
        for (int i = 0; i < obj.length ; i++) {
            ps.setObject(1+i,obj[i]);
        }

    }

    public News findDownNewsById(int id){
        String sql="select * from news where publish_date<(select publish_date from news where news_id=?)  order by publish_date DESC limit 1;\n";
        News news =  new News();

        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPublishDate(rs.getDate("publish_date"));
                news.setIsImage(rs.getInt("is_image"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return news;
    }
    public News findUpNewsById(int id){
        String sql="select * from news where publish_date>(select publish_date from news where news_id=?)  order by publish_date asc limit 1;\n";
        News news =  new News();

        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPublishDate(rs.getDate("publish_date"));
                news.setIsImage(rs.getInt("is_image"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return news;
    }
    public News findNewsById(int id){
        String sql="select n.*,t.type_name from news n, news_type  t  where n.type_id = t.type_id and news_id=?";
        News news =  new News();

        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                news.setNewsId(rs.getInt("news_id"));
                news.setTitle(rs.getString("title"));
                news.setContext(rs.getString("context"));
                news.setAuthor(rs.getString("author"));
                news.setTypeId(rs.getInt("type_id"));
                news.setPublishDate(rs.getDate("publish_date"));
                news.setIsImage(rs.getInt("is_image"));
                news.setImageUrl(rs.getString("image_url"));
                news.setClick(rs.getInt("click"));
                news.setIsHot(rs.getInt("is_hot"));
                news.setTypeName(rs.getString("type_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return news;
    }


    @Override
    public int findNewsCountByType(int typeId) {
        String sql="select count(*)  count from news where type_id=?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,typeId);
            rs = ps.executeQuery();
            while (rs.next()){
                int count = rs.getInt("count");
               return  count;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return 0;
    }

    @Override
    public List<News> findNewsListByType(int typeId, PageBean pageBean) {
        String sql="select * from news where type_id="+typeId+" order by publish_date desc limit "+pageBean.getIndex()+","+pageBean.getPageCount();
        return  getNewsList(sql);
    }
    @Override
    public List<News> findNewsByType(int typeId) {
        String sql="select * from news where type_id="+typeId+" order by publish_date desc limit 0,8";
        return  getNewsList(sql);
    }

    @Override
    public List<News> findAll() {
        String sql="select * from news";
        return getNewsList(sql);
    }

    @Override
    public List<News> findImageNews() {
        String sql="select * from news where is_image=1 order by publish_date desc limit 0,4";
        return getNewsList(sql);
    }

    @Override
    public News findHeadNews() {
        String sql="select * from news order by publish_date desc";
        return getNewsList(sql).get(0);
    }

    @Override
    public List<News> findNewNews() {
        String sql="select * from news order by publish_date desc limit 0,8 ";
        return getNewsList(sql);
    }
    @Override
    public List<News> findClickNews() {
        String sql="select * from news  order by click desc limit 0,8 ";
        return getNewsList(sql);
    }

    @Override
    public List<News> findHotNews() {
        String sql="select * from news where is_hot=1  order by publish_date desc limit 0,8 ";
        return getNewsList(sql);
    }


    public List<News> getNewsList(String sql) {
        List<News> list = new ArrayList<>();
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                int newsId = rs.getInt("news_id");
                String title = rs.getString("title");
                String context = rs.getString("context");
                String author = rs.getString("author");
                int typeId = rs.getInt("type_id");
                Date publishDate = rs.getDate("publish_date");
                int isImage = rs.getInt("is_image");
                String imageUrl = rs.getString("image_url");
                int click = rs.getInt("click");
                int ishot = rs.getInt("is_hot");
                News news =  new News(newsId,title,context,author,typeId,publishDate,isImage,imageUrl,click,ishot);
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                    rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return list;
    }
}


