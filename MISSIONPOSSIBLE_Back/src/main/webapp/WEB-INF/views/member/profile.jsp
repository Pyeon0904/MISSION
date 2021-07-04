<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />


<title>프로필 등록</title>
<style> 
	div{ 
		position:relative; 	
		height: 220px;
		margin-top: 75px;
		margin-left: 90px;
		margin-right: 60px;
	} 
</style> 
<script type="text/javascript">
	function setProfile() {
		// 입력 된 프로필사진을 부모창에 대입
		const profile = "<%= request.getParameter("profile") %>";

		opener.memberEnrollFrm.profile.src = profile;
		
		// 팝업창 닫아주기
		close();			
	}
	
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result); 
			document.querySelector("#image_container").appendChild(img);
		};
			reader.readAsDataURL(event.target.files[0]); 
	}


</script>
<body>
<div>
	<form action="profile" method="POST">
		<table>
			<tr>
			    <th>첨부파일</th>
				<td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/></td>
			</tr>
			<tr>
				<td>
					<img src="" id="image_container" style="width: 250px; height: 200px;"/>
				</td>
			</tr>
		</table>
		<br>
		<button type="submit" style="width: 250px; height: 30px;" onClick='setProfile();'>등록하기</button>
	</form>
</div>
</body>
</html>