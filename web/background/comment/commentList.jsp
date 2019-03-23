<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/21
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/info.jsp"%>
<html>
<head>
    <title>评论管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#"><cite>首页</cite></a>
        <a><cite>新闻评论维护</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">

    <table class="layui-hide" id="tab" lay-filter="test"></table>
   <%-- <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        </div>
    </script>
--%>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger" class="layui-icon" lay-event="deleteAll"><i class="layui-icon"></i>批量删除</button>
        </div>
    </script>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="loginTime">
        {{ dateFormat(d.commentDate) }}
    </script>
</div>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#tab'
            ,toolbar: '#toolbarDemo'
            // Servlet 返回一个json字符串
            ,url:'<%=request.getContextPath()%>/CommentServlet?action=query'
            ,title: '新闻评论表'
            ,cols: [[{type: 'checkbox', fixed: 'left'}
                ,{field:'cId', title:'ID', width:'5%', fixed: 'left', unresize: true, sort: true}
                ,{field:'newsId', title:'新闻ID',width:'5%',sort: true}
                ,{field:'title', title:'新闻标题', width:'20%',sort: true}
                ,{field:'content', title:'评论内容', width:'20%'}
                ,{field:'ipAddr', title:'IP地址', width:'20%',sort: true}
                ,{field:'commentDate', title:'日期', width:'20%',templet: '#loginTime',sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='deleteAll'){
                var data = checkStatus.data;
                if(data==""){
                    layer.msg('请至少选择1条数据');
                    return;
                }
                var ids="";
                for(var i=0;i<data.length;i++){
                  alert(data[i].cId)
                    ids+=data[i].cId
                    ids+=","
                }
                layer.confirm('确认要删除这些信息吗？',function(index) {
                    $.ajax({
                        type: "post",
                        url: "<%=request.getContextPath()%>/CommentServlet",
                        data: "action=deleteAll&ids=" + ids,
                        success: function (msg) {
                            if (msg > 0) {
                                //捉到所有被选中的，发异步进行删除
                                layer.msg('成功删除' + msg + '条数据', {icon: 1})
                            } else {
                                layer.msg('已删除或不存在!', {icon: 2, time: 1000});
                            }
                            location.reload();
                        }
                    });


                });
            }
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)

            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    $.ajax({
                        type:"post",
                        url:"<%=request.getContextPath()%>/CommentServlet",
                        data:"action=delete&id="+data.cId,
                        success:function(msg){
                            obj.del();
                            if(msg=="1"){
                                layer.msg("删除成功",{icon:1,time:1000});
                            }else{
                                //发异步删除数据
                                layer.msg("删除失败或已删除",{icon:2,time:1000});
                            }
                        }
                    });
                });
            }
        });
    });

</script>

</body>
</html>
