<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/3/2020
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new a student</title>
    <style>
       input {

       }
    </style>
</head>
<body>
<form method="post">
    <fieldset>
     <legend><h3>Create new student</h3></legend>
    <input type="text" placeholder="id" name="id">
    <input type="text" placeholder="name" name="name">
    <input type="text" placeholder="birthday" name="birthday">
    <input type="text" placeholder="address" name="address">
    <button type="submit">Submit</button>
    </fieldset>
    <span>${requestScope["message"]}</span>
    <a href="/students">Back to home page</a>
</form>
</body>
</html>
