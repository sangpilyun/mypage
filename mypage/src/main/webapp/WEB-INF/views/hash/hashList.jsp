<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
/* 
function list(index){
	$("#name_"+index).show();
}
 */

</script>
</head>
<body>
<%-- <c:if test="${empty List }">
<th colspan="5"> 내용이 없습니다. </th>
</c:if>

<c:forEach var="hl" items="${hashList }" varStatus="a">
	<c:if test="${not empty List }">
	<tr>
		<td id="name_${a.index}">${hl.hashName}</td>
	</tr>
</c:if>
</c:forEach>
 --%>



</body>
</html>