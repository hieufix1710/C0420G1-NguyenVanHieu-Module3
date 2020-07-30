
<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/24/2020
  Time: 10:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.Customer" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Table</title>
</head>
<style>
    table{
        border: solid 1px black;
        border-collapse: collapse;
        height: 100px;
        width: 100px;

    }
    table th{
        padding: 14px 16px;
        text-align: center;
    }
    table tr{
        margin: 5px;
    }
</style>
<body>
<div>
    <form>
        <table>
            <tr>
                <th>Name</th>
                <th>Birthday</th>
                <th>Address</th>
                <th>Image</th>
                </th>
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

</div>
</body>
</html>
