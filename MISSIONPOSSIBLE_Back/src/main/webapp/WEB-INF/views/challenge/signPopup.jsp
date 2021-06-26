<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챌린지 인증 팝업창</title>
	</head>	

	<body>
		<h2>챌린지 인증하기</h2>
		<hr>
		<table border=1px solid gray>
			<tr>
				<th colspan="2">챌린지 제목</th>
				<td>(해당 챌린지의 제목 가져오기)</td>
			</tr>
			<tr>
				<th colspan="2">파일첨부</th>
				<td>
					<input type="file" name="upfile">
				</td>
			</tr>
			<tr>
				<th>인증글 작성</th>
			</tr>
		</table>
		<textarea rows="10" cols="40" style="resize:none" 
				  placeholder="챌린지원들에게 남길 인증글을 작성해주세요."></textarea>
		<hr>
		<input type="submit" value="인증하기">
		<input type="reset" value="취소">
		
	</body>
</html>