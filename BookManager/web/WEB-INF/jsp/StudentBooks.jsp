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

            <!--<li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">邮件管理</a>
                    </dd>
                    <dd>
                        <a href="">消息管理</a>
                    </dd>
                    <dd>
                        <a href="">授权管理</a>
                    </dd>
                </dl>
            </li>-->
        </ul>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <form class="form-inline" action="${pageContext.request.contextPath }/book/list.action" method="post">
                <div class="form-group">
                    <label for="bookname">书籍名称</label>
                    <input type="hidden" name="id" value="${stu.id }" />
                    <input type="text" class="form-control" id="bookname" value="${bkName }" name="bkName">
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">书籍列表</div>
                <!-- /.panel-heading -->
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th width="250px">书名</th>
                        <th>作者</th>
                        <th WIDTH="200PX">出版社</th>
                        <th width="150px">出版时间</th>
                        <th>类型</th>
                        <th>书架</th>
                        <th>数量</th>
                        <th width="50px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="row">
                        <tr>
                            <td>${row.bookname}</td>
                            <td>${row.author}</td>
                            <td>${row.press}</td>
                            <td>${row.pubdate}</td>
                            <td>${row.type}</td>
                            <td>${row.bookshelf}</td>
                            <td>${row.b_count}</td>
                            <td>
                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                   data-target="#customerEditDialog" onclick="editCustomer('${row.bookname}');">借阅</a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="col-md-12 text-right">
                    <itheima:page url="${pageContext.request.contextPath }/book/list.action"/>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>
<!-- /#page-wrapper -->


<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">借阅</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="lend_book_form">
                    <input type="hidden" id="student_id" name="id" value="${stu.id }"/>

                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">书籍名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_customerName" placeholder="书籍名称"
                                   name="bookname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_linkMan" class="col-sm-2 control-label">作者</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_linkMan" placeholder="作者"
                                   name="author">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-2 control-label">出版社</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_phone" placeholder="出版社"
                                   name="press">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mobile" class="col-sm-2 control-label">出版时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mobile" placeholder="出版时间"
                                   name="pubdate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_zipcode" class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_zipcode" placeholder="类型"
                                   name="type">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">书架</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="书架"
                                   name="bookshelf">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="info_count" class="col-sm-2 control-label">余量</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="info_count" placeholder="余量"
                                   name="b_count">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="surelend()">确认订阅</button>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->


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
<script type="text/javascript">
    function ceshi(){
        alert(111);
    }
    function editCustomer(name) {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath }/book/info.action",
            data: {"name": name},
            success: function (data) {
                $("#edit_customerName").val(data.bookname);
                $("#edit_linkMan").val(data.author);
                $("#edit_phone").val(data.press);
                $("#edit_mobile").val(data.pubdate);
                $("#edit_zipcode").val(data.type);
                $("#edit_address").val(data.bookshelf);
                $("#info_count").val(data.b_count);
            },
        });
    }

    function surelend() {
        $.ajax({
            type: "post",
            url: "<%=basePath%>book/suerlend.action",
            data: $("#lend_book_form").serialize(),
            success: function (data) {
                isTrue=data.b;
                    if(isTrue=0){
                        alert("借阅成功！");
                    };
                window.location.reload();
            },
        });
        <%--$.post("<%=basePath%>book/suerlend.action",--%>
            <%--$("#lend_book_form").serialize(),--%>
            <%--function (data) {--%>
            <%--b=data.b;--%>
            <%--if(b){--%>
                <%--alert("借阅成功！");--%>
            <%--}else{--%>
                <%--alert("对不起，借阅失败（此书您已借阅！），不可重复借阅");--%>
            <%--}--%>
                <%--window.location.reload();--%>
            <%--});--%>
    }

    function deleteCustomer(id) {
        if (confirm('确实要删除该客户吗?')) {
            $.post("<%=basePath%>customer/delete.action", {"id": id}, function (data) {
                alert("客户删除更新成功！");
                window.location.reload();
            });
        }
    }
</script>

</body>

</html>
