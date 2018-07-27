<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	
	var oriEmail;
	
	var emailChange = false;
	
	window.onload = function(){
		oriEmail = $("#email").val();
	}
	
$(function(){

	$("#newpw").blur(function() {
       checkPswd1();
    });

    $("#newpwChk").blur(function() {
       checkPswd2();
    });
    
    $("#email").blur(function() {	
	    checkEmail();
	});
	
	$('#modBtn').on('click', function(){
		
		if(!checkUnrealInput()){
			alert('입력정보를 확인해주세요.');
			return false;
		}
		
		var data = {
				id : $('#id').text(),
				pw : $('#pw').val(),
				newpw : $('#newpw').val(),
				newpwChk : $('#newpwChk').val(),
				name : $('#name').val(),
				phone : $('#phone').val(),
				birth : $('#birth').val(),
				email : $('#email').val(),
				emailChange : emailChange
		}
		
		$.ajax({
			url: "/proj/ajax/modify",
				dataType : 'json',
			data : data,
			type : 'POST',
			success: function(result){
				
				if(result.msg=="회원정보수정완료"){
					alert(result.msg);
					location.reload();
				}else{
					alert(result.msg);
				}

			}
		
		});
	})
	
	$('#withBtn').on('click', function(){
		
		var data = {
				id : $('#id').text(),
				pw : $('#pw').val()		
		}
		
		$.ajax({
			url: "/proj/ajax/withdrawal",
			dataType : 'json',
			data : data,
			type : 'POST',
			success: function(result){
				alert(result.msg);
				document.location.href="/proj/logOut";
			}
		
		});
	})
});

function checkPswd1() {
    
    var pw = $("#newpw").val();
   
    var oMsg = $("#pw1Msg");

    if (pw == "") {
    	hideMsg(oMsg);
        return true;
    }else{
    	$('#newpwChk').attr("disabled",false);
    }
    
    var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;
        if (isPW.test(pw)) {
        	showErrorMsg(oMsg,"사용가능 비밀번호입니다.");
            return true;
        }else{
        	showErrorMsg(oMsg,"6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
        	return false;
        }
	return true;
}

function checkPswd2() {
    var pswd1 = $("#newpw");
    var pswd2 = $("#newpwChk");
    var oMsg = $("#pw2Msg");
    
    
    if (pswd1.val() != pswd2.val()) {	
   
   		showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
        pswd2.val("");
        return false;
 
    } else {
    	
		if(pswd1.val()==""){
    		
    		hideMsg(oMsg);
            return true;
    		
    	}else{
    		showSuccessMsg(oMsg, "비밀번호가 일치합니다!");
       	 	return true;
       	 }
 	
    }

    return true;
}

function checkEmail() {
    var id = $("#id").val();
    var email = $("#email").val();
    var oMsg = $("#emailMsg");
    
    var data = {email};
	
    if (email == "") {
    	showErrorMsg(oMsg,"이메일 주소를 입력해주세요.");
        return false;
    }
    
	if(email==oriEmail){
		hideMsg(oMsg);
		emailChanege = false;
		return true;
	}
    
    
    var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var isHan = /[ㄱ-ㅎ가-힣]/g;
    if (!isEmail.test(email)) {
        showErrorMsg(oMsg,"이메일 주소를 다시 확인해주세요.");
        return false;
    }else if(isHan.test(email)){
    	showErrorMsg(oMsg,"한글 사용은 불가합니다.");
        return false;
    }
    
    $.ajax({
        type:"POST",
        url: "/proj/ajax/emailChk",
        dataType : 'json',
        data : data,
        success : function(result) {
        
            if (result.chk == "Y") {
                
               showSuccessMsg(oMsg, "가능한 email입니다!");
               emailChange = true;
               return true;
            } else {

                showErrorMsg(oMsg, "이미 가입되어 있는 email주소입니다.");
                return false;
            }
        }
    });
    
    return true;
}

function showErrorMsg(obj, msg) {
   obj.attr("class", "error_next_box");
   obj.html(msg);
   obj.show();
}

function hideMsg(obj) {
   obj.hide();
}

function showSuccessMsg(obj, msg) {
    obj.attr("class", "error_next_box green");
    obj.html(msg);
    obj.show();
}

function checkUnrealInput() {
    if (	checkPswd1()
            & checkPswd2()
            & checkEmail()
            
    ) {
        return true;
    } else {
        return false;
    }
}


</script>

<style>

.frame{
	margin-left: 35%;
	margin-right: 20%;
}

.each{
	padding :5px;
	margin :5px;
}

.info{
	text-align: left;
	font-size: 25px;

}

input[type="text"],
input[type="password"]
{
	width : 85%;
	height : 40px;
	
}

.error_next_box{
	color: red;
	font-size : 12px;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="frame">
		<div class="each">
			<div class="info">아이디</div>
			<div class="content" id="id" style="font-size: 20px;">${data.id}</div>
		</div>
		
		<div class="each">
			<div class="info">비밀번호</div>
			<div class="content" ><span class="pw">
			<input type="password" id="pw" class="form-control" name="pw" placeholder="회원 수정/탈퇴를 위해서는 비밀번호 입력이 필수입니다.">
			</div>
		</div>
		
		<div class="each">
			<div class="info">새 비밀번호</div>
			<div class="content"><span class="newpw">
			<input type="password" id="newpw" class="form-control" name="newpw">
			<span class="error_next_box" id="pw1Msg" style="display: none"></span></div>
			<div>
			</div>
		</div>
		
		<div class="each">
			<div class="info">새 비밀번호 확인</div>
			<div class="content"><span class="newpwChk">
			<input type="password" id="newpwChk" class="form-control" name="newpwChk" disabled="disabled">
			<span class="error_next_box" id="pw2Msg" style="display: none"></span></div>
			<div>
			</div>
		</div>
		
		<div class="each">
			<div class="info">이름</div>
			<div class="content">
			<input type="text" class="form-control" id="name" value="${data.name}" readonly>
			</div>
		</div>
		
		<div class="each">
			<div class="info">핸드폰</div>
			<div class="content"><input type="text" class="form-control" id="phone" value="${data.phone}" readonly></div>
			
		</div>
		
		<div class="each">
			<div class="info">생일</div>
			<div class="content"><input type="text" class="form-control" id="birth" value="${data.birth}" readonly></div>
		</div>
		
		<div class="each">
			<div class="info">e-mail</div>
			<div class="content"><input type="text" class="form-control" id="email" name="email" value="${data.email}"></div>
			<div><span class="error_next_box" id="emailMsg" style="display: none"></span></div>
		</div>
		
		<div class="each" style="margin-top:5%;">
			<div class="button_modify" style="float:left; margin-left:25%;">
			<input name = "modify" id="modBtn" type="button" value="회원수정" class= "btn btn-default"/>
			</div>
			<div class="button_withdrawal">
			<input name="withdrawal" id="withBtn" type="button" value="회원탈퇴" onclick="withdrawal()" class= "btn btn-default"/>
			</div>
		</div>
	</div>
	
</body>
</html>