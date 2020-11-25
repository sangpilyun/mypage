<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function add(index,stickerNum) {
		$('#hash_'+index).load("hash/hashInsertForm?stickerNum="+stickerNum);	
	}
	function updateAdd(index,stickerNum) {
		alert(stickerNum);
		$('#hashUD_'+index).load("hash/hashupdateForm?stickerNum="+stickerNum);	
	}
</script>
</head>
<body>
	<!-- 이미지 출력 리스트 -->

	<div align="center" id="image">
		<c:set var="stickerNum" value="${no }"></c:set>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">정보가 없습니다</th>
			</tr>
		</c:if>

		<input type="hidden" value="${stickerNum }">
		<c:if test="${not empty list}">
			<c:forEach var="sticker" items="${list }" varStatus="i">
				<c:if test="${sticker.groupName == sticker1.keyword }">
					<table>
						<tr>
							<th width="10%"><img alt="사진"
								src="${path}/images/stickerImage/${sticker.name}" width="100px"
								height="100px"></th>
							<!-- image -> name 바꾸기  -->

							<!-- 해시 태그 추가 리스트 -->
							<th><c:if test="${empty sticker.hashList}">
									<th colspan="5">내용이 없습니다.</th>
								</c:if> <c:if test="${not empty sticker.hashList }">

									<c:forEach var="hl" items="${sticker.hashList}">
											${hl.hashName}
									</c:forEach>
								</c:if></th>
							<!-- 
								<div id="hashList" align="center"></div> -->

							<!-- 해시태그 추가 -->
							<th><a id="hashInsert"
								onclick="add(${i.index},${sticker.stickerNum})">추가</a></th>

							<%-- <!-- 해시태그 수정 -->
							<th><a id="hashupdate" onclick="updateAdd(${i.index},${sticker.stickerNum})">수정</a></th>


							<th><a id="hashdelete">삭제</a></th> --%>
					</table>
				</c:if>

				<tr>
					<td>
						<div id="hash_${i.index}" align="center"></div>
					</td>
					<td>
						<div id="hashUD_${i.index}" align="center"></div>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</div>


</body>
</html>