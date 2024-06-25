<%--
  Created by IntelliJ IDEA.
  User: x
  Date: 2024/5/20
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <!-- 引入 Bootstrap -->
  <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- 引入 font-awesome -->
  <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="application/javascript">
    function change(url, index) {
      $(".list-group-item").removeClass("active");
      $(".list-group-item").eq(index).addClass("active");
      $("iframe").attr("src", "/" + url);
    }
  </script>
</head>
<style>
  .footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: #f8f9fa;
    text-align: left;
    padding: 10px;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
  }
  .footer p {
    margin: 0;
    color: #6c757d;
  }
</style>
<body>
<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-left">
      <li>
        <a style="font-size: 26px;">DORMS宿舍管理系统-学生</a>
      </li>
    </ul>
    <span style="color: #CCCCCC; font-size: 26px; position: relative; top: 5px;"></span>
    <ul class="nav navbar-nav navbar-right">
      <li>
        <%-- 显示学生的名称 --%>
        <a>欢迎您, ${studentAdmin.name} </a>
      </li>
      <li>
        <a href="/account/logout">安全退出</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">
    <div class="col-sm-2">
      <a href="javascript:void(0)" class="list-group-item active" onclick="change('studentadmin/infor',0)">
        <span class="" aria-hidden="true">
          <i class="fa fa-bookmark fa-fw"></i>
        </span>个人信息
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('studentadmin/studentabsent',1)">
        <span class="" aria-hidden="true">
          <i class="fa fa-bookmark-o fa-fw"></i>
        </span>缺寝信息
      </a>
      <a href="javascript:void(0)" class="list-group-item" onclick="change('studentadmin/studentfix',2)">
        <span class="" aria-hidden="true">
          <i class="fa fa-bookmark-o fa-fw"></i>
        </span>宿舍报修
      </a>
    </div>
    <!--右边内容-->
    <iframe style="width: 81%; height: 600px; border: 0px;" src="/studentadmin/infor"></iframe>
  </div>
</div>

<div class="footer">
  <p class="text-left">
    2024 © xyj
  </p>
</div>
</body>
</html>
