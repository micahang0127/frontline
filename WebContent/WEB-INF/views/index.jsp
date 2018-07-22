<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.frontline.newssummary.vo.MainSummaryListVO"%> 
<%@ page import="com.frontline.newssummary.vo.SummaryListVO"%> 
<%@ page import="java.util.List"%>
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
	List<MainSummaryListVO> list = (List<MainSummaryListVO>) request.getAttribute("list");
		for(int i = 0; (list != null) && i < 4; i++){
			String active = "active";
			MainSummaryListVO msvo = (MainSummaryListVO) list.get(i);
		%>
          <div onclick="test(<%=i%>)" class="carousel-item <%if(i==0){ %><%=active%><%} %>" style="background-image: url(<%if(msvo.getImg().equals("")) {
            %>'img/ApHandler.png'
            <%}else{ %>
            
            '<%= msvo.getImg() %>'<%} %>)">
            <div class="carousel-caption d-none d-md-block">
            
            
                        <%
            switch(msvo.getSid()){
            
            case 100 :  %><a href="politics?pageNo=1">정치</a><% ;break;
            case 101 :  %><a href="Economy?pageNo=1">경제</a><% ;break;
            case 102 :  %><a href="society?pageNo=1">사회</a><% ;break;
            case 103 :  %><a href="culture?pageNo=1">생활/문화</a><% ;break;
            case 104 :  %><a href="world?pageNo=1">세계</a><% ;break;
            case 105 :  %><a href="science?pageNo=1">it/과학</a><% ;break;
            }
            
                       
            
            %>
            
            
              <h3 style="color:black;stroke:1px;stroke:#000000;"><%= msvo.getTitle() %></h3>
            </div>
          </div>

          
          	<form name="fform" id="fform<%=i%>" action="summaryPage" method="post">
          	<input type="hidden" name="title" class="fsummary<%=i%>" value=<%
          	
          	
          		if (msvo.getTitle().contains("'") && (msvo.getTitle().contains("\""))){
          			String newtitle = msvo.getTitle().replaceAll("'", "`");
              		%>'<%=newtitle%>'<%
              	}else if (msvo.getTitle().contains("\"")){
              		%>'<%=msvo.getTitle()%>'<%
              	}else if( msvo.getTitle().contains("'")){
              		%>"<%=msvo.getTitle()%>"<%
              	}else{
              		%>"<%=msvo.getTitle()%>"<%
              	}
              	
              		
              %>/>
            <input type="hidden" name="aid"  class="fsummary<%=i%>" value="<%= msvo.getAid() %>"/>
            <input type="hidden" name="oid"  class="fsummary<%=i%>" value="<%= msvo.getOid() %>"/>
            <input type="hidden" name="img"  class="fsummary<%=i%>" value="<%= msvo.getImg() %>"/>
            <input type="hidden" name="content" class="fsummary<%=i%>" value=<%
     		if (msvo.getContent().contains("'") && (msvo.getContent().contains("\""))){
      			String newContent = msvo.getContent().replace("'", "`");
          		%>'<%=newContent%>'<%
          	}else if (msvo.getContent().contains("\"")){
          		%>'<%=msvo.getContent()%>'<%
          	}else if( msvo.getContent().contains("'")){
          		%>"<%=msvo.getContent()%>"<%
          	}else{
          		%>"<%=msvo.getContent()%>"<%
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
          <form name="mform" action="summaryPage" method="post">
            <a href="#"><input type="image" class="card-img-top"  src=
            <%if(msvo.getImg().equals("")) {
            %>"img/ApHandler.png"
            <%}else{ %>
            
            "<%= msvo.getImg() %>"<%} %> height="250px" alt=""></a>
            
            <div class="card-body" >
            
            <%
            switch(msvo.getSid()){
            
            case 100 :  %><a href="politics?pageNo=1">정치</a><% ;break;
            case 101 :  %><a href="Economy?pageNo=1">경제</a><% ;break;
            case 102 :  %><a href="society?pageNo=1">사회</a><% ;break;
            case 103 :  %><a href="culture?pageNo=1">생활/문화</a><% ;break;
            case 104 :  %><a href="world?pageNo=1">세계</a><% ;break;
            case 105 :  %><a href="science?pageNo=1">it/과학</a><% ;break;
            }
            
            
            %>
            
              <h5 class="card-title">
                <a><%= msvo.getTitle() %></a>
              </h5>
              <p class="card-text"></p>
              <input type="hidden" name="title"  value=<%
        		if (msvo.getTitle().contains("'") && (msvo.getTitle().contains("\""))){
          			String newtitle = msvo.getTitle().replaceAll("'", "`");
              		%>'<%=newtitle%>'<%
              	}else if (msvo.getTitle().contains("\"")){
              		%>'<%=msvo.getTitle()%>'<%
              	}else if( msvo.getTitle().contains("'")){
              		%>"<%=msvo.getTitle()%>"<%
              	}else{
              		%>"<%=msvo.getTitle()%>"<%
              	}
              %>/>
              
              <input type="hidden" name="aid"  value="<%= msvo.getAid() %>"/>
              <input type="hidden" name="oid"  value="<%= msvo.getOid() %>"/>
              <input type="hidden" name="img"  value="<%= msvo.getImg() %>"/>
              <input type="hidden" name="content" value=<%
       		if (msvo.getContent().contains("'") && (msvo.getContent().contains("\""))){
      			String newContent = msvo.getContent().replace("'", "`");
          		%>'<%=newContent%>'<%
          	}else if (msvo.getContent().contains("\"")){
          		%>'<%=msvo.getContent()%>'<%
          	}else if( msvo.getContent().contains("'")){
          		%>"<%=msvo.getContent()%>"<%
          	}else{
          		%>"<%=msvo.getContent()%>"<%
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