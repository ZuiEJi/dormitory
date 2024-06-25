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
                    <form role="form" class="form-inline" action="/building/search" method="post">
                        <div class="form-group">
                            <label for="name">字段：</label>
                            <select name="key" class="form-control">
                                <option value="name">名称</option>
                                <option value="introduction">介绍</option>
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
                        <div class="form-group " style="margin-left: 48px">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addUserModal">
										<span style="margin-right: 5px" class="" aria-hidden="true">
											<i class="fa fa-user-plus">添加楼宇信息</i>
											</span>
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
                        <th>名称</th>
                        <th>介绍</th>
                        <th>管理员</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="building">
                        <tr>
                            <td>${building.id}</td>
                            <td>${building.name}</td>
                            <td>${building.introduction}</td>
                            <td>${building.adminName}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default "
                                            data-id="${building.id}"
                                            data-name="${building.name}"
                                            data-introduction="${building.introduction}"
                                            data-admin-id="${building.adminId}"
                                            data-toggle="modal"
                                            data-target="#updateUserModal">
                                        <i class="fa fa-user-o">修改</i>
                                    </button>

                                    <button type="button" class="btn btn-danger "
                                            data-id="${building.id}" data-toggle="modal"
                                            onclick="" data-target="#delUserModal">
                                        <i class="fa fa-user-times">删除</i>
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
                            <li><a href="/building/list?pageindex=1">首页</a></li>
                            <li><a href="/building/list?pageindex=${pageindex - 1}">上一页</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${pagecount}" var="i">
                            <li class="${i == pageindex ? 'active' : ''}"><a href="/building/list?pageindex=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${pageindex < pagecount}">
                            <li><a href="/building/list?pageindex=${pageindex + 1}">下一页</a></li>
                            <li><a href="/building/list?pageindex=${pagecount}">尾页</a></li>
                        </c:if>
                    </ul>
                    <div class="pagination-info">当前页数为：${pageindex}</div>
                </div>
                <!-- add框示例（Modal） -->
                <form method="post" action="/building/save" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">添加楼宇信息</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">名称</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name"
                                                       name="name" value="" placeholder="请输入名称">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">介绍</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="introduction"
                                                       name="introduction" value="" placeholder="请输入介绍">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">管理员</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="adminId">
                                                    <c:forEach items="${dormitoryAdminList}" var="dormitoryAdmin">
                                                        <option value="${dormitoryAdmin.id}">${dormitoryAdmin.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- update框示例（Modal） -->
                <form method="post" action="/building/update" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="updateUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">用户信息</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="id"
                                                       name="id">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">名称</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name"
                                                       name="name" value="" placeholder="请输入名称">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">介绍</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="introduction"
                                                       name="introduction" value="" placeholder="请输入介绍">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">管理员</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="adminId">
                                                    <c:forEach items="${dormitoryAdminList}" var="dormitoryAdmin">
                                                        <option class="adminId" value="${dormitoryAdmin.id}">${dormitoryAdmin.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- 删除模态框示例（Modal） -->
                <form method="post" action="/building/delete"
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
                                                    name="id" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-danger">删除</button>
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

<script>
    $('#updateUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var adminId = button.data('admin-id')
        var name = button.data('name')
        var introduction = button.data('introduction')
        var modal = $(this)

        modal.find('.modal-title').text('修改楼宇信息')
        modal.find('#id').val(id)
        var list = modal.find('.adminId')
        for (var i=0;i<list.length;i++){
            var obj = $(list.get(i));
            if(adminId == obj.val()){
                obj.attr("selected","selected");
            }
        }
        modal.find('#introduction').val(introduction)
        modal.find('#name').val(name)
    })

    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var modal = $(this)
        modal.find('.modal-title').text('删除楼宇信息')
        modal.find('#deleteLabel').text('是否删除ID为  ' + id + ' 的信息')
        modal.find('#id').val(id)
    })
</script>

</body>

</html>