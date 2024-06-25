<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 引入 Bootstrap -->
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入 font-awesome -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>宿舍管理系统</title>
    <style>
        .pagination-container {
            position: fixed;
            bottom: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 0;
            background-color: #f8f9fa;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px 5px 0 0;
        }
        .pagination {
            margin: 0;
        }
        .pagination li {
            display: inline-block;
            margin: 0 5px;
        }
        .pagination li a,
        .pagination .active a {
            color: #007bff;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #dee2e6;
            transition: background-color 0.3s, color 0.3s;
        }
        .pagination li a:hover {
            background-color: #e9ecef;
        }
        .pagination .active a {
            background-color: #007bff;
            color: #ffffff;
            border-color: #007bff;
        }
        .pagination-info {
            margin-left: 20px;
            font-size: 14px;
            color: #666;
        }
        .panel {
            margin-bottom: 20px;
        }
        .table-responsive {
            margin-bottom: 20px;
        }
        .panel-heading {
            font-weight: bold;
        }
        .btn-info {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-info:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">
            <!-- 顶部搜索部分 -->
            <div class="panel panel-default">
                <div class="panel-heading">搜索</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="/absent/search" method="post">
                        <div class="form-group">
                            <label for="name">字段：</label>
                            <select name="key" class="form-control">
                                <option value="buildingName">楼宇</option>
                                <option value="dormitoryName">宿舍</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">值：</label>
                            <input type="text" class="form-control" name="value" placeholder="字段值" maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info">
                                <span style="margin-right: 5px" class="glyphicon glyphicon-search" aria-hidden="true"></span>开始搜索
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 列表展示-->
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>楼宇</th>
                        <th>宿舍</th>
                        <th>姓名</th>
                        <th>原因</th>
                        <th>宿管</th>
                        <th>日期</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="absent">
                        <tr>
                            <td>${absent.id}</td>
                            <td>${absent.buildingName}</td>
                            <td>${absent.dormitoryName}</td>
                            <td>${absent.studentName}</td>
                            <td>${absent.reason}</td>
                            <td>${absent.dormitoryAdminName}</td>
                            <td>${absent.createDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 分页按钮 -->
                <div class="pagination-container">
                    <ul class="pagination">
                        <c:if test="${pageindex > 1}">
                            <li><a href="/absent/list?pageindex=1">首页</a></li>
                            <li><a href="/absent/list?pageindex=${pageindex - 1}">上一页</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${pagecount}" var="i">
                            <li class="${i == pageindex ? 'active' : ''}"><a href="/absent/list?pageindex=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${pageindex < pagecount}">
                            <li><a href="/absent/list?pageindex=${pageindex + 1}">下一页</a></li>
                            <li><a href="/absent/list?pageindex=${pagecount}">尾页</a></li>
                        </c:if>
                    </ul>
                    <div class="pagination-info">当前页数为：${pageindex}</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
