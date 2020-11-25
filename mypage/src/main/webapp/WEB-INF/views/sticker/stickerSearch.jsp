<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function stikerLoad() {
		var keyword = $('#st').val();
		if (!keyword) {
			alert('키워드 입력후에 실행하시오');
			$('#st').focus();
			return false;
		}
		$.post("${path}/sticker/stickerSearch", "keyword="+keyword, function(data) {
			$('#stikerImage').html(data);
		});
	}

</script>
</head>
<body>
	<div class="container" align="center">
		<c:set var="stickerNum" value="${no }"></c:set>

		<!-- 검색 -->
		<tr>
		<th>스티커를 검색하세요.</th>
		</tr>

			<input type="text" class="form-control form-control-lg" name="keyword" value="${sticker.keyword}" id="st">
			<input type="button" onclick="stikerLoad()" value="확인">
	</div>

<div id="stikerImage"></div>


</body>
</html>