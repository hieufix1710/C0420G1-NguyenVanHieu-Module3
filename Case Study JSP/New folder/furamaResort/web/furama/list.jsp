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
                float: left;
                margin-bottom: 5px;
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
        <tr>
            <th>ID Customer</th>
            <th>Type Customer</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>CMND</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Action</th>
        </tr>
        <tbody>
        <c:forEach items="${customers}" var="customer">
            <tr>
                <td>${customer.getId()}</td>
                <c:forEach items="${customerType}" var="customerType">
                    <c:if test="${customerType.id==customer.typeId}">
                        <td>${customerType.name}</td>
                    </c:if>
                </c:forEach>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthday()}</td>
                <td>${customer.getCMND()}</td>
                <td>${customer.getPhone()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td>
                    <a href="/furama_resort?activity=view&id=${customer.id}" class="view" title="View"
                       data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                    <a href="/furama_resort?activity=edit&id=${customer.id}" class="edit" title="Edit"><i
                            class="material-icons">&#xE254;</i></a>
                    <a href="/furama_resort?activity=delete&id=${customer.id}" class="delete" title="Delete"><i
                            class="material-icons">&#xE872;</i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<form class="createButton">
    <a href="#addNoteModal" class="btn btn-success" data-toggle="modal"><i class="fa fa-plus"></i> <span>Add new customer</span></a>
    <br>
    <a href="#addNoteModal2" class="btn btn-success" data-toggle="modal"><i class="fa fa-plus"></i> <span>Add New Service</span></a>
</form>
<a href="#addNoteModal3" class="btn btn-success" data-toggle="modal"><i class="fa fa-plus"></i>
    <span>Add New Employe</span></a>
</form>

<%--add new customer --%>
<div id="addNoteModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/furama_resort?activity=createNewCustomer" method="post">
                <div class="modal-header" style="background: dimgrey">
                    <h4 class="modal-title" style="color: #e9e9e9">Add Customer</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>ID</label>
                        <input type="text" class="form-control" name="idCustomer" id="idCustomer">
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" id="name">
                    </div>
                    <div class="form-group">
                        <label>Birthday</label>
                        <input type="text" class="form-control" name="birthday" id="birthday">
                    </div>
                    <div class="form-group">
                        <label>CMND</label>
                        <input type="text" class="form-control" name="CMND" id="CMND">
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" class="form-control" name="phone" id="phone">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="email" id="email">
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" class="form-control" name="address" id="address">
                    </div>
                    <div class="form-group">
                        <label>Customer type </label>
                        <select name="customerType" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="customerType" items="${customerType}">
                                <option value="${customerType.id}"><c:out value="${customerType.name}"></c:out></option>
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
<%--add new service --%>
<div id="addNoteModal2" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/furama_resort?activity=addNewService" method="post">
                <div class="modal-header" style="background: dimgrey">
                    <h4 class="modal-title" style="color: #e9e9e9">Add Service</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>ID</label>
                        <input type="text" class="form-control" name="idService" id="idService">
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="nameService" id="nameService">
                    </div>
                    <div class="form-group">
                        <label>Area</label>
                        <input type="text" class="form-control" name="area" id="area">
                    </div>
                    <div class="form-group">
                        <label>Number of floors</label>
                        <input type="text" class="form-control" name="numberOfFloors" id="numberOfFloors">
                    </div>
                    <div class="form-group">
                        <label>Max People</label>
                        <input type="text" class="form-control" name="maxPeople" id="maxPeople">
                    </div>
                    <div class="form-group">
                        <label>Fee rent</label>
                        <input type="text" class="form-control" name="feeRent" id="feeRent">
                    </div>
                    <div class="form-group">
                        <label>Type Rent </label>
                        <select name="typeRent" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="typeRent" items="${typeRent}">
                                <option value="${typeRent.id}"><c:out value="${typeRent.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label> Type Service </label>
                        <select name="typeService" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="typeService" items="${typeService}">
                                <option value="${typeService.id}"><c:out value="${typeService.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Status</label>
                    <input type="text" class="form-control" name="status" id="status">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>
<%--add new employee --%>
<div id="addNoteModal3" class="modal fade">
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
                            <c:forEach var="position" items="${position}">
                                <option value="${position.id}"><c:out value="${position.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Department</label>
                        <select name="department" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="department" items="${department}">
                                <option value="${department.id}"><c:out value="${department.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Level</label>
                        <select name="position" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="level" items="${level}">
                                <option value="${level.id}"><c:out value="${level.name}"></c:out></option>
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
