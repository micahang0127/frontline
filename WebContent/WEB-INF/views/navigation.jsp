<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FrontLine - News Squeeze</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    
    <!-- login css -->
    <link href="css/common.css" rel="stylesheet" />
	<link href="css/layout.css" rel="stylesheet"/>
	
	<!-- ModalWindow script -->
  	<script src="js/jquery.leanModal.min.js"></script>
    
</head>
<body>
	<%
		boolean isLogin = false;
    	String memId = null;
    		
    	String LoginId = (String)session.getAttribute("LoginId");
    	if(LoginId != null) {
    		isLogin = true;
    	
    		
    	}
     
    	%>
 


	<!-- login window part (hidden)-->
	<div id="loginmodal" style="display:none;">
	<h2>LOGIN</h2>
	<div class="p_c_text">회원이 되시면,<br/> 여러가시 혜택을 누리실 수 있습니다.</div>
	<div class="login_line">
	<form name="inform"  method="post" action="loginForm">
		<div class="box_in">
		<input type="text" name="id" id="id" size="23" placeholder="아이디">
		<input type="password" name="pw" id="pw" size="23" placeholder="비밀번호">
		</div>
		<input type="submit" value="로그인" class = "btn_login"/>
		</form>
	</div>
	<div class="find_join"><a href="findLogin">아이디/ 비밀번호 찾기</a> | <a href="register">회원가입</a></div>
</div>

	<!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.html">News Squeeze</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index">메인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="politics?pageNo=1">정치</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Economy?pageNo=1">경제</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="society?pageNo=1">사회</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="culture?pageNo=1">생활/문화</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="world?pageNo=1">세계</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="science?pageNo=1">it/과학</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" >　　　　　　　　　　</a>
            </li>
 			<li class="nav-item">
              <%=isLogin? "<a class=\"nav-link\" href=\"logout\" id=\"logout\">"+LoginId+"님 로그아웃</a>"  : "<a class=\"nav-link\" href=\"#loginmodal\" id=\"modaltrigger\" >로그인</a>"%>
            </li>

          </ul>
        </div>
      </div>
    </nav>
    	<!-- ./Navigation -->
    	
    	<!-- login windows script -->
    <script type="text/javascript">
		$(function(){
  			$('#modaltrigger').submit(function(e){
    			return true;
  			});
  
  			$('#modaltrigger').leanModal({ 
  				top: 110, overlay: 0.8, closeButton: ".hidemodal" });
		});
		

		
		
		
		
</script>
    	
</body>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>