<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터를 화면에 표시 --%>
<%
	//(실습)
	//1. 파라미터 값 추출
	//2. 계산처리
	//3. 계산결과 화면에 출력
	
	//1. 파라미터 값 추출
	//getParameter("")안에는 name 값이 들어간다..? value값을 따로
	//ex08_resp.jsp?coffee=1&su=1&money=0
	String coffee = request.getParameter("coffee");
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));

	//2. 계산처리
	// default값을 입력 해놨기 때문에 null값 안 넘어가지만 checked 없애는 순간 null리턴된다 -주의!-
	String menu = "메뉴 선택 안 함";
	int dan = 0;
	//바깥쪽에 선언 해줘야 다 쓸 수 있다
	
	if ("1".equals(coffee)) { // if ^ () ^ { ---이렇게 띄우고 코딩하는 습관을 들여야 한다.
		menu = "아메리카노";
		dan = 3000;
	} else if ("2".equals(coffee)) {
		menu = "아메리카노";
		dan = 3500;
	} else if ("3".equals(coffee)) {
		menu = "에스프레소";
		dan = 2500;
	} else if ("2".equals(coffee)) {
		menu = "카페라떼";
		dan = 4000;
	}
	System.out.println("menu: " + menu + ", dan: " + dan);
	
	//2. 계산처리(구입금액, 잔액)
	int total = dan * su; //구입총액 = 단가 * 수량
	int change = money - total;
	
			
	
//-----------내가 시도했지만 실패-----------------
// 	String sCoffee = request.getParameter("coffee");
// // 	String slCoffee = str.substring(6,10);
// // 	int coffee = Integer.parseInt(slCoffee);
// // 	System.out.println("coffee: " + coffee);
	
// 	String sSu = request.getParameter("su");
// 	int su = Integer.parseInt(sSu);
// // 	System.out.println("su: " + su);
// 	String sMoney = request.getParameter("money");
// 	int money = Integer.parseInt(sMoney);
// // 	System.out.println("money: " + money);
	
// 	//2. 계산처리
// // 	String total = sMoney + " - " +  sCoffee +"*"+ sSu;
// 	System.out.println("total: " + total);
// 	String menu = " ";
// 	int price = 0;
// 	if (sCoffee.equals("1")) {
// 		menu = "아메리카노";
// 		price = 3000;
// 	} else if ()
	
	
	
	
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과</h2>
<!-- 	커피종류 : 아메리카노 -->
<!-- 	단가 : 3000원 -->
<!-- 	수량 :3 -->
<!-- 	구입금액 : 9000원(단가*수량) -->
<!-- 	----------------- -->
<!-- 	입금액 : 10000원 -->
<!-- 	잔액 : 1000원(입금액 - 구입금액) -->
	<ul>
		<li>커피 종류 : <%=menu %></li>
		<li>단가 : <%=dan %>원</li>
		<li>수량 : <%=su %>잔</li>
		<li>구입 금액 : <%=total %></li>
		<li>------------------</li>
		<li>입금액 : <%=money %></li>
		<li>잔액 : <%=change %></li>
		
<%-- 		<li>잔액 : <% if (change < 0 ) {  --%>
<!-- // 					 out.println("입금액이 부족합니다"); -->
<!-- // 					 } else { -->
<!-- // 					 out.println(change); -->
<%-- 					 }%></li> --%>
		
	</ul>







</body>
</html>