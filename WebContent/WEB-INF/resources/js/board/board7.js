function fn_formSubmit(){
	if ( $.trim($("#rewriter1").val()) == "") {
		alert("작성자를 입력해주세요.");
		$("#rewriter1").focus();
		return;
	}
	if ($.trim($("#rememo1").val()) == "") {
		alert("글 내용을 입력해주세요.");
		$("#rememo1").focus();
		return;
	}
	$.ajax({
		url: "board7ReplySaveAjax",
		type:"post", 
		data: {"brdno": $("#brdno1").val(), "rewriter": $("#rewriter1").val(), "rememo": $("#rememo1").val()},
		success: function(result){
			if (result!=="") {
				var div = $("<div>");
				div.attr("id", "replyItem" + result);
				div.appendTo($("#replyList"));
				div.css({border: "1px solid gray", width: "600px", "padding": "5px", "margin-top": "5px", "margin-left": "0px", display:"inline-block"});
				div.text($("#rewriter1").val() + " 방금" );
				
				$("<a>",{
				    text: "삭제",
				    href: "#",
				    click: function (){fn_replyDelete(result)}
				}).appendTo(div);
				
				$("<a>").attr("href", "#").text("수정").click(function (){fn_replyUpdate(result)}).appendTo(div);
				
				var href = $("<a>");
				href.attr("href", "#");
				href.text("댓글");
				href.click(function (){fn_replyReply(result)});
				href.appendTo(div);

				var reply=$("<div>").appendTo(div);
				reply.attr("id", "reply" + result);
				reply.html($("#rememo1").val());

				$("#rewriter1").val("");
				$("#rememo1").val("");
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})	
}

function fn_replyDelete(reno){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		url: "board7ReplyDeleteAjax",
		type:"post", 
		data: {"brdno": $("#brdno").val(), "reno": reno},
		success: function(result){
			if (result=="OK") {
				$("#replyItem"+reno).remove();
				alert("삭제되었습니다.");
			} else{
				alert("댓글이 있어서 삭제할 수 없습니다.");
			}
		}
	})
} 

var updateReno = updateRememo = null;
function fn_replyUpdate(reno){
	hideDiv("replyDialog");
	
	$("#replyDiv").show();
	
	if (updateReno) {
		$("#replyDiv").appendTo(document.body);
		$("#reply"+updateReno).text(updateRememo);
	} 
	
	$("#reno2").val(reno);
	$("#rememo2").val($("#reply"+reno).text());
	$("#reply"+reno).text("");
	$("#replyDiv").appendTo($("#reply"+reno));
	$("#rememo2").focus();
	updateReno   = reno;
	updateRememo = $("#rememo2").val();
} 

function fn_replyUpdateSave(){
	if ($.trim($("#rememo2").val()) == "") {
		alert("글 내용을 입력해주세요.");
		$("#rememo2").focus();
		return;
	}
	var formData = $("#form2").serialize();
	$.ajax({
		url: "board7ReplySaveAjax",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#reply"+updateReno).text($("#rememo2").val());
				$("#replyDiv").hide();
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})	
} 

function fn_replyUpdateCancel(){
	hideDiv("#replyDiv");
	
	$("#reply"+updateReno).text(updateRememo);
	updateReno = updateRememo = null;
} 

function hideDiv(id){
	$(id).hide();
	$(id).appendTo(document.body);
}

function fn_replyReply(reno){
	$("#replyDialog").show();
	
	if (updateReno) {
		fn_replyUpdateCancel();
	} 
	
	$("#reparent3").val(reno);
	$("#rememo3").val("");
	$("#replyDialog").appendTo($($("#reply"+reno)));
	$("#rewriter3").focus();
} 

function fn_replyReplyCancel(){
	hideDiv("#replyDialog");
} 

function fn_replyReplySave(){
	if ( $.trim($("#rewriter3").val()) == "") {
		alert("작성자를 입력해주세요.");
		$("#rewriter3").focus();
		return;
	}
	if ($.trim($("#rememo3").val()) == "") {
		alert("글 내용을 입력해주세요.");
		$("#rememo3").focus();
		return;
	}
	
	var formData = $("#form3").serialize();
	$.ajax({
		url: "board7ReplySaveAjax4Reply",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				var parent = $("#reparent3").val();
				$("#replyItem"+parent).after(result);
				$("#replyDialog").hide();
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})		
}