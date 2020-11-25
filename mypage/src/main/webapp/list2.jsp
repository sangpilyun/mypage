<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

<script type="text/javascript">
	$(function() {
		$("#save").click(function() {
			html2canvas($("#downloadImage"), {
				onrendered : function(canvas){ 
					canvas.toBlob(function(blob) {
						saveAs(blob, 'image.png');
					});

				}
			});
		});
	});
</script>

</head>
<body>
	<div id="downloadImage" align="center" style="width: 391px;">
		<img alt="" src="images/pic01.jpg">
		<img alt="" src="images/pic02.jpg">
	</div>
	<div>
		<button id="save">저장하기</button>
	</div>
</body>
</html>