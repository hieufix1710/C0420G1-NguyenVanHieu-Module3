<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/4/2020
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<form method="post">
    <h1>Update</h1>
    <input type="text" name="name" placeholder="name">
    <input type="text" name="birthday" placeholder="birthday">
    <input type="text" name="address" placeholder="address">
    <button type="submit">Submit</button>
    <span>${requestScope["message"]}</span>
    <a href="/students">Back to Home</a>
</form>
</body>
</html>
