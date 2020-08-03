<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Central Media</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.navigation1 {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #FF1D58;
  position: fixed;
  height: 1000px;
  overflow: auto;
}

.navigation1 a {
  display: #FF1D58;
  color: white;
  padding: 16px;
  text-decoration: none;
}
 
.navigation1 a.active {
  background-color: #FF1D58;
  color: white;
}

.navigation1 a:hover:not(.active) {
  background-color: #c2022f;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .navigation1 {
    width: 100%;
    height: auto;
    position: relative;
  }
  .navigation1 a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .navigation1 a {
    text-align: center;
    float: none;
  }
}

.main {
  margin-left: 195px;
  margin-top:0px;
  margin-right:0px;
  margin-bottom:0px;
  background-color: white;
  top: 0px;
  overflow: auto;
}

.homebar{
  margin-left: 0px;
  margin-top:10px;
  margin-right:0px;
  margin-bottom:0px;
}
h3, .h3{
background-color: deepskyblue;
padding: 10px;
}
</style>

<body>
	<div class="navigation1">
		<div role="navigation">
		<div class="navbar navbar-inverse">
		<div class="navbar-collapse collapse">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="/welcome">Home</a></li>
					<li><a href="/login">Login</a></li>
					<li><a href="/register">New Registration</a></li>
					<li><a href="/show-users">All Users</a></li>
					<li><a href="/card">Card</a></li>
				</ul>
			</div>
		</div>
		</div>
	</div>
      
	<div class="main">
	<c:choose>
	<c:when test="${mode=='MODE_HOME' }">
			<div class="homebar">
			<div class="container" id="homediv">
				<div class="jumbotron text-center" style="background-color: deepskyblue;">
					<h1>Welcome to Central Media</h1>
					<h2>Welcome with Vanakkam</h3>
				</div>
				</div>
			</div>
	</c:when>
	<c:when test="${mode=='MODE_CARD' }">
	
	</c:when>
	<c:when test="${mode=='MODE_REGISTER' }">
		<div class="container text-center">
				<h3>New Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<div class="form-group row">
						<label class="control-label col-md-3">Emp-ID </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="id"
								value="${user.id }" />
						</div>
						</div>
					
					<div class="form-group row">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
			</c:when>
			
			<c:when test="${mode=='ALL_USERS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered" style="background-color:#5CDB95;">
						<thead>
							<tr align="center">
								<th>Id</th>
								<th>UserName</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Age</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td>${user.age}</td>
									<td><a href="/delete-user?id=${user.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${user.id }"><span class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
			<c:when test="${mode=='UPDATE' }">
		<div class="container text-center">
				<h3>Update Information</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<div class="form-group row">
						<label class="control-label col-md-3">Emp-ID </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="id"
								value="${user.id }" />
						</div>
						</div>
					
					<div class="form-group row">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
			</c:when>
			
			<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>User Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
					</form>
					</div>
					</c:when>
			
	</c:choose>
</div>





<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>