<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray;">
  <h2 style="text-align:center;">성적현황</h2>
  <table border="1" style="margin-left:auto; margin-right:auto; text-align:center;">
  <thead>
  	<tr>
  		<th>학번</th>
  		<th>성명</th>
  		<th>교과목</th>
  		<th>교과목코드</th>
  		<th>담당교수</th>
  		<th>중간</th>
  		<th>기말</th>
  		<th>출석</th>
  		<th>레포트</th>
  		<th>기타</th>
  		<th>평균</th>
  		<th>총점</th>
  		<th>학점</th>
  	</tr>
  </thead>
  <tbody>
<%
try {
	String sql = "SELECT st.stuid, st.sname, su.subname, sc.subcode, su.proname, "
			+ "sc.midscore, sc.finalscore, sc.attend, sc.report, sc.etc "
			+ "FROM TBL_STUDENT_202210 st, TBL_SCORE_202210 sc, TBL_SUBJECT_202210 su "
			+ "WHERE st.stuid = sc.sid AND sc.subcode = su.subcode "
			+ "ORDER BY st.sname";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		int midscore = rs.getInt("midscore");
		int finalscore = rs.getInt("finalscore");
		int attend = rs.getInt("attend");
		int report = rs.getInt("report");
		int etc = rs.getInt("etc");
		// 평균 구하기
		int average = (midscore + finalscore + attend + report + etc) / 5;
		// 총점 구하기 (=중간30%, 기말30%, 출석20%, 레포트10%, 기타10%)
		float total = (0.3f * midscore) + (0.3f * finalscore) + (0.2f * attend) + (0.1f * report) + (0.1f * etc);
		// 학점 구하기(~95=A+, ~90=A, ~85=B+, ~80=B, ~75=C+, ~70=C, ~65=D+, ~60=D, ~0=F)
		String grade;
		if (total >= 95f) grade = "A+";
		else if (total >= 90f) grade = "A";
		else if (total >= 85f) grade = "B+";
		else if (total >= 80f) grade = "B";
		else if (total >= 75f) grade = "C+";
		else if (total >= 70f) grade = "C";
		else if (total >= 65f) grade = "D+";
		else if (total >= 60f) grade = "D";
		else grade = "F";
%>
	<tr>
  		<td><%=rs.getString("stuid") %></td>
  		<td><%=rs.getString("sname") %></td>
  		<td><%=rs.getString("subname") %></td>
  		<td><%=rs.getString("subcode") %></td>
  		<td><%=rs.getString("proname") %></td>
  		<td><%=rs.getInt("midscore") %></td>
  		<td><%=rs.getInt("finalscore") %></td>
  		<td><%=rs.getInt("attend") %></td>
  		<td><%=rs.getInt("report") %></td>
  		<td><%=rs.getInt("etc") %></td>
  		<td><%=average %></td>
  		<td><%=String.format("%.1f", total) %></td>
  		<td><%=grade %></td>
	</tr>		
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
  </tbody>
  </table>

</section>

<jsp:include page="footer.jsp"/>
</body>
</html>