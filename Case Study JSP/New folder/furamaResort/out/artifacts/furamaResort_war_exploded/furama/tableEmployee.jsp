<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>List Employee</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            /*background: #f7f5f2;*/
            font-family: 'Roboto', sans-serif;
            background-image: url("https://tinviet365.net/wp-content/uploads/2020/03/66-%E1%BA%A2nh-n%E1%BB%81n-m%C3%A1y-t%C3%ADnh-%C4%91%E1%BA%B9p-nh%E1%BA%A5t-hi%E1%BB%87n-nay-Full-HD-c%C3%B3-link-t%E1%BA%A3i-v%E1%BB%81.jpg");
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
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

        ​
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
<div class="container-lg">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title" style="background-color: #3472a9">
                <div class="row">
                    <div class="col-sm-5"><h2>Employee <b>Details</b></h2></div>
                    <div class="col-sm-2">
                        <a href="#addNoteModal" data-toggle="modal" class="btn btn-success add-new"><i
                                class="fa fa-plus"></i>
                            Add New</a>
                    </div>
                    <div class="col-sm-5">
                        <div class="search-box">
                            <div class="input-group">
                                <input type="text" id="search" class="form-control" placeholder="Search by Name">
                                <input type="submit" value="search" class="btn btn-success">
                            </div>
                        </div>
                    </div>
                    ​
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                <tr>
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
                </thead>
                <tbody>
                <tr>
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
                        <a href="#" class="view" title="View" data-toggle="tooltip"><i
                                class="material-icons">&#xE417;</i></a>
                        <a href="/furama_resort?activity=editEmployee&id=${employee.id}" class="edit" title="Edit" ><i
                                class="material-icons">&#xE254;</i></a>
                        <a href="/furama_resort?activity=deleteEmployee&id=${employee.id}" class="delete" title="Delete" ><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
​



​

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