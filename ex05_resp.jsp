<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 전달받은 데이터를 사용해서 계산처리 후 결과를 테이블 형태로 작성 -->
<%
	//1. 전달받은 파라미터 값 출력
		String name = request.getParameter("name");
		String sKor = request.getParameter("kor");
		int kor = Integer.parseInt(sKor);
		//String -> int 바꾸는 거 -- Integer.parseInt();
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
	//2. 계산처리
		int tot = kor + eng + math;
		double avg = Math.round((tot * 100/3.0)/100.0);
		System.out.println("tot : " + tot +" avg : " + avg);
		
	//3. 화면출력
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 응답(결과)</title>
<style>
	table {
		border-collapse : collapse;
		border : 1px solid black;
		background-color : powderblue;
	}
</style>
</head>
<body>
	<h3>성적처리 결과</h3>
	<table border>
		<thead>
			<tr>
				<th colspan="2">성적처리 결과</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이름</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>국어</td>
				<td><%=kor %></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><%=eng %></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><%=math %></td>
			</tr>
			<tr>
				<td>총점</td>
				<td><%=tot %></td>
			</tr>
			<tr>
				<td>평균</td>
				<td><%=avg %></td>
			</tr>
			
			
		</tbody>
	</table>
	
</body>
</html>