<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://fastcdn.org/FileSaver.js/1.1.20151003/FileSaver.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script>
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
		showDivs(slideIndex += n);
	}

	function currentDiv(n) {
		showDivs(slideIndex = n);
	}

	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("content");
		var dots = document.getElementsByClassName("demo");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" w3-white", "");
		}
		x[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " w3-white";
	}
</script>
<style>
.mySlides {
	display: none
}

.w3-left, .w3-right, .w3-badge {
	cursor: pointer
}

.w3-badge {
	height: 13px;
	width: 13px;
	padding: 0
}
</style>
</head>
<body>
	<div class="w3-container">
		<h2>Diary</h2>
	</div>
	<div class="w3-content w3-display-container" style="max-width: 40em">
		<div id="content"
				style="background-color: ${diary.bgColor}; position: relative; overflow: hidden; width: 40em; height: 50em;">
				<c:forEach items="${opList }" var="op">
					<c:forEach items="${opStickerList }" var="s">
						<c:if test="${op.stickerNum==s.stickerNum }">
							<div class="sti" style="height: ${op.height}px; width: ${op.width}px; left:${op.x}px; top:${op.y}px; position:absolute;">
								<img alt="" src="${path }/images/stickerImage/${s.name}"
									style="width: 100%; height: 100%; padding: 0">

							</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${opTxtList }" var="t">
						<c:if test="${op.textboxNum==t.textboxNum }">
							<div
								style="font-size:${t.fntSize }; font-weight:${t.fntWeight }; color:${t.fntColor } ;height: ${op.height}px; width: ${op.width}px; left:${op.x}px; top:${op.y}px; position:absolute; ">
								${t.content }</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		<div
			class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
			style="width: 100%">
			<div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			<span class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(1)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(2)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(3)"></span>
		</div>
	</div>
</body>
</html>