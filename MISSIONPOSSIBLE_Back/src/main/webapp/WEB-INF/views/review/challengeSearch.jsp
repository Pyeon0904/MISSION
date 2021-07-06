<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 검색</title>
</head>
<body>

 <form id="reviewSearch" name="form1" method="POST" action="${path}/review/challengeSearch">
 <input type="text" name="word" class="form-control" placeholder="검색하고 싶은 챌린지를 입력하세요" style="width: 300px;height:30px" value=${ challenge }>
<button type="submit" class="btn btn-warning" style="height:30px" >검색</button>
 </form>
	 				<table width="100%" class="table01">
						<c:if test="${ list == null }">
							<tr>
		                  		<td colspan="6"></td>
		               		</tr>
						</c:if>
					</table>

</body>
</html>