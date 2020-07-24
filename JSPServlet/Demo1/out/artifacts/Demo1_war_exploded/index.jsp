<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/24/2020
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <div>
    <form action="/calculator" method="post">
      <h1>Calcaulator</h1>
      <input name="a" type="text">
      <br>
      <input name="b" type="text">
      <button type="submit" value="aa">Sub</button>
      <h3><%request.getAttribute("total");%></h3>
    </form>

  </div>
  </body>
</html>
