<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
abc {  
    color: #333;
    font-family: Helvetica, Arial, sans-serif;
   
    border: 1px solid black;
}

tr,th {  
    border: 1px solid ; /* No more visible border */
    height: 30px; 
    transition: all 0.3s;  /* Simple transition for hover effect */
}

tr {  
    background: #DFDFDF;  /* Darken header a bit */
    font-weight: bold;
}

th {  
    background: #EEE8E7;
    text-align: center;
}
.divA{
background-color: #5c489a;
				color: #fff;
				height: 400px;
				width: 600px;
				margin: 0px auto;
				padding:3px;
				
}
.divA1{
	background-color: #efefef;
				color: #000;
				height: 400px;
				width: 48%;
				float: left;
	
}
.divA2{
	background-color: #efefef;
				color: #000;
				height: 400px;
				width: 48%;
				float: right;
}
.topnav {
  overflow: hidden;
  background-color: #635a8a;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #350575;
  color: white;
}

.topnav a.active {
  background-color:#876bcc;
  color: white;
}
body{
background-image: url("https://img.jakpost.net/c/2019/03/02/2019_03_02_66706_1551461528._large.jpg");
background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: #4f379a;
  border: none;
  color: white;
  padding: 6px 32px;
  text-decoration: none;
  margin:7px 6px
  cursor: pointer;
}
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Page</title>
</head>
<body >
<div class="topnav">
  <a class="active" href="#home">Home</a>
 
  <a href="/view">View All Courses</a>
  <a href="/logout">Logout</a>
</div>
<div class="main">
<div style="padding-left:16px">
  <h2>Login Successful !!</h2>
</div>
		<div class="divA">
		<div class="divA1">
		<form:form modelAttribute="course" action="/submitCourse" method="POST">
			<table>
			<caption>Add your Course to the Table</caption>
				<tr>
					<td>Course Name:</td>
					<td><input type="text" path="courseName" name="courseName" id="courseName" required /></td>
				</tr>
				<tr>
					<td>Author Name:</td>
					<td><input type="text" path="courseAuthor" name="courseAuthor" id="courseAuthor" required /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Add" name="submit" id="submit"></td>
					<td><input type="reset" value="Reset" name="reset" id="reset"></td>
				</tr>
				
			</table>
		</form:form>
		 
		<p>${id1}</p>
		</div>
		<div class="divA2">
		<form:form modelAttribute="crud" method="POST">
		<table class="abc">
		<caption>List of Courses Available....</caption>
    <tr class="suv">
        <th>ID</th>
        <th>Course Name</th>
        <th>Author</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${Courselist}" var="list" varStatus="status">
        <tr class="suv">
            <td class="xyz">${list.getCourseId()}</td>
            <td class="xyz">${list.getCourseName()}</td>
             <td class="xyz">${list.getCourseAuthor()}</td>
            <td class="xyz">
                <a href="/edit/${list.getCourseId()}">Edit</a>
           	</td>
           	<td class="xyz">     
                <a href="/delete/${list.getCourseId()}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</form:form>
</div>
</div>
</div>
</body>