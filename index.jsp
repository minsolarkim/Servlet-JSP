<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_search(frm) {
// 		frm.action = "list.jsp"; //예전 방식 JSP 직접 호출
// 		frm.action = "list"; //list 작업 요청 ---이 방법 말고
		frm.action = "controller?type=all";
		frm.submit();
	}
	function fullname_search(frm) {
// 		frm.action = "fullname"; ---여기도 이거 말고
		frm.action = "controller?type=fullname";
		frm.submit();
	}
	
</script>
</head>
<body>
	<h1>작업선택</h1>
		<form method="post">
<!-- 		이래야 post로 매개변수 값 받아준다? -->
<!-- 	<form action = "controller?type=fullname"> **얘랑 --> 
<!-- 	form 에 아무것도 없으면 get방식? 그럼 파라미터값 없이 뭉개고 들어온다..?(이 부분 잘 모르겠다  -->
		<input type="button" value="전체보기" onclick="all_search(this.form)">
		<input type="button" value="성명검색(성,이름포함)" onclick="fullname_search(this.form)">
<!-- 		<input type="text" name="type"> **얘랑 셋트?-->
		<input type="button" value="부서코드로 검색" onclick="dept_search(this.form)">
	</form>
<script>
	function dept_search(frm) {
		frm.action = "controller?type=dept";
		frm.submit();
	}
</script>
</body>
</html>