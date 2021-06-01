<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 처리 (EL)</title>
</head>
<body>
	<h1>데이터 처리 (EL)</h1>
	<form action="el03_result01_bean.jsp">
		<fieldset>
		<!-- fieldset은 해도되고 안 해도됨 -->
		<legend>회원가입</legend>
			<p>이름 : <input type="text" name="name" value="김민솔"></p>
			<p>아이디 : <input type="text" name="id" value="sol"></p>
			<p>암호 : <input type="password" name="pwd" value="1111"></p>
			<p>암호확인 : <input type="password" name="pwd2" value="1111"></p>
			<p>이메일 : <input type="email" name="email" value="222@222"></p>
			<p>성별 : 
				<input type="radio" name="gender" value="F" checked>여
				<input type="radio" name="gender" value="M">남
			</p>
			<p>취미 : 
				<input type="checkbox" name="hobby" value="sports">운동
				<input type="checkbox" name="hobby" value="game">게임
				<input type="checkbox" name="hobby" value="movie" checked>영화
				<input type="checkbox" name="hobby" value="reading" checked>독서
			</p>
			<input type="button" value="전달1(자바빈)"
				onclick="send_go1(this.form)">
			<input type="button" value="전달2(EL param)"
				onclick="send_go2(this.form)">
			<input type="reset" value="초기화">
		</fieldset>
	</form>
<script>
		function send_go1(frm) {
			frm.action = "el03_result01_bean.jsp";
			frm.submit(); //함수 호출
		}
		function send_go2(frm) {
			frm.action = "el03_result02_param.jsp";
			frm.submit(); //함수 호출
		}
</script>
</body>
</html>








