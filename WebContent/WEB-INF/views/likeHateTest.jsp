<%@ page import="com.frontline.newssummary.vo.SummaryVO"%> 
<%@ page import="com.frontline.newssummary.vo.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Like Hate Test</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function LikeCheckFunction() {
		alert('버튼눌림');
	    var userid = $('#userId').val();//*****값수정
	    var id = $('#summaryId').val(); //****값수정
	    var imgid = $('#LikeChecker').val();
	    alert(imgid);
	    alert(userid+', '+id);
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
	                } else {
	                    alert('이미 좋아요 눌렀어요!');
	                }
	            }
	        })
	    }
</script>
</head>
<body>
        <%
        SummaryVO SummarySelect = (SummaryVO) request.getAttribute("SummarySelect");
		%>
		<p>로그인 아이디 : ${LoginId}</p>
		<input type="hidden" name="id" id="userId" value="${LoginId}"/>
		<input type="hidden" name="summaryId" id="summaryId" value="7">
		<!-- 히든으로 영역하나 만들어서 거기에 로그인 아이디 넣어놔야됨. -->
		<!-- 요약 아이디도? -->
		<div><%=SummarySelect.getContent() %> </div>
<img src="img/Like.png" style="width:30px;" id="LikeChecker" onclick="LikeCheckFunction()"><%=SummarySelect.getLikes() %>
<img src="img/Hate.png" style="width:30px;" onclick="HateCheckFunction()"><%=SummarySelect.getHate() %>
</body>
</html>