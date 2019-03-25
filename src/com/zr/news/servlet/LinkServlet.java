package com.zr.news.servlet;

import com.zr.news.dao.LinkDao;
import com.zr.news.dao.daoimpl.LinkDaoImpl;
import com.zr.news.entity.Link;
import com.zr.news.entity.PageBean;
import com.zr.news.util.StringUtil;

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
 * date : 2019/3/20
 */
@WebServlet(name = "LinkServlet",urlPatterns = "/LinkServlet",initParams = {@WebInitParam(name="pageCount",value="5")})
public class LinkServlet extends HttpServlet {

    private LinkDao dao = new LinkDaoImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if("query".equals(action)){
            query(request,response);
        }else if("add".equals(action)){
            add(request,response);
        }else if("update".equals(action)){
            update(request,response);
        }else if("delete".equals(action)){
            delete(request,response);
        }else if("deleteAll".equals(action)){
            deleteAll(request,response);
        }else if("queryOne".equals(action)){
            queryOne(request,response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String linkId = request.getParameter("linkId");
        String linkName = request.getParameter("linkName");
        String linkUrl = request.getParameter("linkUrl");
        String email = request.getParameter("email");
        String linkOrder = request.getParameter("linkOrder");
        Link link = new Link(Integer.parseInt(linkId),linkName,email,linkUrl,Integer.parseInt(linkOrder));
        int i = dao.updateLink(link);
        response.getWriter().print(""+i);

    }
    protected void queryOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String kid = request.getParameter("kid");
        int linkId=-1;
        if(!StringUtil.isEmpty(kid)){
            linkId=Integer.parseInt(kid);
        }
        Link link = dao.queryOne(linkId);

        request.setAttribute("link",link);
        request.getRequestDispatcher("/background/link/linkupdate.jsp").forward(request,response);

    }

    protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ids = request.getParameter("ids");
        String[] id = ids.split(",");
        int sum=0;
        for (String linkId:id) {
            int  i = dao.deleteLink(Integer.parseInt(linkId));
            sum+=i;
        }
       response.getWriter().print(""+sum);
    }


    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String kid = request.getParameter("kid");
        int linkId=-1;
        if(!StringUtil.isEmpty(kid)){
            linkId=Integer.parseInt(kid);
        }
        int  i = dao.deleteLink(linkId);
        response.getWriter().print(""+i);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String linkName = request.getParameter("linkName");
        String linkUrl = request.getParameter("linkUrl");
        String email = request.getParameter("email");
        String linkOrder = request.getParameter("linkOrder");
        Link link = new Link(linkName,email,linkUrl,Integer.parseInt(linkOrder));
        int i = dao.addLink(link);

        response.getWriter().print(""+i);

    }
    protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PageBean pageBean =  new PageBean();
        // 页码
        String pageIndex = request.getParameter("pageIndex");
        if(!StringUtil.isEmpty(pageIndex)){
            pageBean.setPageIndex(Integer.parseInt(pageIndex));
        }
        // 每页条数
        String pageCount = getInitParameter("pageCount");
        pageBean.setPageCount(Integer.parseInt(pageCount));
        // 总条数
        pageBean.setCount(dao.getConut());
        // list数据
        List<Link> linkList = dao.queryPageList(pageBean);

        request.setAttribute("linkList",linkList);
        request.setAttribute("pageBean",pageBean);
        request.getRequestDispatcher("/background/link/linkList.jsp").forward(request,response);

    }
}
