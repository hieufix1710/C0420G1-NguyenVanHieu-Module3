<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/24/2020
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <div>
    <form action="/calculator" method="get">
      <h3>Product Description</h3>
      <input type="text" name="description">
      <h3>List Price</h3>
      <input type="text" name="price">
      <h3>Discount Percent</h3>
      <input type="text" name="discount">
      <input type="submit" value="Calculate Discount">
    </form>
  </div>
  </body>
</html>
