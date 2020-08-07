<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/4/2020
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=1">${product.id}</a></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
