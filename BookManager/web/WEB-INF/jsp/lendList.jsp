<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itcast.cn/common/" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" media="all">

    <title>图书借阅平台</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div class="layui-logo">图书借阅平台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <form action="${pageContext.request.contextPath }/book/list.action" method="post">
                    <input type="hidden" name="id" value="${stu.id }" />
                    <button class="layui-btn layui-btn-normal" type="submit">书籍信息</button>
                </form>
                <%--<a href="${pageContext.request.contextPath }/book/list.action?id=${stu.id}">书籍信息</a>--%>
            </li>
            <li class="layui-nav-item">
                <form action="${pageContext.request.contextPath }/info/list.action" method="post">
                    <input type="hidden" name="id" value="${stu.id }" />
                    <button class="layui-btn layui-btn-normal" type="submit">借阅信息</button>
                </form>
            </li>
            <li class="layui-nav-item">
                <form action="${pageContext.request.contextPath }/student/info.action" method="post">
                    <input type="hidden" name="id" value="${stu.id }" />
                    <button class="layui-btn layui-btn-normal" type="submit">我的信息</button>
                </form>
                <%--<a href="${pageContext.request.contextPath}/student/info.action?id=${stu.id}">我的信息</a>--%>
            </li>
            <li class="layui-nav-item">
                <a href="http://localhost:8080">退出</a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">我的信息</div>
                <!-- /.panel-heading -->
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th width="150px">学号</th>
                        <th width="150px">书名</th>
                        <th width="100px">类型</th>
                        <th width="50px">借阅数量</th>
                        <th width="80px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${infolist}" var="info">
                        <tr>
                            <td>${info.id}</td>
                            <td>${info.bookname}</td>
                            <td>${info.type}</td>
                            <td>${info.con}</td>
                            <td>
                                <button class="layui-btn">还书</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>


<!-- jQuery -->
<script src="<%=basePath%>js1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js1/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js1/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="<%=basePath%>js1/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js1/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js1/sb-admin-2.js"></script>


</body>

</html>
