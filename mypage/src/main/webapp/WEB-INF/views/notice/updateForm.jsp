<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>table_form</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<style type="text/css">
a:link {
	text-decoration: none;
	color: #646464;
}

a:visited {
	text-decoration: none;
	color: #646464;
}

a:active {
	text-decoration: none;
	color: #646464;
}

a:hover {
	text-decoration: none;
	color: #646464;
}
</style>
</head>
<body>
	<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 50px; color: black">My
				Page</span></a>
	</div>
	<form action="update" method="post">
		<input type="hidden" name="noticeNum" value="${notice.noticeNum }">
		<div id="noticeV" align="center">

			<table>
				<tr>
					<th>제목</th>
				<tr>
					<td><input type="text" name="subject"
						value="${notice.subject }" required="required"
						autofocus="autofocus" class="form-control"></td>
				</tr>

				<tr>
					<th>내용</th>
				<tr>
					<td><pre>
							<textarea rows="10" cols="100" name="content" required="required"
								class="form-control">${notice.content }</textarea>
				</pre></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="확인"></th>
			</table>
		</div>


	</form>
</body>
</html>