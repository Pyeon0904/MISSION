<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 신고하기 </title>
</head>
<style>
#report{ width : 500px; }
 .reportList{ width : 400px; }
section{ 
		position:relative; 	
		height: auto;
		margin-top: auto;
		margin-left: 50px;
		margin-right: 60px;
		font-size: 25px;
	} 
</style>
<body>
        <section>
            <h2> 신고하기</h2>
        <form id="report" action="reportMember" method="POST">
            <table>
            	<tr>
                    <td></td>
                    <td> <!-- 현재 페이지 세션에 담긴 게시글 제목 -->
                        <input type="text" name="reportId" id="reportId" class="reportList" value="${ followMember.id }" readonly style="height: 30px"/>
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td>           
                    <select name="reportType" class="form-control" style="height: 30px">
                  		<option value="">신고 유형 선택</option>
                  		<option value="욕설/비방">욕설/비방</option>
	                  <option value="광고">광고</option>
	                  <option value="음란">음란</option>
	              	 </select>
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td>
                        <textarea cols="50" row="100" name="reportContent" placeholder="신고 내용을 입력하세요." id="reportContent" class="reportList" style="height: 100px"></textarea><br><br>    
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="submit" value="신고하기">
                        <input type="reset" value="초기화">
                    </td>
                </tr>
            </table>
        </form>  
        </section>
</body>
</html>