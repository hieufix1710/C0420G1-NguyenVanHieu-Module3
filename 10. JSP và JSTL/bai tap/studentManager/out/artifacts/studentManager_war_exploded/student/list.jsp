<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/3/2020
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display list</title>
    <style>
        table{
            border: 1px solid black;
        }
        th,td{
            border: solid 1px black;
        }
    </style>
</head>
<body>
<form>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Address</th>
        </tr>
        <c:forEach items='${requestScope["students"]}' var="student">
            <tr>
                <td><c:out value="${student.id}"></c:out></td>
                <td><c:out value="${student.name}"></c:out></td>
                <td><c:out value="${student.birthday}"></c:out></td>
                <td><c:out value="${student.address}"></c:out></td>
                <td><a href="/students?action=edit&id=${student.id}">Edit</a></td>
                <td><a href="/students?action=delete&id=${student.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="/students?action=create">Create new student</a>

</form>
</body>
</html>
