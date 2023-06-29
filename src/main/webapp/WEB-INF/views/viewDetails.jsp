<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%> <!-- put this tage to display model object -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Print</title>
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
	width: 90%;
	height: auto;
	margin: 30px;
	padding: 20px;
}

a {
	text-decoration: none;
}

.first {
	border: 1px solid gray;
	border-radius: 5px;
	width: 90%;
	height: auto;
	margin: 30px;
	padding: 20px;
}

.pic{
  margin: auto;
  width: 100%;
  height: 100%;
  border: 1px solid #D3D3D3;
  padding: 10px;

}

</style>
</head>
<body>


	<div style="padding: 20px;">
		<button class="btn btn-outline-light" type="button"
			onclick="window.print()">
			<img alt="print"
				src="https://w7.pngwing.com/pngs/989/12/png-transparent-computer-icons-printing-printer-print-electronics-rectangle-computer-icons-thumbnail.png"
				height="30px" width="30px">
		</button>
	</div>



	<div class="main">

<!-- <form action="process-email" method="get" modelAttribute="emailDTO"> 
<label>Email Report :</label>
<input type="email" name="userEmail" placeholder="Enter your Email Id"/>
<input type="submit" value="Send">
</form> -->

<div class="pic">

<p>photo</p>

</div>


<br>
		<table class="table table-bordered">
			<%-- ${teacher} --%>
			
			<c:forEach var="teacher" items="${teacher}">
				<tr>
					<th colspan="2" style="text-align: center;">Teacher Details</th>
				</tr>


				<tr>
					<th>Teacher ID :</th>
					<td>${teacher.id}</td>
				</tr>

				<tr>
					<th>Teacher Name:</th>
					<td>${teacher.teachername}</td>
					</th>
				</tr>


				<tr>
					<th>Gender :</th>
					<td>${teacher.gender}</td>
					</th>
				</tr>

				<tr>
					<th>Address :</th>
					<td>${teacher.address}</td>
					</th>
				</tr>
				<tr>
					<th>City :</th>
					<td>${teacher.city}</td>
					</th>
				</tr>
				<tr>
					<th>State :</th>
					<td>${teacher.state}</td>
					</th>
				</tr>

				<tr>
					<th>Country :</th>
					<td>${teacher.country}</td>
					</th>
				</tr>
		</table>

		<table class="table table-bordered">
			<tr>
				<th colspan="2" style="text-align: center;">Teacher liability</th>
			</tr>

			<tr>
				<th style="text-align: center;">Classes Handled</th>
				<th style="text-align: center;">Subjects Handled</th>
			</tr>

			<tr>
				<td style="text-align: center;">${teacher.classess}</td>
				<td style="text-align: center;">${teacher.subjects}</td>
			</tr>

			</c:forEach>
		</table>



	</div>


</body>
</html>