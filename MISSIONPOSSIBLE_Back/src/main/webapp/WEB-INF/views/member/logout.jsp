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
<title>Insert title here</title>
</head>
<body>
	<form name="logout" action="logout" method="post" ></form>
	<script type="text/javascript">
			if (confirm("정말 로그아웃 하시겠습니까?") == true){  
				logout.action="<%=request.getContextPath() %>/member/logout";
				logout.method="post";
				logout.submit();
			}else{  
				location.replace("${path}/");
			}
	</script>
</body>
</html>
