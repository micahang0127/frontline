<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function focusIt() {
		document.inform.id.focus();
	}
	
	function checkIt(){
		inputForm=eval("document.inform");
		if(!inputForm.id.value){
			alert("아이디를 입력하세요~");
			inputForm.id.focus();
			return false;
		}
		if(!inputForm.password.value){
			alert("비밀번호를 입력하세요~");
			inputForm.password.focus();
			return false;
		}
	}


</script>
<title>로그인</title>
</head>

<center>
<body onload="focusIt()">
	<form name="inform"  method="post"  action="-------------" onsubmit="return checkIt();">
	<b><font size="5" color="skyblue">로그인</font></b><br/>
	<table border="3"  bordercolor="skyblue">
		<tr>
		<td bgcolor="skyblue"  style="text-align:center" >&nbsp; &nbsp; &nbsp; ID :&nbsp; &nbsp; &nbsp;     <input type="text"  name="id"  width="50'"/></td></tr>
		<tr>
		<td bgcolor="skyblue" >Password : <input type="password"  name="password" width="50'"/></td></tr>
		</table><br/>
		<input type="submit" value="로그인"/>
	<input type="button" value="아이디/비밀번호 찾기"  onclick="location.href="findLogin.jsp"/>
	<input type="button" value="회원가입"  onclick="location.href="join.jsp"/>

</form>
</body>
</center>
</html>