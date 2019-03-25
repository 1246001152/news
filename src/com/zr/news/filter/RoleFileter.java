package com.zr.news.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author : 张晋飞
 * date : 2019/3/25
 * servlet 是web三大组件之一
 * fileter 是web三大组件之一
 */
public class RoleFileter implements Filter {

    /**
     * 过滤器初始化
     *      服务器启动时初始化
     * @param filterConfig
     * @throws ServletException
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器来了");
    }

    /**
     * 过滤器执行过滤
     * @param servletRequest
     * @param servletResponse
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //请求路径没有ip和端口号的
        String uri = request.getRequestURI();
      //  System.out.println("uri:"+uri);
        String ip = request.getRemoteAddr();
        System.out.println("ip:"+ip);

        if(uri.indexOf("background")!=-1){ // 如果访问后台不放行
            if(uri.indexOf("login")!=-1){ // 如果你就是去登录，放行
                chain.doFilter(servletRequest,servletResponse); //放行
            }else{ //没有去登录的页面

                // 如果有就使用，没有就创建
                HttpSession session = request.getSession();
                // 1.登录 session 不是空的就放行
                Object username = session.getAttribute("username");
                if(username!=null){
                    chain.doFilter(servletRequest,servletResponse); //登录成功放行
                }else{// 2.没有登录不放行

                    //重定向 去登陆
                    response.sendRedirect(request.getContextPath()+"/background/commons/login.jsp");
                }
            }
        }else{
            chain.doFilter(servletRequest,servletResponse); //放行
        }
    }

    /**
     * 过滤器的销毁
     *      服务器关闭时
     */
    @Override
    public void destroy() {
        System.out.println("过滤器要走了");
    }


}
