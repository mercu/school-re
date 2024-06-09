<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

// 학번
String sid = request.getParameter("sid");
// 교과코드
String subcode = request.getParameter("subcode");
// 중간
String midscore = request.getParameter("midscore");
// 기말
String finalscore = request.getParameter("finalscore");
// 출석
String attend = request.getParameter("attend");
// 레포트
String report = request.getParameter("report");
// 기타
String etc = request.getParameter("etc");

// DB 저장
try {
	String sql = "INSERT INTO TBL_SCORE_202210 VALUES (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, sid);
	pstmt.setString(2, subcode);
	pstmt.setString(3, midscore);
	pstmt.setString(4, finalscore);
	pstmt.setString(5, attend);
	pstmt.setString(6, report);
	pstmt.setString(7, etc);
	
	pstmt.execute();
} catch(Exception e) {
	e.printStackTrace();
}

// 입력 창으로 이동
%>
<jsp:forward page="./insert.jsp"></jsp:forward>