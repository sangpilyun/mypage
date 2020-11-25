<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#box {
	width: 40em;
	height: auto;
	border-radius: 7px;
	 border: 1px solid; 
}
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

	<div id="noticeV" align="center">

		<h2>Notice</h2>
		<div>" ${notice.subject } "</div>

		<div>${notice.regDate }</div>

		<br>
		<div id="box">
			<table>
				<tr>
					<td>${notice.content }</td>
				</tr>
			</table>
		</div>

	</div>

	<p>
	<div align="center">
		<button onclick="location.href='${path}/main#notice'">리스트 가기</button>

		<c:if test="${memberNum==4 }" >
		<button
			onclick="location.href='updateForm?noticeNum=${notice.noticeNum}'"
			id="update">수정하기</button>
		<button onclick="location.href='delete?noticeNum=${notice.noticeNum}'">삭제하기</button>
		</c:if>


	</div>
</body>
</html>