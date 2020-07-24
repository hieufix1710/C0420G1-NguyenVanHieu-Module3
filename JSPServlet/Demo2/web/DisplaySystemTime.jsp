<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/24/2020
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display System Time</title>
</head>
<body>
<div>
    <form method="post" action="/display">
        <h3><% request.getAttribute("result");%></h3>
    </form>
</div>
</body>
</html>
