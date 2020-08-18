<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<style>
table {
border:solid 1px black;
}
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body bgcolor="lavender">
<center>
<h1>Edit A Course with CourseId: ${id}</h1>
		<h2>Course Page</h2>
		
		<form:form modelAttribute="course" action="/update/${id}" method="POST">
			<table>
				<tr>
					<td>Course Name:</td>
					<td><input type="text" path="courseName" name="courseName" id="courseName" /></td>
				</tr>
				<tr>
					<td>Author Name:</td>
					<td><input type="text" path="courseAuthor" name="courseAuthor" id="courseAuthor" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update" name="submit" id="submit"></td>
					<td><input type="reset" value="Reset" name="reset" id="reset"></td>
				</tr>
			</table>
		</form:form>
	</center>
</body>