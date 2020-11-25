<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="hidden" name="stickerNum" value="${hashAndSti.stickerNum}">	 
	<form action="hash/hashupdate" method="post">
		<input type="hidden" value="${Sticker.stickerNum}"> 
		<input type="text" value="${hashtag.hashName}"> 
		<input type="submit" value="확인">
	</form>
	
 
</body>
</html>