<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
body {
	display: table;
}

.main {
	border: 1px solid gray;
	border-radius: 5px;
	width: auto;
	height: auto;
	margin: 30px;
	padding: 20px;
}

.tab1 {
	border: 1px solid gray;
	border-radius: 5px;
	width: auto;
	height: auto;
	margin: 20px;
	padding: 10px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>

	<div class="main">
		<h3>Details</h3>
		<br> <a href="addTeacher">Add New</a> <br>

		<!--  add a search box -->

		<form:form action="/MvcHibeCrud/search" method="POST">
                Search : <input type="text" placeholder="By Name"
				required="required" name="teachername" />
			<input type="submit" value="Search" class="add-button" />
		</form:form>

		<!--  Export to excel -->
<br>
		<div>
			<a href="/MvcHibeCrud/excelExport" class="btn btn-success">Export Excel</a>
				 &nbsp; &nbsp;
				<a href="/MvcHibeCrud/printReport" class="btn btn-success">Print</a>
		</div>
		
		<br />

		<div class="tab1">

			<table class="table table-bordered">
				<thead>
					<tr style="text-align: center;">
						<th scope="col">Sl No</th>
						<th scope="col">Teacher Name</th>
						<th scope="col">Gender</th>
						<th scope="col">Address</th>
						<th scope="col">Country</th>
						<th scope="col">State</th>
						<th scope="col">City</th>
						<th scope="col">Classes Handled</th>
						<th scope="col">Subjects</th>
						<th scope="col" colspan="2">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="teach" items="${teachername}">
						<tr>
							<td class="table-plus">${teach.id}</td>
							<td>${teach.teachername}</td>
							<td>${teach.gender}</td>
							<td>${teach.address}</td>
							<td>${teach.country}</td>
							<td>${teach.state}</td>
							<td>${teach.city}</td>
							<td>${teach.classess}</td>
							<td>${teach.subjects}</td>
							<td><a href="editTeacher/${teach.id}"
								class="btn btn-warning"> Edit </a></td>
							<td><a href="deleteTeacher/${teach.id}"
								class="btn btn-danger"
								onclick="confirm('Confirm, To Delete The Record ?')"> Delete
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- <div class="tab1"> -->

	</div>
	<!-- <div class="main"> -->

</body>
</html>