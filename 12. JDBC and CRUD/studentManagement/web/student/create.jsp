<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/3/2020
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/students">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Student information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Birthday: </td>
                <td><input type="text" name="birthday" id="birthday"></td>
            </tr>
            <tr>
                <td>Account: </td>
                <td><input type="text" name="account" id="account"></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password" id="password"></td>
            </tr>
            <tr>
                <td>Class Name: </td>
                <td><input type="text" name="className" id="className"></td>
            </tr>
            <tr>
                <td>Type class: </td>
                <td><input type="text" name="typeClass" id="typeClass"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create student"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>