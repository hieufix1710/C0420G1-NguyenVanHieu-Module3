<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/30/2020
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display List</title>
</head>
<body>
<form>
    <table>
        <tr>
            <th>Name</th>
            <th>Birthday</th>
            <th>Address</th>
            <th>Image</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td><c:out value="${customer.name}"></c:out></td>
                <td><c:out value="${customer.birthday}"></c:out></td>
                <td><c:out value="${customer.address}"></c:out></td>
                <td><c:out value="${customer.image}"></c:out></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
