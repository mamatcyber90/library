<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/19
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css"  media="all">
</head>
<body>
<div>
    <%--<script type="text/javascript">--%>
        <%--alert("${item.bookname}");--%>
    <%--</script>--%>
<form class="layui-form" action="/student/lend.action">
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-inline">
            <input name="title" lay-verify="title" autocomplete="off" class="layui-input" value="${item.bookname}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required"  autocomplete="off" class="layui-input" value="${item.author}">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出版社</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" value="${item.press}">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">余量</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input" value="${item.b_count}">
            </div>
        </div>
    </div>

    <!--<div class="layui-form-item layui-form-text">
      <label class="layui-form-label">编辑器</label>
      <div class="layui-input-block">
        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
      </div>
    </div>-->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">确认借阅</button>
            <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            <%--<button type="reset">首页</button>--%>
        </div>
    </div>
</form>

        <%--<form class="form-inline" action="${pageContext.request.contextPath }/book/list.action" method="post">--%>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" onclick="location.href='${pageContext.request.contextPath }/book/list.action'">首页</button>
                </div>
            </div>
        <%--</form>--%>
</div>
</body>
</html>
