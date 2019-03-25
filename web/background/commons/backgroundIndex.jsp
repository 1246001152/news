<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/19
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="info.jsp"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登录-天天新闻 V1.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./index.html">天天新闻 V1.0</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('资讯','http://news.baidu.com/')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
                <dd><a onclick="x_admin_show('图片','http://image.baidu.com/')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd><a onclick="x_admin_show('切换帐号','./login.jsp')">切换帐号</a></dd>
                <dd><a href="<%=request.getContextPath()%>/OutServlet">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="<%=request.getContextPath()%>/goIndex">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>会员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="member-list.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>会员列表</cite>

                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>新闻信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=request.getContextPath()%>/background/news/newsList.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻信息维护</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="<%=request.getContextPath()%>/NewsServlet?action=toadd">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻信息添加</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>新闻分类管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=request.getContextPath()%>/background/newsType/typeList.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻分类维护</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>评论信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=request.getContextPath()%>/background/comment/commentList.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>评论信息维护</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>友情链接管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=request.getContextPath()%>/LinkServlet?action=query">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>友情链接维护</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/InitServlet">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>系统缓冲刷新</cite>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2019 天天新闻 1.0 All Rights Reserved</div>
</div>
</body>
</html>