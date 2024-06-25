<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <!-- 引入 Bootstrap 和 FontAwesome -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>宿舍管理系统</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .info-item {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f2f2f2;
        }
        .info-item label {
            font-weight: bold;
            width: 100px;
            display: inline-block;
        }
        .info-item span {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">个人信息</h2>
    <div class="row">
        <div class="col-sm-6 info-item">
            <label>姓名：</label>
            <span>${studentAdmin.name}</span>
        </div>
        <div class="col-sm-6 info-item">
            <label>登录账号：</label>
            <span>${studentAdmin.login}</span>
        </div>
        <div class="col-sm-6 info-item">
            <label>性别：</label>
            <span>${studentAdmin.gender}</span>
        </div>
        <div class="col-sm-6 info-item">
            <label>楼栋：</label>
            <span>${studentAdmin.dormitoryId}</span>
        </div>
        <div class="col-sm-6 info-item">
            <label>宿舍：</label>
            <span>${studentAdmin.dormitoryName}</span>
        </div>
        <div class="col-sm-6 info-item">
            <label>联系方式：</label>
            <span>${studentAdmin.number}</span>
        </div>
    </div>
</div>
</body>
</html>
