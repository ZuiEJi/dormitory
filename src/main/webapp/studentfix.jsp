<%--
  Created by IntelliJ IDEA.
  User: x
  Date: 2024/5/20
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>标题</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .table {
            margin: 20px 0;
            border-collapse: separate;
            border-spacing: 0 10px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }
        .table thead th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .table tbody tr {
            background-color: #ffffff;
            transition: background-color 0.3s;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
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

        .fixed-repair-btn {
            position: fixed;
            bottom: 60px;
            right: 20px;
            z-index: 1000;
            background-color: #007bff;
            color: white;
            border-radius: 50px;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .fixed-repair-btn:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-sm-10">
            <!-- 列表展示 -->
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="thead-light">
                    <tr>
                        <th>姓名</th>
                        <th>宿舍号</th>
                        <th>报修描述</th>
                        <th>报修时间</th>
                        <th>是否完成</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.name}</td>
                            <td>${item.dormitoryname}</td>
                            <td>${item.describe}</td>
                            <td>${item.time}</td>
                            <td>${item.fixed}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 触发模态框的按钮 -->
            <button type="button" class="btn btn-primary fixed-repair-btn" data-toggle="modal" data-target="#repairModal">
                提交宿舍报修
            </button>
            <%--分页按钮--%>
            <div class="pagination-container">
                <ul class="pagination">
                    <c:if test="${pageindex > 1}">
                        <li><a href="/studentadmin/studentfix?pageindex=1">首页</a></li>
                        <li><a href="/studentadmin/studentfix?pageindex=${pageindex - 1}">上一页</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${pagecount}" var="i">
                        <li class="${i == pageindex ? 'active' : ''}"><a href="/studentadmin/studentfix?pageindex=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${pageindex < pagecount}">
                        <li><a href="/studentadmin/studentfix?pageindex=${pageindex + 1}">下一页</a></li>
                        <li><a href="/studentadmin/studentfix?pageindex=${pagecount}">尾页</a></li>
                    </c:if>
                </ul>
                <div class="pagination-info">当前页数：${pageindex}</div>
            </div>
        </div>
    </div>
</div>

<!-- 模态框 -->
<div class="modal fade" id="repairModal" tabindex="-1" role="dialog" aria-labelledby="repairModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="repairModalLabel">提交宿舍报修</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/fix/save" method="post">
                    <div class="form-group">
                        <label for="describe">报修描述</label>
                        <textarea class="form-control" id="describe" name="describe" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
