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
<script type="text/javascript">

</script>

<form action="hash/hashInsert" method="post" >
	 해시 태그 :
	<input type="hidden" name="stickerNum" value="${sticker.stickerNum}">
	
	<input type="text" placeholder="#Hashtag" autofocus="autofocus"
		required="required" name="hashName">
	<input type="submit" value="확인" id="hInsert">

</form> 

</body>
</html>