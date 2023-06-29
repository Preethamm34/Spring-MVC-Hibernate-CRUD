<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	
	function clrForm(formId) {
		document.getElementById("agentName").value = '';
		document.getElementById(formId).submit();
	}
	function srch(formId) {
		var teachername=document.getElementById("teachername").value;
		if (document.getElementById("teachername").value == "") {
			alert("Please Enter teachername");
			return false;
		}
		var form=document.getElementById(formId);
		        form.action="${pageContext.request.contextPath}/searchTN"
		        form.submit();
	}
	
	
	function srch1(formId) {
		var teachername=document.getElementById("classess").value;
		if (document.getElementById("classess").value == "") {
			alert("Please Enter classess");
			return false;
		}
		var form=document.getElementById(formId);
		        form.action="${pageContext.request.contextPath}/searchC"
		        form.submit();
	}

	function srch2(formId) {
		var teachername=document.getElementById("keyword").value;
		if (document.getElementById("keyword").value == "") {
			alert("Please Enter fields");
			return false;
		}
		var form=document.getElementById(formId);
		        form.action="${pageContext.request.contextPath}/searchAll"
		        form.submit();
	}
	
</script>

	<div class="main">
		<h3>Details</h3>
		<br> <a href="addTeacher" class="btn btn-success" style="float: left;">Add New</a> <br><br>

		<!--  add a search box -->

		<form:form action="/MvcHibeCrud/searchTN" method="POST">
		
			 Search :
                <input type="text" placeholder="Search By Name" required
				name="teachername" id="teachername" />&nbsp;
			<input type="submit" value="Search" class="add-button"
				onclick="srch('forms')" />

		</form:form>
		<br>
		<form:form action="/MvcHibeCrud/searchC" method="POST">
			 Search :
			<input type="text" placeholder="Search By Classes Handled" required
				name="classess" id="classess" />&nbsp;
			<input type="submit" value="Search" class="add-button"
				onclick="srch1('forms')" />
		</form:form>

		<!-- SEARCH ANY -->
		<br>

		<form:form action="/MvcHibeCrud/searchAll" method="POST">

			Search :
			<input type="text" placeholder="Search All" required name="keyword"
				id="keyword" />&nbsp;
				<input type="submit" value="Search" class="add-button"
				onclick="srch2('forms')" />
		</form:form>
  

		<!--  Export to excel -->
<br>
		<div>
			<a href="/MvcHibeCrud/excelExport" class="btn btn-success">Export Excel</a>
				 &nbsp; &nbsp;
		</div>
		
		<br />

		<div class="tab1">
		
		
				<p class="text-success">${msg }</p>
			

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
							<th scope="col" colspan="3">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="teach" items="${teacher}">
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
									onclick="confirm('Confirm, To Delete The Record ?')">
										Delete </a></td>
								<td><a href="view/${teach.id}" class="btn btn-warning">
										View </a></td>
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