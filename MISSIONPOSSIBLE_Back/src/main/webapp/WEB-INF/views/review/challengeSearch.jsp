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
<title>챌린지 조회</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<style>
table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
table.type04 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #white;
}
</style>
</head>
<body>
	 				<table class="type04">
	 					<colgroup>
							<col width="30%">
							<col width="50%">
							<col width="20%">
						</colgroup>
						<c:if test="${ list != null }">
								<tr>
									<th></th>
									<th>나의 챌린지 조회</th>
									<th></th>
								</tr>	
							<c:forEach var="challenge" items="${ list }" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><input type="text" name="add${status.count}" class="challengeSelect${status.count}" style="border:none" value="${ challenge.title }"/></td>
									<td></td>
								</tr>							

								<script type="text/javascript">
									$(document).ready(function () {
									  $(document).on("click", "input[name='add${status.count}']", function () {
									    opener.document.getElementById("challangeSearch").value = document.getElementsByClassName("challengeSelect${status.count}")[0].value;
									        	close();
									  });
									});	
								</script>
							</c:forEach>
						<c:if test="${ empty list }">
							<tr>&emsp;</tr>
		                  		<td colspan="6">&emsp;&emsp;&emsp;&emsp;&emsp;진행 완료된 참가 챌린지가 없습니다.</td>
		               		</tr>
						</c:if>
							<tr>
								<td></td>
								<td></td>
	    						<td><input type="button" value="창닫기" onclick="window.close()"></td>
							</tr>
						</c:if>
					</table>

</body>