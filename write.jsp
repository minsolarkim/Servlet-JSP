<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/guestbook.css"> -->

<title>입력화면</title>
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
</head>
<body>
	<div id="container">
		<h2>방명록 : 입력화면</h2>
		<hr>
		<p><a href="list.jsp">[목록으로 이동]</a></p>
		
		<form action="write_ok.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="홍길동"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="제목-test"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="hong@test.com"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="pwd" value="1111"></td>
<!-- 				type="password" 써도 되는데 지금은 보이게 하려고 그냥 text처리 -->
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="5" cols="60"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="저 장">
						<input type="reset" value="취소">
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		
	</div>
</body>
</html>