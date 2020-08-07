<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/3/2020
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<h1>Edit user</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/students">Back to student list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Student information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["student"].getName()}"></td>
            </tr>
            <tr>
                <td>Birthday: </td>
                <td><input type="text" name="birthday" id="birthday" value="${requestScope["student"].getBirthday()}"></td>
            </tr>
            <tr>
                <td>Account: </td>
                <td><input type="text" name="account" id="account" value="${requestScope["student"].getBirthday()}"></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password" id="password" value="${requestScope["student"].getBirthday()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update student"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>