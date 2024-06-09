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
  <h2 style="text-align:center;">학생정보현황</h2>
  <table border="1" style="margin-left:auto; margin-right:auto; text-align:center;">
  <thead>
  	<tr>
  		<th>학번</th>
  		<th>이름</th>
  		<th>주민번호</th>
  		<th>학과명</th>
  		<th>성별</th>
  		<th>전화번호</th>
  		<th>이메일</th>
  	</tr>
  </thead>
  <tbody>
<%
try {
	String sql = "SELECT stuid, sname, jumin, dept_name, phone, email FROM TBL_STUDENT_202210";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		// 주민번호는 "000000-0000000" 형식으로 출력한다.
		String jumin = rs.getString(3);
		String juminFormat = jumin.substring(0, 6) + "-" + jumin.substring(6,13);
		
		// 성별은 3이면 남자, 4이면 여자로 출력한다.
		String genderCode = jumin.substring(6, 7);
		String gender = "3".equals(genderCode) ? "남자" : "여자";
		%>
	<tr>
		<td><%=rs.getString(1) %></td>
  		<td><%=rs.getString(2) %></td>
  		<td><%=juminFormat %></td>
  		<td><%=rs.getString(4) %></td>
  		<td><%=gender %></td>
  		<td><%=rs.getString(5) %></td>
  		<td><%=rs.getString(6) %></td>
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