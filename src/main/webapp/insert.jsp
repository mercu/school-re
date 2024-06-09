<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./insert_script.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray;">
  <h2 style="text-align:center;">성적입력</h2>
  
  <form name="insertForm" action="insert_action.jsp" method="post" style="display:flex; align-items:center; justify-content:center; text-align:center;">
  <table border="1">
  	<tr>
  		<td>학번</td><td><input name="sid" type="text"></td>
  	</tr>
  	<tr>
  		<td>교과코드</td>
  		<td>
  			<select name="subcode">
  				<option value="A001"> A001-자바 </option>
  				<option value="A002"> A002-C언어 </option>
  				<option value="A003"> A003-데이터베이스 </option>
  				<option value="A004"> A004-웹프로그래밍 </option>
  				<option value="A005"> A005-영어 </option>
  			</select>
  		</td>
  	</tr>
  	<tr>
  		<td>중간</td><td><input name="midscore" type="number"></td>
  	</tr>
  	<tr>
  		<td>기말</td><td><input name="finalscore" type="number"></td>
  	</tr>
  	<tr>
  		<td>출석</td><td><input name="attend" type="number"></td>
  	</tr>
  	<tr>
  		<td>레포트</td><td><input name="report" type="number"></td>
  	</tr>
  	<tr>
  		<td>기타</td><td><input name="etc" type="number"></td>
  	</tr>
  	<tr>
  		<td colspan="2">
  			<input type="button" value="등록" onclick="insert()"/>
  			<input type="button" value="다시쓰기" onclick="reset_form()"/>
  		</td>
  	</tr>
  </table>
  </form>

</section>

<jsp:include page="footer.jsp"/>
</body>
</html>