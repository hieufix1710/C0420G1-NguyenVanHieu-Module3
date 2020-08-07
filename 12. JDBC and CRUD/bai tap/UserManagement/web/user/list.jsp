<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display list</title>
</head>
<style>
    table{
        border:  1px solid black;
    }
    th,tr,td{
        border: 1px solid black;
    }
</style>
<body>
<form>
    <a href="/users?action=create">Create new user</a>

    <br>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td><a href="/users?action=edit&id=${user.id}">Edit</a></td>
                <td><a href="/users?action=delete&id=${user.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <p><a href="/users?action=findByCountry">Find by country</a></p>
    <p><a href="/users?action=orderByName">Order by name</a></p>
</form>
</body>
</html>
