<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

// String sql = "SELECT 1 FROM DUAL";
String sql = "SELECT * FROM TBL_SCORE_202210";
ResultSet rs = con.prepareStatement(sql).executeQuery();
while(rs.next()) {
	%>
	<%=rs.getString(1) %>
	<%
}


%>
</body>
</html>