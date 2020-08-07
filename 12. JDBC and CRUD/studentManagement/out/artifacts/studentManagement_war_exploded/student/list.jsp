<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/3/2020
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student List</title>
</head>
<body>
<h1>Student</h1>
<p>
    <a href="/students?action=create">Create new student</a>
</p>
<table border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Birthday</td>
        <td>Account</td>
        <td>Class name</td>
        <td>Type class</td>

    </tr>
    <c:forEach items='${requestScope["students"]}' var="student">
        <tr>
            <td><a href="/students?action=view&id=${student.getId()}">${student.getId()}</a></td>
            <td>${student.getName()}</td>
            <td>${student.getBirthday()}</td>
            <td>${student.getAccount()}</td>
            <td>${student.getClassName()}</td>
            <td>${student.getTypeClass()}</td>
            <td><a href="/students?action=edit&id=${student.getId()}">edit</a></td>
            <td><a href="/students?action=delete&id=${student.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>