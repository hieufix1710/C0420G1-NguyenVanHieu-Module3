<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 7/30/2020
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple calculator</title>
  </head>
  <body>
 <form method="get" action="/calculator">
   <h1>Simple calculator</h1>
   <fieldset>
    <legend>Calculator</legend>
   <h3>First operand :</h3>
     <input type="text" name="first">
     <h3>Operator :</h3>
     <select name="operator">
       <option value="+">Addition</option>
       <option value="-">Subtraction</option>
       <option value="*">Multiplication</option>
       <option value="/">Division</option>
     </select>
     <h3>Second Operand :</h3>
     <input type="text" name="second">
     <button type="submit">Calculate</button>
   </fieldset>

 </form>
  </body>
</html>
