<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>my page</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--draggable  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<!--resizable -->
<script type="text/javascript">
$(function() {
	$('#inputTd').hide();

	$('#cataNum').change(function() {
		var dc = $('#cataNum').val();
		if (dc == 'makeCata') {
			$('#select').hide();
			$('#inputTd').show();
			$('#newCata').focus();
		}
	});
});
function insertCata() {
	var name = $('#newCata').val();
	location.href ='${path}/diaryCatagory/insert?diaryNum=${diary.diaryNum}&name='+ name;
}
function cataReset() {
	$("#inputTd").hide();
	$("#select").show();
}
	$(function () {
		$('.sti').draggable().resizable();
		$('.textbox').draggable({
			snap : true,
			cursor : "move",
			delay : 100,
			scroll : false,
			cancel : "text",
			drag : function(e, ui) {
			}
		}).resizable({
			/* containment : "parent", */ /* height 못 커지게 막음 */
			stop : function(e, ui) { /*얘네 가 있어야  draggable이 가능  */
				var width = ui.size.width;
				var height = ui.size.height;
				var hereDrag = this; 
			},
		});
		$('#sticker').hide();
		$('#backColor').hide();
		$('#font').hide();
	});
	function openSti1() {
		$('#sticker').show();
		$('#backColor').hide();
		$('#font').hide();
	}
	
	function openText1() {
		$('#font').show();
		$('#sticker').hide();
		$('#backColor').hide();
	}
	
	function openTextarea1(a) {
		a=a+1;
	
		$("#content")
		.prepend(
				"<div class='textbox' style='width: 100px; height: 100px; position:absolute;'><textarea style='width:100%; height:100%;padding:0; border: none; font-size:30px;' class='textarea1' id='"+(a+1)+"' placeholder='textbox'></textarea><div>");

			$('.textbox').draggable({
				snap : true,
				cursor : "move",
				delay : 100,
				scroll : false,
				cancel : "text",
				drag : function(e, ui) {
				//some code
			}
		}).resizable({
			/* containment : "parent", */ /* height 못 커지게 막음 */
			stop : function(e, ui) { /*얘네 가 있어야  draggable이 가능  */
				var width = ui.size.width;
				var height = ui.size.height;
				var hereDrag = this; 
			},
			/* resize : function(e, ui) {
				//some code
			} */
		});
	}
	function goSti(num,name) {
		console.log("name="+name);
		$('#content').prepend("<div class='sti' id='"+num+"' title='"+num+"' style='width:100px;height:100px; position:absolute;'><img src='${path}/images/stickerImage/"+name+"' style='padding=0;width: 100%;height: 100%'/></div>");
		$('.sti').resizable().draggable();
	}
	function openBg1() {
		$('#backColor').show();
		$('#sticker').hide();
		$('#font').hide();
	}
	function bg() {
		var bg=$('#bgColor').val();
		$('#content').css('background-color',bg);
	}
	function fontSize1() {
		var fontSize=$('#fontSize').val();
		$('.text').css('font-size', fontSize+'px');
	}
	function fnt() {
		var fontColor=$('#fontColor').val();
		$('.text').css('color',fontColor);
	}
	function fntWeight() {
		var fontWeight=$('#fontWeight').val();
		$('.text').css('font-weight',fontWeight);
	}
	function update(num) {
		/* 값 넣었는 지 체크 */
		diaryCataNum = $('#cataNum').val();
		if (diaryCataNum == null) {
			alert("카테고리를 선택해주세요.");
			return false;
		}
		var subject = $('#subject').val();
		if (subject == "") {
			alert("제목을 입력해주세요.");
			$('#subject').focus();
			return false;
		}
		/* 보낼 값 */
		var allList = [];
		var diaryNum= num;
		var bgColor 
		var diary =  {
				diaryNum :diaryNum,
				subject:$('#subject').val(),
				diaryCataNum:$('#cataNum').val(),
				bgColor : $('#bgColor').val(),
		};
		allList.push(diary);
		/* alert("diary bgColor="+diary.bgColor);
		alert("diary diaryCataNum="+diary.diaryCataNum);
		alert("diary subject="+diary.subject);  */
		$('.sti').each(function() {
			var id = parseInt($(this).attr('id'),10);
			var width= $(this).width();	
			var height= $(this).height();
			var position = $(this).position();
			var x = position.left;
			var y = position.top;
			var location = {
					'st' : 'st',
					'stickerNum' : id,
					'stWidth' : width,
					'stHeight' :height,
					'stX' : x,
					'stY' : y
			}
			allList.push(location);	
			/* alert("sti stickerNum="+location.stickerNum);
			alert("sti stWidth="+location.stWidth);
			alert("sti stHeight="+location.stHeight);
			alert("sti stX="+location.stX);
			alert("sti stY="+location.stY); */
		});
		
		$('.text').each(function(){
			var width= $('.textbox').width();	
			var height= $('.textbox').height();
			var position = $('.textbox').position();
			var x = position.left;
			var y = position.top;
			var content = $(this).val();
			var fontSize =  $(this).css('font-size');
			var fontColor =  $(this).css('color');
			var fonWeight =  $(this).css('font-weight');
/* 		 	alert(width);
			alert(height); 
			alert(content);
			alert(x);
			alert(y);  */
		
 		/* 	alert(fontSize);
			alert(fontColor);
			alert(fonWeight);  */
			var textLocation = {
					'txt' : 'txt',
					'txtWidth' : width,
					'txtHeight' :height,
					'txtX' : x,
					'txtY' : y,
					'content' : content,
					'fntSize':fontSize,
					'fntColor':fontColor,
					'fntWeight':fonWeight
			}
			allList.push(textLocation);
		})
		/* console.log(typeof List); */
		$.ajax({
			url:"updateDeco",
			dataType: "json",
			contentType : "application/json",
			data : JSON.stringify(allList),
			type:"POST",
			success :function(data){
				if(data=='1'){
				 	alert("다이어리 수정 성공");
				 	/* screenShot($('#content'),"${diary.diaryNum}"); */
					location.href="${path}/diary/view?diaryNum=${diary.diaryNum}";
				}
			}
		});	
	}
	function reset() {
		$('.sti').remove();
		$('.textbox').remove();
	}
	function screenShot(target,diaryNum) {
		alert("screenShot함수 들어옴");
		console.log(typeof(target));
		console.log(typeof(diaryNum));
		console.log("screen 메소드 실행");
		if (target != null && target.length > 0) {
			console.log("if문 실행");
			var t = target[0];
			console.log("t : " + t);
			html2canvas(t).then(function(canvas) {
				var myImg = canvas.toDataURL("image/png");
				myImg = myImg.replace("data:image/png;base64,", "");
				console.log("myImg : " + myImg);
				$.ajax({
					type : "POST",
					data : {
						"imgSrc" : myImg,
						"diaryNum" : diaryNum
					},
					dataType : "text",
					url : "${path}/community/ImgSave",
					success : function(data) {
						console.log(data);
						alert("공유 성공");
						location.href="${path}/main#community";
					},
					error : function(a, b, c) {
						alert("error");
					}
				});
			});
		}
		}
</script>
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

#content {
	width: 40em;
	height: 50em;
	border-radius: 7px;
	position: relative;
	overflow: hidden;
}

textarea {
	background-color: transparent;
}

textarea:focus {
	outline: none;
}
</style>
</head>
<body>
	<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 50px; color: black; margin-bottom: 20">My
				Page</span></a>
	</div>
	<div id="mainCcontainer" align="center">
		<table class="center"
			style="margin: auto; width: 50em; text-align: center;">
			<tr>
			<tr>
				<td id="select"><select name="diaryCataNum" id="cataNum"
					class="form-control" style="border: thin;">
						<c:forEach var="c" items="${cataList }">
							<c:if test="${c.del !='y' }">
								<c:if test="${diary.diaryCataNum == c.diaryCataNum }">
									<option selected="selected" value="${c.diaryCataNum }">${c.name }</option>
								</c:if>
								<c:if test="${diary.diaryCataNum != c.diaryCataNum }">
									<option value="${c.diaryCataNum }">${c.name }</option>
								</c:if>
							</c:if>
						</c:forEach>
						<option value="makeCata">카테고리 만들기</option>
				</select></td>
			</tr>
			<tr>
				<td id="inputTd"><input type="text" name="name" id="newCata"
					class="form-control" aria-label="Recipient's username"
					aria-describedby="basic-addon2" placeholder="create your catagory"
					autofocus="autofocus"> <input type="button"
					onclick="insertCata()" class="btn btn-outline-secondary" value="등록">
					<input type="button" onclick="cataReset()"
					class="btn btn-outline-secondary" value="취소"></td>
			</tr>
			<tr>
				<td><input class="form-control"
					aria-label="Recipient's username" aria-describedby="basic-addon2"
					autofocus="autofocus" name="subject" id="subject"
					style="border: thin;" value="${diary.subject }"></td>
			</tr>
		</table>
		<div class="container" align="center"
			style="width: 40em; height: 50em;">
			<div>
				<span style="font-family: 'Lilly'; font-size: 20px"> <a
					onclick="openBg1()">background</a></span><span style="font-size: 20px">ㅣ</span>
				<span style="font-family: 'Lilly'; font-size: 20px"> <a
					onclick="openText1()">textbox</a></span> <span style="font-size: 20px">ㅣ</span>
				<span style="font-family: 'Lilly'; font-size: 20px"> <a
					onclick="openSti1()">sticker</a></span>
			</div>
			<p>
			<p>
			<p>
			<div id="backColor">
				<input type="color" class="bgInput" id="bgColor"
					value="${diary.bgColor }">

				<button class="bgInput" onclick="bg()"
					class="btn btn-outline-success">적용</button>
			</div>
			<div id="font">
				<div>
					<c:set var="a" value="1" />
					<button onclick="openTextarea1(${a})"
						class="btn btn-outline-success" style="width: 30%">텍스트박스</button>
					<select id="fontSize" onchange="fontSize1()" class="form-control"
						style="width: 30%">
						<option selected="selected" disabled="disabled">font
							size</option>
						<c:forEach var="i" begin="10" end="80">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<input type="color" id="fontColor">
					<button onclick="fnt()" class="btn btn-outline-success">적용</button>
				</div>
				<div style="width: 30%">
					<input type="range" id="fontWeight" min="200" max="900"
						onchange="fntWeight()" class="form-control-range">
				</div>
			</div>
			<div id="sticker">
				<ul class="nav nav-pills">
					<c:forEach items="${stickerGName}" var="g">
						<li><a data-toggle="pill" href="#${g.groupName }">${g.groupName}</a></li>
					</c:forEach>
				</ul>
				<div class="tab-content">
					<c:forEach items="${stickerGName}" var="g">
						<div id="${g.groupName }" class="tab-pane fade" style="margin: 20">
							<c:forEach items="${stickerList }" var="s">
								<c:if test="${g.groupName==s.groupName }">
									<a onclick="goSti(${s.stickerNum },'${s.name}')"><img
										src="${path }/images/stickerImage/${s.name}" width="100px"
										height="100px"></a>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="content" style="background-color: ${diary.bgColor};">
				<c:forEach items="${opList }" var="op">
					<c:forEach items="${opStickerList }" var="s">
						<c:if test="${op.stickerNum==s.stickerNum }">
							<div class="sti" id="${s.stickerNum}"
								style="height: ${op.height}px; width: ${op.width}px; left:${op.x}px; top:${op.y}px; position:absolute;">
								<img alt="" src="${path }/images/stickerImage/${s.name}"
									style="width: 100%; height: 100%; padding: 0">
							</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${opTxtList }" var="t">
						<c:if test="${op.textboxNum==t.textboxNum }">
							<div class="textbox"
								style="height: ${op.height}px; width: ${op.width}px; left:${op.x}px; top:${op.y}px; position:absolute; ">
								<textarea
									style='width:100%; height:100%;padding:0; border: none; font-size:${t.fntSize } ;font-weight:${t.fntWeight } ; color:${t.fntColor } ;'
									class='text'>${t.content }</textarea>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			<div style="margin-top: 200" align="center">
				<button type="button" class="btn btn-outline-success"
					onclick="update(${diary.diaryNum})">저장</button>
				<button type="button" class="btn btn-outline-success"
					onclick="reset()">초기화</button>
				<div>
					<div style="margin-right: 100px" align="right">
						<a href="${path }/diary/view?diaryNum=${diary.diaryNum}">수정취소</a>ㅣ
						<a href="${path}/main#diaryList">다이어리리스트 가기</a> ㅣ <a
							href="delete?diaryNum=${diary.diaryNum}">삭제하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>