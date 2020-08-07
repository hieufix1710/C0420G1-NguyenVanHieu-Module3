<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/4/2020
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form method="post">
<h3>Are you sure?</h3>
<fieldset>
    <legend>Student information</legend>
    <table>
        <tr>
            <td>Name: </td>
            <td>${student.name}</td>
        </tr>
        <tr>
            <td>Birthday: </td>
            <td>${student.birthday}</td>
        </tr>
        <tr>
            <td>Address: </td>
            <td>${student.address}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Delete student"></td>
            <td><a href="/students">Back to student list</a></td>
        </tr>
    </table>
    <span>${message}</span>
</fieldset>
</form>
</body>
</html>
