<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/12/2020
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<html>
  <head>
    <title>Furama Resort</title>
  </head>
  <style>

    body{
      height: 2000px;
    }
    #img1{
      width: 100%;
      height: auto;
    }
     div .collapse {
      float: right !important; ;
    }
     login{
      float: right;
    }

  </style>
  <body>
  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div>
      <a class="navbar-brand" href="#"></a>
      <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png">
    </div>
    </nav>
  </div>

  <div class="container-fluid">
    <!-- Content here -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/furama_resort?activity=about">Giới thiệu <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Danh sách nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Dịch vụ đi kèm</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Dịch vụ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Danh sách khách hàng</a>
          </li>
        </ul>
        <div class="login">
          <form class="form-inline my-2 my-lg-0">
            <a href="#loginForm" class="btn btn-outline-success my-2 my-sm-0"   data-toggle="modal"><i class="fa "></i> <span>Login</span></a>
          </form>
        </div>
      </div>
    </nav>
    <img  id="img1" src="https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2020/06/Review-Furama-Resort-Da-Nang-13.jpg">

  </div>


  <div id="loginForm" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <form action="/furama_resort?activity=login" method="post">
          <div class="modal-header" style="background: dimgrey">
            <h4 class="modal-title" style="color: #e9e9e9">Login</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label>User name :</label>
              <input type="text" class="form-control" name="user" id="user">
            </div>
            <div class="form-group">
              <label>Password :</label>
              <input type="password" class="form-control" name="password" id="password">
            </div>
          </div>
          <div class="modal-footer">
            <p>${message}</p>
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
            <input type="submit" class="btn btn-success" value="Login">
          </div>
        </form>
      </div>
    </div>
  </div>

  </body>
</html>
