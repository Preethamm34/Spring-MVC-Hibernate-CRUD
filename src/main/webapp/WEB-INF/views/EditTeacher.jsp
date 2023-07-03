<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
	
<%@include file="/WEB-INF/resources/js/country-states-city.js"%>
	
</script>

<style>

/* <link rel="stylesheet" type="text/css" href="/WEB-INF/resources/css/style.css"> */

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

.form1 {
	border: 1px solid gray;
	border-radius: 5px;
	width: auto;
	height: auto;
	margin: 20px;
	padding: 10px;
}

.form2 {
	border: 1px solid gray;
	border-radius: 10px;
	width: 450px;
	height: auto;
	margin: 10px;
	padding: 5px;
}

table, th, td {
	border: 1px solid black;
	border-radius: 10px;
	border-collapse: collapse;
	margin: 10px;
	padding: 5px;
}
a {
	text-decoration: none;
}
</style>



</head>
<body>

	<div class="main">

		<h2>Add Details</h2>

		<div class="form1">

			<form action="updateTeacher" modelAttribute="teacher" method="POST">

				<label for="id">Id :</label> 
				<input type="text" name="id" id="id" value="${teacher.id}" readonly="readonly">
				<br> <br> 

				<label for="teachername">Teacher Name :</label>
				<input type="text"name="teachername" id="teachername" value="${teacher.teachername}">
				<br> <br> 
				  
				<labelfor="gender">Gender :</label>
				<input type="radio" name="gender" id="gender" value="${teacher.gender}"><label>Male</label> 
				<input type="radio" name="gender" id="gender" value="${teacher.gender}"><label>Female</label>
				<br> <br> 
				
				<label for="address">Address :</label>
				<textarea id="address" name="address" id="address" rows="3"  value="${teacher.address}"></textarea>
				<br> <br>
				
				<!-- -------------------------------------------------------------------------------->
				
				<label for="country">Country :</label> 
				<select id="countyList" name="country" id="country" value="${teacher.country}" class="form-select">
				<option value="" name="country" id="country" selected="selected" value="${teacher.country}">select country</option>
				</select> 
				
				<label for="state">State :</label>
				<select id="stateList" name="state" id="state" value="${teacher.state}" class="form-select">
				<option value="" name="state" id="state" selected="selected" value="${teacher.state}">Select State</option>
				</select>
				
				<label for="city">City :</label> 
				<select id="cityList" name="city" id="city" value="${teacher.city}" class="form-select">
				<option value="" name="city" id="city" selected="selected" value="${teacher.city}">Select City</option>
				</select>

				<!-- -------------------------------------------------------------------------------->
				<br><br>
	  				<!-- image upload -->

                   <label> Upload Image :</label>
                   <input type="file" name="fileUpload" accept="image/png, image/jpeg"  size="50" value="${teacher.fileUpload}" />
          

				<!-- -------------------------------------------------------------------------------->
				

				<div class="form2">
					<h3>The Responsibilities of a teacher</h3>

					<table>
						<tr align="center">
							<td>Classes Handled</td>
							<td>Subjects</td>
						</tr>
						<tr>
							<td><input type="text" id="classess" name="classess" value="${teacher.classess}"></td>
							<td><input type="text" id="subjects" name="subjects" value="${teacher.subjects}"></td>
						</tr>
					</table>
				</div>
				<!-- <div class="form2"> -->
				 <!-- -------------------------------------------------------------------------------->
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>

		</div>
		<!-- <div class="form1"> -->
		<button>
			<a href="/MvcHibeCrud/teacherReport ">View Report</a>

		</button>
		<button>
			<a href="/MvcHibeCrud/home">Back</a>
		</button>

	</div>
	<!-- div for <div class="main"> -->


</body>
</html>