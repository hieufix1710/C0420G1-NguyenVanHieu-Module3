<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit Customer</title>
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

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            color: #fff;
            background: #40b2cd;
            padding: 16px 25px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .search-box {
            position: relative;
            float: right;
        }

        .search-box .input-group {
            min-width: 300px;
            position: absolute;
            right: 0;
        }

        .search-box .input-group-addon, .search-box input {
            border-color: #ddd;
            border-radius: 0;
        }

        .search-box input {
            height: 34px;
            padding-right: 35px;
            background: #f4fcfd;
            border: none;
            border-radius: 2px !important;
        }

        .search-box input:focus {
            background: #fff;
        }

        .search-box input::placeholder {
            font-style: italic;
        }

        .search-box .input-group-addon {
            min-width: 35px;
            border: none;
            background: transparent;
            position: absolute;
            right: 0;
            z-index: 9;
            padding: 6px 0;
        }

        .search-box i {
            color: #a0a5b1;
            font-size: 19px;
            position: relative;
            top: 2px;
        }

        table.table {
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

        table.table td a.view {
            color: #03A9F4;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #E34724;
        }

        table.table td i {
            font-size: 19px;
        }
    </style>
</head>
<body>
<div>

    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/furama_resort?activity=updateEmployee" method="post">
                <c:if test="${employee != null}">
                    <input type="hidden" name="id" value="<c:out value='${employee.id}'></c:out>"/>
                </c:if>
                <div class="modal-header" style="background: dimgray">
                    <h4 class="modal-title" style="color: #e9e9e9">Edit Employee Information</h4>
                    <a href="/furama_resort">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </a>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>ID</label>
                        <input type="text" class="form-control" name="idEmployee"
                               value="<c:out value='${employee.id}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="nameEmployee"
                               value="<c:out value='${employee.name}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>Birthday</label>
                        <input type="text" class="form-control" name="birthdayEmployee"
                               value="<c:out value='${employee.birthday}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>CMND</label>
                        <input type="text" class="form-control" name="CMNDEmployee"
                               value="<c:out value='${employee.CMND}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>Salary</label>
                        <input type="text" class="form-control" name="salary"
                               value="<c:out value='${employee.salary}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" class="form-control" name="phoneEmployee"
                               value="<c:out value='${employee.phone}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="emailEmployee"
                               value="<c:out value='${employee.email}'></c:out>">
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" class="form-control" name="addressEmployee"
                               value="<c:out value='${employee.address}'></c:out>">
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
                        <label>Level</label>
                        <select name="level" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="level" items="${levels}">
                                <option value="${level.id}"><c:out value="${level.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Department</label>
                        <select name="department" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="department" items="${departments}">
                                <option value="${department.id}"><c:out value="${department.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="/furama_resort?activity=showListEmployee"><input type="button" class="btn btn-default" value="Cancel"></a>
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
