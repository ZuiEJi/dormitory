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
</head>
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
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">

            <!-- 顶部搜索部分 -->
            <div class="panel panel-default">
                <div class="panel-heading">搜索</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="/moveout/search" method="post">
                        <div class="form-group">
                            <label for="name">字段：</label>
                            <select name="key" class="form-control">
                                <option value="number">学号</option>
                                <option value="name">姓名</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">值：</label>
                            <input type="text" class="form-control" name="value" placeholder="字段值" maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info ">
										<span style="margin-right: 5px"
                                              class="glyphicon glyphicon-search" aria-hidden="true">
										</span>开始搜索
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 列表展示-->
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>宿舍</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.dormitoryName}</td>
                            <td>${student.number}</td>
                            <td>${student.name}</td>
                            <td>${student.gender}</td>
                            <td>${student.state}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger"
                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-toggle="modal"
                                            data-target="#delUserModal">
                                        <i class="fa fa-user-o">迁出</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 分页按钮 -->
                <div class="pagination-container">
                    <ul class="pagination">
                        <c:if test="${pageindex > 1}">
                            <li><a href="/moveout/list?pageindex=1">首页</a></li>
                            <li><a href="/moveout/list?pageindex=${pageindex - 1}">上一页</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${pagecount}" var="i">
                            <li class="${i == pageindex ? 'active' : ''}"><a href="/moveout/list?pageindex=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${pageindex < pagecount}">
                            <li><a href="/moveout/list?pageindex=${pageindex + 1}">下一页</a></li>
                            <li><a href="/moveout/list?pageindex=${pagecount}">尾页</a></li>
                        </c:if>
                    </ul>
                    <div class="pagination-info">当前页数为：${pageindex}</div>
                </div>

                <!-- 删除模态框示例（Modal） -->
                <form method="post" action="/moveout/register"
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">

                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">用户信息</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel">删除信息</h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin"> <input
                                                    type="hidden" class="form-control" id="id"
                                                    name="studentId" placeholder="">
                                                <input type="hidden" id="dormitoryId" name="dormitoryId">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">迁出原因</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control"
                                                       name="reason">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">迁出</button>
                                    <span id="tip"> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
</div>

<script>
    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var dormitoryId = button.data('dormitory-id')
        var modal = $(this)
        modal.find('.modal-title').text('学生迁出登记')
        modal.find('#deleteLabel').text('将迁出编号为  ' + id + ' 的学生')
        modal.find('#id').val(id)
        modal.find('#dormitoryId').val(dormitoryId)
    })
</script>

</body>

</html>