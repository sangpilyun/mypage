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


	<div align="center" id="image">
		<c:set var="stickerNum" value="${no }"></c:set>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">정보가 없습니다</th>
			</tr>
		</c:if>

		
		<c:if test="${not empty list}">
			<c:forEach var="sticker" items="${list}" varStatus="i">
				<c:if test="${sticker.hashName == has.keyword }">
				
							<img alt="사진"
								src="${path}/images/stickerImage/${sticker.name}" width="100px"
								height="100px">
				
					</c:if>
				</c:forEach>
			</c:if>
								</div>
								

</body>
</html>