<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function send_go(){
// 		alert("send_go() 시작"); //함수연결 확인 ok
// 		alert(document.frm.name.value);
		//form 태그에 한해서 name=""값 접근 가능
		if(document.frm.name.value.trim() == ""){ //공백인지 확인 방법--1--trim()공백 자르기
			alert("이름을 입력하시오");
			document.frm.name.value = "";
			document.frm.name.focus(); // 커서 포커스 여기로 오게 
			return false;
		}
		let vForm = document.frm; //이렇게 변수 선언 해놓으면 계속 안 찾아도 된다
		if(vForm.id.value.trim().length < 1){// 공백 확인 방법--2-- length < 1
			alert("아이디를 입력하세요");
			vForm.id.value="";
			vForm.id.focus();
			return false;
		}
		if(vForm.pwd.value.trim().length < 1){ //암호확인값 입력여부 확인
			alert("암호를 입력하세요");
			vForm.pwd.value="";
			vForm.pwd.focus();
			return false;
		}
		if(vForm.pwd2.value.trim().length < 1){ //암호확인값 입력여부 확인
			alert("아이디를 입력하세요");
			vForm.pwd2.value="";
			vForm.pwd2.focus();
			return false;
		}
		//암호 일치여부 확인
		if(vForm.pwd.value != vForm.pwd2.value){
			alert("암호가 일치하지 않습니다.\n 확인 후 다시 입력하세요]");
			vForm.pwd.value = "";
			vForm.pwd2.value = ""; //입력한 암호값 지워주고 
			vForm.pwd.focus();		//마우스 커서 pwd로 옮겨놔준다
			return false;
		}
		
		alert(">>>>회원가입 요청합니다.");
		vForm.action = "ex07_resp.jsp"; //이 부분이 response해주는 영역이라 파일이름 정확히!!
		vForm.submit(); 
		
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
<!-- 	<form action="signup"> -->
	<form name="frm">
	form 태그에는 action으로도 가능하고 name으로도 접근 가능
		<fieldset>
		<!-- fieldset은 해도되고 안 해도됨		 -->
		<legend>회원가입</legend>
		<p>이름 : <input type="text" name="name" value="김"></p>
		<p>아이디 : <input type="text" name="id" value="sol"></p>
		<p>암호 : <input type="password" name="pwd" value="111"></p>
		<p>암호확인 : <input type="password" name="pwd2" value="111"></p>
		<p>이메일 : <input type="text" name="email" value="sol@naver.com"></p>
		<p>취미 : 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		<input type="submit" value="회원가입" onclick="send_go()"> <!-- 인라인 방식으로 온클릭 = 함수 추가해줌 -->
		<input type="reset" value="초기화">
		
		</fieldset>
	</form>
</body>
</html>