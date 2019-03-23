package com.zr.news.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author : 张晋飞
 * date : 2019/3/23
 */
@WebFilter("/*")
public class UrlFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String requestURI = request.getRequestURI();
        StringBuffer requestURL = request.getRequestURL();

        chain.doFilter(req, resp);


        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
