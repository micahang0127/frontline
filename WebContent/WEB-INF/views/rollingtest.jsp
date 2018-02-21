<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="js/chat/rollingText.js"> </script>
  <style type="text/css">
		#rollingText .viewArea{height:20px;position:relative;overflow:hidden;}
			#rollingText ul{position:absolute; top:0px;}
			#rollingText .control a.on {color:red;}
</style>

 </head>
 <body>
<div id="rollingText">
	<div class="viewArea">
		<ul class="notice-list">
			<li><a href="#">1. 안</a></li>
			<li><a href="#">2. 녕</a></li>
			<li><a href="#">3. 여</a></li>
			<li><a href="#">4. 러</a></li>
			<li><a href="#">5. 분</a></li>
			
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
 </body>
</html>