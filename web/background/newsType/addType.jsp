<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/23
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../commons/info.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-container" style="padding: 20px">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-block">
                <input type="hidden" name="typeId" required  value="${type.typeId}"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">新闻类别：</label>
            <div class="layui-input-block">
                <input type="text" name="typeName" required  lay-verify="required" value="${type.typeName}" placeholder="请输入类型" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitSave">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>


<script>
    //Demo
    layui.use(['laydate','form'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        //监听提交
        form.on('submit(submitSave)', function(data){
            //layer.msg(JSON.stringify(data.field)+"==="+CKEDITOR.instances.content.getData());

            var typeId = data.field.typeId;
            var typeName = data.field.typeName;
            if(typeId!=""){
                $.ajax({
                    type:"post",
                    url:"<%=request.getContextPath()%>/NewsTypeServlet",
                    data:{
                        "action":"update",
                        "typeId":typeId,
                        "typeName":typeName
                    },
                    success:function(msgData){
                        layer.msg("修改成功",{icon:1,time:2000});
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        window.parent.location.reload();
                    }
                })
            }else {
                $.ajax({
                    type:"post",
                    url:"<%=request.getContextPath()%>/NewsTypeServlet",
                    data:{
                        "action":"add",
                        "typeName":typeName
                    },
                    success:function(msgData){
                        layer.msg("添加成功",{icon:1,time:2000});
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        window.parent.location.reload();
                    }
                })
            }
            return false;
        });
    });
</script>
</body>
</html>
