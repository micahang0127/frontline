<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.frontline.newssummary.vo.MainSummaryListVO"%> 
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>frontline_newssummary</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    
    <!-- login css -->
    <link href="css/common.css" rel="stylesheet" />
	<link href="css/layout.css" rel="stylesheet"/>
    
    <!-- wordCloud script -->
  	<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.4/d3.layout.cloud.js"></script>
  	
    <!-- ModalWindow script -->
  	<script src="js/jquery.leanModal.min.js"></script>

  </head>
  <body>
	<!-- login window part (hidden)-->
	<div id="loginmodal" style="display:none;">
	<h2>LOGIN</h2>
	<div class="p_c_text">회원이 되시면 여러가시 혜택을 누리실 수 있습니다.</div>
	<div class="login_line">
	<form name="inform"  method="post" action="loginForm.do">
		<div class="box_in">
		<input type="text" name="id" id="id" size="23" placeholder="아이디">
		<input type="password" name="pw" id="pw" size="23" placeholder="비밀번호">
		</div>
		<input type="submit" value="로그인" class = "btn_login"/>
		</form>
	</div>
	<div class="find_join"><a href="findLogin">아이디 / 비밀번호 찾기</a> | <a href="register">회원가입</a></div>
</div>


    <!-- Navigation -->
	<%@include file="navigation.jsp" %>
  	<!-- ./Navigation -->
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
        <%
	List<MainSummaryListVO> list = (List<MainSummaryListVO>) request.getAttribute("list");
		for(int i = 0; (list != null) && i < 4; i++){
			String active = "active";
			MainSummaryListVO msvo = (MainSummaryListVO) list.get(i);
		%>
          <div class="carousel-item <%if(i==0){ %><%=active%><%} %>" style="background-image: url('img/IMG_2198.gif')">
            <div class="carousel-caption d-none d-md-block">
              <h3 style="stroke: black;"><%= msvo.getTitle() %></h3>
            </div>
          </div>
          	<%
				}
			%>   
          <!-- Slide end-->
          </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">

      <!-- Portfolio Section -->
      <b></b>
      <h2>주요 뉴스</h2>
      <div class="row">
<%
		for(int i = 4; (list != null) && i < 10; i++){
			MainSummaryListVO msvo = (MainSummaryListVO) list.get(i);
%>

      
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="img/uu2.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#"><%= msvo.getTitle() %></a>
              </h4>
              <p class="card-text"><%= msvo.getRank() %> <%= msvo.getPopularOid() %></p>
            </div>
          </div>
        </div>
			<%
				}
			%>       
      <!-- /.row -->

      <!-- Features Section -->
<!--       <div class="row">
        <div class="col-lg-6">
          <h2>Modern Business Features</h2>
          <p>The Modern Business template by Start Bootstrap includes:</p>
          <ul>
            <li>
              <strong>Bootstrap v4</strong>
            </li>
            <li>jQuery</li>
            <li>Font Awesome</li>
            <li>Working contact form with validation</li>
            <li>Unstyled page elements for easy customization</li>
          </ul>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
        </div> 
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
        </div>
      </div>
      /.row
 -->
      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <style>
    text:hover {
        stroke: black;
    }
  </style>
         <div id="cloud"></div>
         <script type="text/javascript" charset="utf-8">
    var weight = 200,   // change me
        width = 960,
        height = 500;
    var fill = d3.scale.category20();
    d3.csv("css/word.csv;charset=utf-8", function(d) {
       //console.log(d);
        return {
          text: d.word,
          size: weight/((+d.freq) + 1)
        }
      },
      function(data) {
        d3.layout.cloud().size([width, height]).words(data)
          //.rotate(function() { return ~~(Math.random() * 2) * 90; })
          .rotate(0)
          .font("Impact")
          .fontSize(function(d) { return d.size; })
          .on("end", draw)
          .start();
        function draw(words) {
          d3.select("#cloud").append("svg")
              .attr("width", width)
              .attr("height", height)
            .append("g")
              .attr("transform", "translate(" + (width/2) + "," + (height/2) + ")")
            .selectAll("text")
              .data(words)
            .enter().append("text")
              .style("font-size", function(d) { return d.size + "px"; })
              .style("font-family", "Impact")
              .style("fill", function(d, i) { return fill(i); })
              .attr("text-anchor", "middle")
              .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
              })
            .text(function(d) { return d.text; });
        }
      });
  </script>
        </div>
<!--         <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div> -->
      </div>

    </div>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- login windows script -->
    <script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
    return false;
  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>

  </body>

</html>