<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/ 비밀번호 찾기</title>
</head>
<script language="javascript">
	function findID() {
		if ('' == document.find.useremail.value) {
			alert('이메일 입력하세요.');
			document.find.useremail.focus();
			return;
		}
		document.find.action = 'findLogin_check';
		document.find.method = 'post';
		document.find.submit();
		//location.href = "findLogin_check"	
	}
	function findPW(){
		if('' == document.find.userId.value){
			alert('아이디를 입력하세요');
			document.find.userId.focus();
			return;
		} else if('' == document.find.useremail2.value){
			alert('이메일을 입력하세요');
			document.find.useremail2.focus();
			return;
		}
		document.find.action = 'findLogin_check';
		document.find.method = 'post';
		document.find.submit();
		//location.href = "findLogin_check"		
	}
/* 	function myClose() {
		self.close();
	} */
</script>
<link href="css/find_Id.css" rel="stylesheet" type="text/css" />
<body bgcolor="#EAEAEA">
	<div align="center">
		<form name="find">
		<br/> <br/>
		<table>
			<tr>
				<td>
					 <h6>아이디와 비밀번호를 잊어버리셨나요?</h6>
				</td>
			</tr>
		</table>

		<table width="600" border="1" align="center">
			<tr>
				<td><h3>아이디 찾기</h3></td>
				<td><h3>비밀번호 찾기</h3></td>
			</tr>
			<tr height="80">
				<td width="100" bgcolor="#E6FFFF" align="center">email : <input type="text" name="useremail" width="70" height="0" size="100"></td>
				<td width="100" bgcolor="#E6FFFF" align="center">  ID  : <input type="text" name="userId" width="70" height="0" size="100"><br/>
																 email : <input type="text" name="useremail2" width="70" height="0" size="100"></td>
			</tr>
		</table>
		<table>
			<tr height="80">
				<td colspan="2" align="middle" bgcolor="#E6FFFF"><input type="submit" value="아이디 찾기" onclick="findID()"></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<td colspan="2" align="middle" bgcolor="#E6FFFF"><input type="submit" value="비밀번호 찾기" onclick="findPW()">&nbsp;
																<input type="button" value="메인으로" 	onclick="javascript:window.location = 'index'"></td>
			</tr>
		</table>
		</form>
		</div>
</body>
</html>