<%@page import="com.frontline.newssummary.vo.WordCloudVO"%>
<%@page import="com.frontline.newssummary.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>키워드 뉴스</title>
</head>
<body>

<h1>클릭한 값을 가져오너라~~!!!!!!!</h1>

	<% 
	List<ArticleVO> list = (List<ArticleVO>) request.getAttribute("articles");
	System.out.println("리스트는 무엇???"+list);

	if(list != null){
		
		for(ArticleVO article_content : list){
			
			
	%>
	<table>
		<tr>
			<td>
			<%= article_content.getImg() %><br/>
			</td>
			<td>
			<h3>나는 제목 :</h3> <%= article_content.getTitle() %><br/>
			<h3>여기는 내용</h3>
			<%= article_content.getContent() %><br/>
			</td>
		</tr>
	</table>
	<%	
		}
	}
	%>

</body>
</html>