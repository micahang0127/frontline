<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.frontline.newssummary.vo.SummaryListVO"%> 
<%@ page import="java.util.List"%>
<%@ page import="java.lang.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    
        <!-- wordCloud script -->
  	<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.4/d3.layout.cloud.js"></script>
    
  </head>
  <body>
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
	List<SummaryListVO> list = (List<SummaryListVO>) request.getAttribute("list");
		for(int i = 0; (list != null) && i < 4; i++){
			String active = "active";
			SummaryListVO slvo = (SummaryListVO) list.get(i);
		%>
		
          <div onclick="test(<%=i%>)" class="carousel-item <%if(i==0){ %><%=active%><%} %>" style="background-image: url(<%if(slvo.getImg().equals("")) {
            %>'img/ApHandler.png'
            <%}else{ %>
            
            '<%= slvo.getImg() %>'<%} %>)">
            <div class="carousel-caption d-none d-md-block">
              <h3 style="color:black;stroke:#000000;"><%= slvo.getTitle() %></h3>
            </div>
          </div>
          
          	<form name="fform" id="fform<%=i%>" action="summaryPage" method="post">
          	<input type="hidden" name="title" class="fsummary<%=i%>" value=<%
          	
          	
          		if (slvo.getTitle().contains("'") && (slvo.getTitle().contains("\""))){
          			String newtitle = slvo.getTitle().replaceAll("'", "`");
              		%>'<%=newtitle%>'<%
              	}else if (slvo.getTitle().contains("\"")){
              		%>'<%=slvo.getTitle()%>'<%
              	}else if( slvo.getTitle().contains("'")){
              		%>"<%=slvo.getTitle()%>"<%
              	}else{
              		%>"<%=slvo.getTitle()%>"<%
              	}
              	
              		
              %>/>
            <input type="hidden" name="aid"  class="fsummary<%=i%>" value="<%= slvo.getAid() %>"/>
            <input type="hidden" name="oid"  class="fsummary<%=i%>" value="<%= slvo.getOid() %>"/>
            <input type="hidden" name="img"  class="fsummary<%=i%>" value="<%= slvo.getImg() %>"/>
            <input type="hidden" name="content" class="fsummary<%=i%>" value=<%
     		if (slvo.getContent().contains("'") && (slvo.getContent().contains("\""))){
      			String newContent = slvo.getContent().replace("'", "`");
          		%>'<%=newContent%>'<%
          	}else if (slvo.getContent().contains("\"")){
          		%>'<%=slvo.getContent()%>'<%
          	}else if( slvo.getContent().contains("'")){
          		%>"<%=slvo.getContent()%>"<%
          	}else{
          		%>"<%=slvo.getContent()%>"<%
          	}
              		
              %>/>
          </form>

          
          	<%
				}
			%>   
          <!-- Slide end-->
          
<script type="text/javascript">
	function test(vals){
		$('#fform'+vals).submit();
	}

</script>
          
          
          
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
    
    <!-- paging -->
    <%
    	if(Integer.parseInt( request.getParameter("pageNo")) > 1){
    		%><a href="#">이전</a><%
    	}
    
    %>
    <!-- ./paging -->
    <%=request.getParameter("pageNo") %>
    
    <div class="container">

      <!-- Portfolio Section -->
      <b></b>
      <br/>
      <div class="row">
<%
		for(int i = 4; (list != null) && i < 10; i++){
			SummaryListVO slvo = (SummaryListVO) list.get(i);
			request.setAttribute("slvo", slvo);
			
%>

        <div class="col-lg-4 col-sm-6 portfolio-item">
        
          <div class="card h-100">
          <form name="mform" action="summaryPage" method="post">
            <a href="#"><input type="image" class="card-img-top"  src=
            <%if(slvo.getImg().equals("")) {
            %>"img/ApHandler.png"
            <%}else{ %>
            
            "<%= slvo.getImg() %>"<%} %> height="250px" alt=""></a>
            <div class="card-body" >
              <h5 class="card-title">
                <a><%= slvo.getTitle() %></a>
              </h5>
              <p class="card-text"></p>
              <input type="hidden" name="title"  value=<%
        		if (slvo.getTitle().contains("'") && (slvo.getTitle().contains("\""))){
          			String newtitle = slvo.getTitle().replaceAll("'", "`");
              		%>'<%=newtitle%>'<%
              	}else if (slvo.getTitle().contains("\"")){
              		%>'<%=slvo.getTitle()%>'<%
              	}else if( slvo.getTitle().contains("'")){
              		%>"<%=slvo.getTitle()%>"<%
              	}else{
              		%>"<%=slvo.getTitle()%>"<%
              	}
              %>/>
              
              <input type="hidden" name="aid"  value="<%= slvo.getAid() %>"/>
              <input type="hidden" name="oid"  value="<%= slvo.getOid() %>"/>
              <input type="hidden" name="img"  value="<%= slvo.getImg() %>"/>
              <input type="hidden" name="content" value=<%
       		if (slvo.getContent().contains("'") && (slvo.getContent().contains("\""))){
      			String newContent = slvo.getContent().replace("'", "`");
          		%>'<%=newContent%>'<%
          	}else if (slvo.getContent().contains("\"")){
          		%>'<%=slvo.getContent()%>'<%
          	}else if( slvo.getContent().contains("'")){
          		%>"<%=slvo.getContent()%>"<%
          	}else{
          		%>"<%=slvo.getContent()%>"<%
          	}
              		
              %>/>
              </form>
            </div>
          </div>
        </div>
			<%
				}
			%>       
      <!-- /.row -->
      <hr>
      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
  <!--         <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div> -->
      </div>
    </div>
    </div>
    <!-- /.container -->
    
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
    // d3.csv(file, function(row){...}, function(data){...});
    var reqUrl = '/cloudwords';		// json?뺥깭??wordcloud ?ㅼ뼱?덈뒗 ?뚯씪.
    // "css/word.csv;charset=utf-8"
     function render(data) {		// ?ш린??wordcloud???붿옄?몃?遺?
        d3.layout.cloud().size([width, height]).words(data)
          //.rotate(function() { return ~~(Math.random() * 2) * 90; })
          .rotate(0)
          .font("Impact")
          .fontSize(function(d) { return d.size; })
          .on("end", draw)
          .start();
        function draw(words) {
          var what = d3.select("#cloud").append("svg")
              .attr("width", width)
              .attr("height", height)
            .append("g")
              .attr("transform", "translate(".concat(width/2).concat(",").concat(height/2).concat(")"))
            .selectAll("text")
              .data(words)
            .enter();
          
              what.append("a")
              		.attr( "xlink:href", function ( each ) { return "/tags/" + each.text;} )	// ?⑥뼱瑜??꾨Ⅴ硫?/tags/?대┃?쒕떒?? ?뺥깭??url二쇱냼濡?媛?
              .append("text")
              .style("font-size", function(d) { return d.size + "px"; })
              .style("font-family", "Impact")
              .style("fill", function(d, i) { return fill(i); })
              .attr("text-anchor", "middle")
              .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
              })
            .text(function(d) { return d.text; });
        }// end draw
      };
      
    d3.json(reqUrl, function( words) {
      	console.log("?ш린??json: "+words);
    	for ( var i = 0 ; i < words.length ; i ++ ) {
    		console.log("?먮쾲吏?json"+ words[1].word);
    		words[i].text = words[i].word;
    		words[i].size = weight/( (+words[i].cnt) + 1 );
    	}
    	render ( words );
       }
     );
  </script>
        </div>
    
    </div>
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
s    <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>