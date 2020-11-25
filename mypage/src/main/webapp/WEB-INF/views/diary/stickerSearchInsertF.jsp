<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function stiker_SLoad() {
		var keyword = $('#st').val();
		if (!keyword) {
			alert('키워드를 다시 확인해주세요');
			$('#st').focus();
			return false;
		}
//		$('#stiker_Slist').load("${path}/diary/stiker_Slist", "keyword=" + keyword);
 		$.post("${path}/diary/stiker_Slist", "keyword=" + keyword,
				function(data) {
			
					$('#stiker_Slist').html(data);
				}); 
	}
</script>
</head>
<body>
	<div class="input-group mb-3">
		<c:set var="stickerNum" value="${no }"/>
		<input type="text" name="keyword" value="${hashAndSti.keyword}"
			id="st" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2"> 
			 <div class="input-group-append">
			 <button onclick="stiker_SLoad()" class="btn btn-outline-secondary" type="button">확인</button>		
	</div>
	</div>
	<!-- 검색 된 이미지가 보여 줄 공간  -->
	<div id="stiker_Slist"></div>

</body>
</html>