<%@ page import="com.zr.news.service.NewsService" %>
<%@ page import="com.zr.news.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
    <div class="col-md-9">
        <!-- Carousel  start -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" >
                <%--<div class="item active">
                    <a href="#1"><img style="overflow: hidden;" src="<%=request.getContextPath}/newsImg/1.jpg" alt="First slide"
                                      title="标题 1"></a>
                    <div class="text-caption">标题 1</div>
                </div>--%>
                    <c:forEach var="imageNews" items="${imageNewsList}" varStatus="index">
                        <c:if test="${index.first}">
                            <div class="item active">
                                <a href="NewsServlet?action=queryOne&newsId=${imageNews.newsId}">
                                    <img src="/${imageNews.imageUrl}"
                                                            alt="${imageNews.title}"
                                                            title="${imageNews.title}"></a>
                            </div>
                        </c:if>
                        <c:if test="${!index.first}">
                            <div class="item ">
                                <a href="NewsServlet?action=queryOne&newsId=${imageNews.newsId}">
                                    <img src="/${imageNews.imageUrl}"
                                         alt="${imageNews.title}"
                                         title="${imageNews.title}"></a>
                            </div>
                        </c:if>
                    </c:forEach>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Carousel  end -->
        <div class="newsHeader_list">
            <div class="newsHeader">
                <h3><a href="NewsServlet?action=queryOne&newsId=${headNews.newsId}" title="${headNews.title}">
                   ${fn:substring(headNews.title, 0, 8)}...

                </a></h3>
                <p>   ${fn:substring(headNews.context, 0, 40)}...
                    <a href="NewsServlet?action=queryOne&newsId=${headNews.newsId}">[查看全文]</a>
                </p>
            </div>
            <div class="currentUpdate">
                <div class="currentUpdateHeader">最近更新</div>
                <div class="currentUpdateDatas">
                    <table width="100%">

                            <c:forEach items="${newNewsList}" var="newNews" varStatus="i">
                                <c:if test="${i.index%2==0}">
                                <tr>
                                </c:if>
                                <td width="50%">
                                    <a href="NewsServlet?action=queryOne&newsId=${newNews.newsId}" title="${newNews.title}">${fn:substring(newNews.title, 0, 12)}</a>
                                </td>
                                <c:if test="${i.index%2==1}">
                                </tr>
                                </c:if>
                            </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="data_list hotspot_news_list">
            <div class="dataHeader">热点新闻</div>
            <div class="datas">
                <ul>

                    <c:forEach items="${hotNewsList}" var="hotNews">
                    <li>
                        <a href="NewsServlet?action=queryOne&newsId=${hotNews.newsId}" title="${hotNews.title}" >${fn:substring(hotNews.title, 0, 15)}</a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
