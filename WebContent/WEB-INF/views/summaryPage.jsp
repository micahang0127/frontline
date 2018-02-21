<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<%@ page import="com.frontline.newssummary.vo.RollingNewsVO"%>
<%@ page import="com.frontline.newssummary.vo.SummaryVO"%>
<%@ page import="com.frontline.newssummary.vo.SummaryListVO"%>
<%@ page import="com.frontline.newssummary.vo.MemberVO" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <head>
  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- rollingText script -->
  <script src="js/chat/rollingText.js"> </script>
 

  

  
  <style type="text/css">
		#rollingText .viewArea{height:18px;position:relative;overflow:hidden;}
			#rollingText ul{position:absolute; top:0px;}
			#rollingText .control a.on {color:red;}
</style>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/board/Reply.js"></script>
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
	
	  <script>
$(function(){
	 $("#_chatbox").css("display", "block");
});
</script>
	
	
  </head>

  <body>
  
      <!-- Navigation -->
<%@include file="navigation.jsp" %>
  	<!-- ./Navigation -->
  	<header><br/><br/></header>
  
  
    <!-- Page Content -->
    <div class="container">
        <%
        SummaryListVO selectedSummary = (SummaryListVO) request.getAttribute("selectedSummary");
        List<SummaryVO> summaryCollect = (List<SummaryVO>) request.getAttribute("summaryCollect");
		%>
      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3"><%=selectedSummary.getTitle() %></h1>
      
		<div class=row>
      <div class="col-lg-8" id="summaryContent">
      		<img src="<%=selectedSummary.getImg() %>">
          	<h3><%=selectedSummary.getContent() %></h3>
          
        <!-- Map Column -->
        <h3>사용자 요약문</h3>
        
        <table border="1" width="1200px" id="reply_area">
   			
   			
 						<%
 						
		for(int i = 0; (summaryCollect != null) && i <summaryCollect.size() ;  i++){
			SummaryVO reply = (SummaryVO) summaryCollect.get(i);
		%>
			<li><%=reply.getUserid()%><%=reply.getContent() %></li>
			<input type="text" class="summaryId" value="<%=reply.getId() %>">
			<input type="hidden" name="userid" value="<%=reply.getUserid()%>"/>
			<input type="hidden" name="id" value="<%=reply.getId() %>"/>
			<img src="img/Like.png" onclick="LikeCheckFunction()" style="width:30px;"><%=reply.getLikes()%>
			<img src="img/Hate.png" onclick="HateCheckFunction()" style="width:30px;"><%=reply.getHate()%>
			<% } %>
 				
 				
 				
   			</table>
    		</br>
     
      <!-- /.row -->

      
          <h3>사용자 요약문 작성칸</h3>
          
          <!-- sentReply test -->
          
    	<input type="text" id="oid" name="oid" value="<%= selectedSummary.getOid() %>" />
    	<input type="text" id="aid" name="aid" value="<%= selectedSummary.getAid() %>" />
    	<input type="text" name="id" id="userId" value="${LoginId}"/>
		
    	<div align="center">
    	
    		</br>
    		</br>


   			<table border="1" width="1200px" bordercolor="#46AA46">
   				<tr>
   					<td width="500px">
						이름: <input type="text" id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10" value="${LoginId}"/>
						패스워드: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder="패스워드"/>
						<button class="btn btn-primary" id="reply_save" name="reply_save">요약 저장</button>
					</td>
   				</tr>
   				<tr>
   					<td>
   						<textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="요약문을 입력하세요."></textarea>
   					</td>
   				</tr>
   			</table>
   			<table width="1200px">
   				<tr>
   					<td align="right">
   						<button class="btn btn-primary" id="list" name="list" onclick='history.go(-1)'>뒤로가기</button>
   					</td>
   				</tr>
   			</table>
    	</div>
    	
    	<!--  ./sendReplyTest end -->
          
          
          
          
<!--           <form name="sentMessage" id="contactForm" novalidate>
            <div class="control-group form-group">
              <div class="controls">
                <label>Full Name:</label>
                <input type="text" class="form-control" id="userid" value="멤버VO가져와야겠다.">
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
            For success/fail messages
            <button type="submit" class="btn btn-primary" id="sendMessageButton">등록하기</button>
            <br/>
          </form> -->
          
		</div>
		<!-- chatting and rollingTest div -->
		<div class="col-md-4" id="chattingContent">
				
		    <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
    <c:if test="${(login.id ne '') and !(empty login.id)}">
        <input type="hidden" value='${login.id }' id='chat_id' />
    </c:if>
    <c:if test="${(login.id eq '') or (empty login.id)}">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    </c:if>
        <!-- rolling text -->
		<div id="rollingText">
	<div class="viewArea">
		<ul class="notice-list">
		<%
	List<RollingNewsVO> Rnewslist = (List<RollingNewsVO>) request.getAttribute("rollingNewsList");
		for(int i = 0; (Rnewslist != null) && i < 12; i++){
			String active = "active";
			RollingNewsVO rnvo = (RollingNewsVO) Rnewslist.get(i);
		%>
			<li><a href="<%=rnvo.getUrl()%>"><%=rnvo.getTitle()%></a></li>
			<% } %>
		</ul>
	</div>
	<div class="control fl">
		<a href="#" class="play">재생</a>
		<a href="#" class="stop">정지</a>
	
  		<span id="bt5">
			<a href="#" class="prev">이전</a>
			<a href="#" class="next">다음</a>
		</span>
</div></div>
	<script type="text/javascript">fn_article3('rollingText','bt5',true);</script>
		<!-- ./rolling text -->
    
    <!--     채팅창 -->
    <div id="_chatbox" style="border:2px solid #aaaaaa;border-radius: 15px; display: none">
        <fieldset>
            <div  id="messageWindow" style="height:70%; overflow: scroll;" ></div >
            <div style="text-align:center;">
            <input id="inputMessage" type="text"/>
            <input type="submit" value="send" onclick="send()" />
            </div>
        </fieldset>
    </div>
    
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
    <!-- <script src="vendor/jquery/jquery.min.js"></script> -->
     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Contact form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <script src = "js/chat/chatpagescript.js"></script>
  </body>


<script type="text/javascript">
	function LikeCheckFunction() {
		alert('버튼눌림');
	    var userid = $('#userId').val();//*****값수정
	    var id = $('.summaryId').val(); //****값수정
	    var imgid = $(event.target);
	    alert('이미지아이디 '+imgid);
	    alert('유저아이디 : '+ userid+', 아이디 : '+id);
	        $.ajax({
	            type : 'POST',
	            url : 'clickLike', 
	            data : {
	                userid : userid, //*****유저아이디랑, 요약 아이디 읽어서 보내줌. 그걸로 쿼리문 돌릴꺼.
	                id : id
	            },
	            success : function(result) {
	                if (result == 1) {
	                    //그냥 +1 처리.
	                	alert('그냥+1처리');
	                	history.go(0);
	                } else {
	                    alert('이미 좋아요 눌렀어요!');
	                }
	            }
	        })
	    }
	function HateCheckFunction() {
		alert('버튼눌림');
	    var userid = $('#userId').val();//*****값수정
	    var id = $('.summaryId').val(); //****값수정
	    var imgid = $('#HateChecker').val();
	    alert('이미지아이디 '+imgid);
	    alert('유저아이디 : '+ userid+', 아이디 : '+id);
	        $.ajax({
	            type : 'POST',
	            url : 'clickHate', 
	            data : {
	                userid : userid, //*****유저아이디랑, 요약 아이디 읽어서 보내줌. 그걸로 쿼리문 돌릴꺼.
	                id : id
	            },
	            success : function(result) {
	                if (result == 1) {
	                    //그냥 +1 처리.
	                	alert('그냥+1처리');
	                	history.go(0);
	                } else {
	                    alert('이미 좋아요 눌렀어요!');
	                }
	            }
	        })
	    }
</script>

</html>