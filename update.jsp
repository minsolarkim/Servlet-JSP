<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 VO 데이터를 화면에 표시하고 수정데이터 작성 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<style>
	#container {
		width: 512px; margin: auto;
		border: 1px solid gray;
	}
	
	#container h2 { text-align: center;}
	#container p { text-align: center;}
	#container table {
		width: 500px;
		padding : 0 5px;
		border : 1px solid pink;
		border-collapse : collapse;
		text-align : center;
	}
	
	#container table th, td { border : 1px solid pink; }
	
	#container table th {
		background-color : lightgray;
	}
	
	#container table tr { border-top : 1px solid pink; }
	
	#container .center { text-align : center; }
	
	#container table th:nth-child(3), td:nth-child(3) { width: 200px; }
</style>
<script>
	function save_go(frm) {
		//비밀번호 확인 후 DB 수정 요청 처리
		let pwd1 = frm.pwd.value;
// 		let pwd2 = "aaaa"; 이렇게 찍힌다는 거임 aaaa; 이게 아니라 (문자열 형태)
		let pwd2 = "${guestbookVO.pwd }"; //그래서 ""안에 해줘야함
		//원래는 이렇게 쓰면 안 됨 소스코드가 다 노출이 되기 때문에 -- back에서 처리를 해줘야함
		
		if(pwd1 != pwd2) {
			alert("[암호 불일치] 암호를 확인하세요");
			frm.pwd.value="";
			frm.pwd.focus(); //포커스틑 여기에
			return false; //서버쪽으로 전송하지 않는다.
		}
		//DB 수정 작업 요청
		frm.action = "update_ok.jsp";
		frm.submit();
		
	}
</script>
</head>
<body>
	<div id="container">
		<h2>방명록 : 수정화면</h2>
		<hr>
		<p><a href="list.jsp">[목록으로 이동]</a></p>
		
<!-- 	<form action="update_ok.jsp" method="post"> -->
<!-- 	무조건 가는 게 아니라 암호 체크하고 가야되기 때문에 별도로 JS 걸쳐서 처리해야한다 form에 action 지우기 -->
		<form method="post">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="${guestbookVO.name }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="${guestbookVO.subject }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${guestbookVO.email }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="pwd"></td>
<!-- 				type="password" 써도 되는데 지금은 보이게 하려고 그냥 text처리 -->
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="5" cols="60" >${guestbookVO.content }</textarea>
<!-- 												내용은 value가 아니라 그냥 값 -->
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수 정" onclick="save_go(this.form)">
						<input type="reset" value="다시작성">
						<input type="hidden" name="idx" value="${guestbookVO.idx }">
<!-- 						화면에는 안 보여주고 파라미터값을 보내주고 싶을 때 hidden 사용 -->
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		
	</div>
</body>
</html>