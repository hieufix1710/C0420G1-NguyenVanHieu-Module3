<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/24/2020
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Display system current time</title>
  </head>
  <body>

   <div>
       <% long result = System.currentTimeMillis(); %>

     <%=result %>
   </div>
  </body>
</html>
