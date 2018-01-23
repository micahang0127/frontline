<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<%@ page import="com.frontline.newssummary.vo.weatherVO"%>
<%@ page import="com.frontline.newssummary.vo.rollingnewsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <head>
    <script src="js/chat/rollingText.js"> </script>
  <style type="text/css">
		#rollingText .viewArea{height:20px;position:relative;overflow:hidden;}
			#rollingText ul{position:absolute; top:0px;}
			#rollingText .control a.on {color:red;}
</style>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>요약문 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">

	<Style>
	.summaryContent {background-color:gray;}
	</Style>
  </head>

  <body>

    <!-- Navigation -->
	<%@include file="navigation.jsp" %>
  	<!-- ./Navigation -->

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">기사아
        <small>제목</small>
      </h1>
      
		<div class=row>
      <div class="col-lg-8" id="summaryContent">
          	<h3>요약문이다</h3>
          
          	<br/>
          	<p>피카츄</p>
          	<p>라이츄</p>
          	<p>파이리</p>
          	<p>꼬부기</p>
     
        <!-- Map Column -->
        <h3>사용자 요약문</h3>
        <p>피카츄 너로정햇닷!</p>
     
      <!-- /.row -->

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      
          <h3>사용자 요약문 작성칸</h3>
          <form name="sentMessage" id="contactForm" novalidate>
            <div class="control-group form-group">
              <div class="controls">
                <label>Full Name:</label>
                <input type="text" class="form-control" id="userid" required data-validation-required-message="Please enter your name.">
                <p class="help-block"></p>	
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>Message:</label>
                <textarea rows="10" cols="100" class="form-control" id="content" required data-validation-required-message="내용을 입력해주세요" maxlength="999" style="resize:none"></textarea>
              </div>
            </div>
            <div id="success"></div>
            <!-- For success/fail messages -->
            <button type="submit" class="btn btn-primary" id="sendMessageButton">등록하기</button>
            <br/>
          </form>
		</div>
		
		<!-- chatting div -->
		<div class="col-md-4" id="summaryContent">
				
		    <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
    <c:if test="${(login.id ne '') and !(empty login.id)}">
        <input type="hidden" value='${login.id }' id='chat_id' />
    </c:if>
    <c:if test="${(login.id eq '') or (empty login.id)}">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    </c:if>
    <!--     채팅창 -->
    <div id="_chatbox" style="border:2px solid #aaaaaa;border-radius: 15px; display: none">
        <fieldset>
                   <!-- rolling text -->
		<div id="rollingText">
	<div class="viewArea">
		<ul class="notice-list">
			<li><a href="#">1. 규가츠 먹고싶었따.</a></li>
			<li><a href="#">2. 스테이크 덮밥은 맛있따.</a></li>
		</ul>
	</div>
	<div class="control fl">
		<a href="#" class="play">재생</a>
		<a href="#" class="stop">정지</a>
	</div>
  		<span id="bt5">
			<a href="#" class="prev">이전</a>
			<a href="#" class="next">다음</a>
		</span>
</div>
	<script type="text/javascript">fn_article3('rollingText','bt5',true);</script>
		<!-- ./rolling text -->
       
            <div  id="messageWindow" style="height:80%; overflow: scroll;" ></div >
            <div style="text-align:center;">
            
            <br /> <input id="inputMessage" type="text"/>
            <input type="submit" value="send" onclick="send()" />
            <br />
            </div>
        </fieldset>
    </div>
    <img class="chat" src="img/chat.png" />
		</div><!-- /.chatting div -->
      <!-- /.row -->
    </div>
    <!-- /.container -->
	</div>
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Contact form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

  </body>
<script>
    $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "img/chat.png") {
                $(".chat").attr("src", "./img/chathide.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "./img/chathide.png") {
                $(".chat").attr("src", "img/chat.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
</script>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://211.107.78.186:8080/contact');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
    };
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
                }
            }
        }
    }
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    //     엔터키를 통해 send함
    $("#inputMessage").keyup(function(e){ 
        var code = e.which; 
        if(code==13)e.preventDefault();
        if(code==13){
            send();
        } 
    });
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
</script>
</html>
