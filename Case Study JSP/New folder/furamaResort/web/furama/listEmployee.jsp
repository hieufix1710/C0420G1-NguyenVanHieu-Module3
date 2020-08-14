<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dino Hiếu
  Date: 8/12/2020
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All customer</title>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Note Management</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;

                background-image: url("");
                /*background: #f7f5f2;*/
                font-family: 'Roboto', sans-serif;
            }


            table {
                table-layout: fixed;
                margin-top: 15px;
            }

            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }

            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }

            table.table th:first-child {
                width: 60px;
            }

            table.table th:last-child {
                width: 120px;
            }

            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }

            table td a.view {
                color: #03A9F4;
            }

            table td a.edit {
                color: #FFC107;
            }

            table td a.delete {
                color: #E34724;
            }

            table.table td i {
                font-size: 19px;
            }

            table {
                width: 100% !important;
                border: 1px solid wheat;
            }

            .createButton {
                margin-bottom: 5px;
            }

            table {
                text-align: center;
            }


        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltips
                $('[data-toggle="tooltip"]').tooltip();

                // Filter table rows based on searched term
                $("#search").on("keyup", function () {
                    var term = $(this).val().toLowerCase();
                    $("table tbody tr").each(function () {
                        $row = $(this);
                        var name = $row.find("td:nth-child(2)").text().toLowerCase();
                        console.log(name);
                        if (name.search(term) < 0) {
                            $row.hide();
                        } else {
                            $row.show();
                        }
                    });
                });
            });

        </script>
    </head>
<body>
<form>
    <table>
        <tr style="background-color: dodgerblue">
            <th>ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>CMND</th>
            <th>Salary</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position</th>
            <th>Level</th>
            <th>Department</th>
            <th>Action</th>
        </tr>
        <tbody>
        <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.getId()}</td>
                <td>${employee.getName()}</td>
                <td>${employee.getBirthday()}</td>
                <td>${employee.getCMND()}</td>
                <td>${employee.getSalary()}</td>
                <td>${employee.getPhone()}</td>
                <td>${employee.getEmail()}</td>
                <td>${employee.getAddress()}</td>
                <c:forEach items="${positions}" var="postition">
                    <c:if test="${employee.idPosition==postition.id}">
                        <td>${postition.name}</td>
                    </c:if>
                </c:forEach>
                <c:forEach items="${levels}" var="level">
                    <c:if test="${employee.idLevel==level.id}">
                        <td>${level.name}</td>
                    </c:if>
                </c:forEach>
                <c:forEach items="${departments}" var="department">
                    <c:if test="${employee.idDepartment==department.id}">
                        <td>${department.name}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <a href="/furama_resort?activity=viewEmployee&id=${employee.id}" class="view" title="View"
                       data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                    <a href="/furama_resort?activity=editEmployee&id=${employee.id}" class="edit" title="Edit"><i
                            class="material-icons">&#xE254;</i></a>
                    <a href="/furama_resort?activity=deleteEmployee&id=${employee.id}" class="delete" title="Delete"><i
                            class="material-icons">&#xE872;</i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<form class="createButton">
    <a href="#addNoteModal" class="btn btn-success" data-toggle="modal"><i class="fa fa-plus"></i> <span>Add new employee</span></a>
</form>


<%--add new employee --%>
<div id="addNoteModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/furama_resort?activity=createNewEmployee" method="post">
                <div class="modal-header" style="background: dimgrey">
                    <h4 class="modal-title" style="color: #e9e9e9">Add Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>ID</label>
                        <input type="text" class="form-control" name="idEmployee" id="idEmployee">
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="nameEmployee" id="nameEmployee">
                    </div>
                    <div class="form-group">
                        <label>Birthday</label>
                        <input type="text" class="form-control" name="birthdayEmployee" id="birthdayEmployee">
                    </div>
                    <div class="form-group">
                        <label>CMND</label>
                        <input type="text" class="form-control" name="CMNDEmployee" id="CMNDEmployee">
                    </div>
                    <div class="form-group">
                        <label>Salary</label>
                        <input type="text" class="form-control" name="salary" id="salary">
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" class="form-control" name="phoneEmployee" id="phoneEmployee">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="emailEmployee" id="emailEmployee">
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" class="form-control" name="addressEmployee" id="addressEmployee">
                    </div>
                    <div class="form-group">
                        <label>Position</label>
                        <select name="position" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="position" items="${positions}">
                                <option value="${position.id}"><c:out value="${position.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Level </label>
                        <select name="level" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="level" items="${levels}">
                                <option value="${level.id}"><c:out value="${level.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Department </label>
                        <select name="department" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="department" items="${departments}">
                                <option value="${department.id}"><c:out value="${department.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
