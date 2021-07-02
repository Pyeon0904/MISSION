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
</style>
<body>
        <section>
            <h2> 신고하기</h2>
        <form id="report" action="" method="POST">
            <table>
            	<tr>
                    <td></td>
                    <td> <!-- 현재 페이지 세션에 담긴 게시글 제목 -->
                        <input type="text" name="title" id="title" value="${ review.title }"readonly>
                        <input type="hidden" name="R_No" id="R_No" value="${ review.no }"readonly>
                        <input type="hidden" name="reportedId" id="reportedId" value="${ review.writerId }"readonly>
                        <input type="hidden" name="sendId" id="sendId" value="${ loginMember.getId() }"readonly>
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td>           
                    <select name="category" class="form-control">
                  		<option value="">신고 유형 선택</option>
                  		<option value="욕설/비방">욕설/비방</option>
                  		<option value="광고">도배</option>
	                  	<option value="광고">광고</option>
	                  	<option value="음란물">음란물</option>
	                  	<option value="개인정보 침해">개인정보 침해</option>
	                  	<option value="기타">기타</option>
	              	 </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <textarea cols="50" row="100" name="content" placeholder="신고 내용을 입력하세요." id="reportContent" class="reportList"></textarea><br><br>    
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
        <script>
        </script>
</body>
</html>