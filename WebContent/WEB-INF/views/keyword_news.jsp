<%@page import="com.frontline.newssummary.vo.WordCloudVO"%>
<%@page import="com.frontline.newssummary.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ű���� ����</title>
</head>
<body>

<h1>Ŭ���� ���� �������ʶ�~~!!!!!!!</h1>

	<% 
	List<ArticleVO> list = (List<ArticleVO>) request.getAttribute("articles");
	System.out.println("����Ʈ�� ����???"+list);

	if(list != null){
		
		for(ArticleVO article_content : list){
			
			
	%>
	<table>
		<tr>
			<td>
			<%= article_content.getImg() %><br/>
			</td>
			<td>
			<h3>���� ���� :</h3> <%= article_content.getTitle() %><br/>
			<h3>����� ����</h3>
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