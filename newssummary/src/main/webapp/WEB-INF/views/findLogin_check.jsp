<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.frontline.newssummary.Service.SearchService"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/find_Id.css" rel="stylesheet" type="text/css" />
<%
	// 아이디 확인
	request.setCharacterEncoding("UTF-8");
	String useremail = request.getParameter("useremail"); // findLogin.jsp의  #useremail
	SearchService searchService = SearchService.getInstance();
	String userId_receive = searchService.searchId(useremail);	// 진짜id , jsp email
	
	// 비밀번호 확인
	String userId = request.getParameter("userId");	// findLogin.jsp의 #userId
	String useremail2 = request.getParameter("useremail2");
	String userPw_receive = searchService.searchPw(userId, useremail2);	// 진짜pw,  jsp id,email
%>

<body>
	<form method="post" action="index.do">
		<table width="1330px" border="0" height="430px" align="center">
			<tr>
				<td>
					<table width="450px" align="center" border="0"
						style="color: black; background-color: #F6F6F6; font-size: 20px;">
						<tr>
							<td>
								<table width="750px" align="center" border=0;
									style="background-color: white; margin-top: 3%">
									<%
										if (userId_receive != "이메일이 틀려") {
									%>
									<tr>
										<td>당신의 아이디는</td>
									</tr>
									<tr>
										<td><h1><%=userId_receive%></h1>입니다.</td>
									</tr>
									<table align="center">
										<tr>
											<td><input type="button" value="비밀번호 찾기"  onclick="location.href='findLogin'"/></td>
										</tr>									
									</table>
									<%
										}else if ( userPw_receive != "비밀번호가 틀려") {
									%>
									<tr>
										<td>당신의 비밀번호는</td>
									</tr>
									<tr>
										<td><h1><%=userPw_receive%></h1>입니다.</td>
									</tr>
									
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table>
									 <% }else if (userId_receive == "이메일이 틀려" || userPw_receive == "비밀번호가 틀려" ) {   %>
									<tr>
										<td>당신의 가입정보가 없습니다.</td>
									</tr>
									<tr>
										<td><h1>회원가입을 해 주세요.</h1></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="150px" align="center" border="0"
						style="margin-top: 1%">
						<tr>
							<td><input type="button" value="회원가입하기"
								class="btn btn-primary" onclick="location.href='register'"></td>
							<td><input type="button" value="처음으로" class="btn btn-primary" onclick="location.href='index'"></td>
						</tr>
					</table>
							 <%
 									}
							 %>
				</td>
			</tr>
			<tr>
				<td>
					<table width="150px" align="center" border="0" style="margin-top: 1%">
						<tr>
							<td><input type="submit" name="search" value="메인 Page" class="btn btn-primary"></td>
						</tr>
					</table> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


