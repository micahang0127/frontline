<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/custom.css">

	<title>회원가입</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script type="text/javascript">

	//registerCheckFunction->button ID CHECK를 누르면 실행되는 함수
	var jungbockClick =0;
	
	function registerCheckFunction() {
	    //id가 userID인 variable을 저장
	    var id = $('#userID').val();
	        //ajax : jquery안에 포함되어있는 것
	        
	        $.ajax({
	            type : 'POST',
	            url : 'checkUser', //여기로 가서 function을 실행할꺼에요
	            data : {
	                id : id
	            },
	            success : function(result) { //result를 받아올꺼죠
	                if (result == 1) {
	                    $('#checkMessage').html("사용할 수 있는 아이디입니다."); //이 id 값에다가 저장해주세요
	                    $('#checkType')
	                            .attr('class', 'modal-content panel-success');
	                    
	                    jungbockClick = 1;
	                } else {
	                    $('#checkMessage').html("사용할 수 없는 아이디입니다.");
	                    $('#checkType')
	                            .attr('class', 'modal-content panel-warning'); //chekType의 class를 지정해줍니다.(attr = Attribute)
	                }
	                $('#checkModal').modal("show"); //checkModal을 보여주세요 -> modal은 popup창 같은 겁니당
	            }
	        })
	    }

	function registConfirmCheck(){
		var id = $('#userID').val();
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		var email = $('#userEmail').val();

		if(jungbockClick ==0){
			alert('중복확인을 해주세요');
		}else if(id == ''){ alert('아이디를 넣어주세요');
		}else if(userPassword1 == ''){ alert('비밀번호를 입력해주세요');
		}else if(userPassword2 == ''){ alert('비밀번호 확인을 해주세요');
		}else if(email == ''){ alert('이메일을 입력해주세요');
		}
		else{
		
		$.ajax({
            type : 'POST',
            url : 'userRegister', 
            data : {
                id : id,
                pw : userPassword1,
                email : email
            },
            success : function(result) {
                if (result == 1) {
                    alert('회원가입이 완료되었습니다.');
                    
                    location.href = "index";
                    
                } else {
                	alert('회원가입을 실패하였습니다. 잠시후 다시 시도해주세요.');
                }
            }
        })
        
	}
		
	}

	
	function passwordCheckfunction(){
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if(userPassword2 == userPassword1){
			$('#passwordCheckMessage').html('');
		}
		if(userPassword2 != userPassword1){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}
		
	}
</script>

</head>
<body>
	<div class=container">
		<form method="post">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원 등록 양식</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="userID" name="id" maxLength="12" placeholder="아이디를 입력해주세요."></td>
						<td style="width: 110px;"><button class="btn btn-primary" onclick="registerCheckFunction()" type="button">중복체크</button></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" type="password" onkeyup="passwordCheckfunction()" id="userPassword1" name="pw" maxLength="16" placeholder="비밀번호를 입력해주세요." required="required"></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2"><input class="form-control" type="password" onkeyup="passwordCheckfunction()" id="userPassword2" name="userPassword2" maxLength="16" placeholder="비밀번호 확인을 입력해주세요" required="required"></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>이메일</h5></td>
						<td colspan="2"><input class="form-control" type="email" id="userEmail" name="email" maxLength="20" placeholder="이메일을 입력해주세요." required="required"></td>
					</tr>
					<tr>
						
						<td style="text-align: Left" colspan="3"><h5 style="color: red:" id="passwordCheckMessage"></h5><input class="btn btn-primary pull-right" onclick="registConfirmCheck()" type="button" value="회원가입"></td>
					</tr>
	
				</tbody>
			</table>
		</form>
	</div>
		<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String) session.getAttribute("messageType");
		}
		if(messageContent != null){

	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class = "vertical-alignment-helper">
			<div class = "modal-dialog vertical-align-center">
				<div class="modal-content <% if(messageType.equals("오류메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class= "modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%> 
 <div class="modal fade" id="checkModal" tableindex="-1" role="dialog"
        aria-hidden="true">
        <dv class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div id="checkType" class="modal-content panel-info">
                <div class="modal-header panel-heading">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span> <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">Check Message</h4>
                </div>
                <!-- 여기에 비밀번호가 일치하는지 하지 않는지를 실시간으로 나타내줌 -->
                <!-- 이것이 모달이라니! 알아두자 -->
                <div class="modal-body" id="checkMessage"></div>
            </div>
        </div>
        </dv>
    </div>
 
</body>
</html>