<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="../member/sessionChk.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>table_form</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<form action="notice/insert" method="post">
<input type="hidden" name="memberNum" value="${memberNum}">


<table>
		<tr><th>subject</th></tr>
		<tr><td><input type="text" name="subject" required="required" autofocus="autofocus" name="subject" width="50px"></td></tr>
		<tr><th align="center">content</th></tr>
		<tr><td><pre><textarea cols="100" rows="30" name="content"></textarea></pre></td></tr>
		<tr><td align="center"><input type="submit"></td></tr>
	</table>
	</form>
</body>
</html>