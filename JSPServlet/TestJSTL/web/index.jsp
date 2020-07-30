<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/24/2020
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  tr{
    margin: 5px;
    padding: 6px 8px;
  }
</style>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <div>
    <form action="/in" method="post">
      <table>
        <tr>
          <th>Name</th>
          <th>Birthday</th>
          <th>Address</th>
          <th>Image</th>
        </tr>
        <tr>
          <td><input type="text" name="name"></td>
          <td><input type="text" name="birthday"></td>
          <td><input type="text" name="address"></td>
          <td><input type="text" name="image"></td>
        </tr>
        <tr>
          <td><input type="submit"></td>
        </tr>
      </table>
    </form>
  </div>

  </body>
</html>
