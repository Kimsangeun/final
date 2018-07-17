<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">
var idFlag = false;

$(document).ready(function() {

   //region unreal id
   $("#id").blur(function() {
       idFlag = false;
       checkId("first");
   });

   $("#pw").blur(function() {
       pwFlag = false;
       checkPswd1();
   });

   $("#pw2").blur(function() {
       checkPswd2();
   });

   $("#name").blur(function() {
       checkName();
   });

   $("#yy").blur(function() {
       checkBirthday();
   });

   $("#mm").change(function() {
       checkBirthday();
   });

   $("#dd").blur(function() {
       checkBirthday();
   });

   $("#email").blur(function() {
       checkEmail();
   });

   $("#phone").blur(function() {
       checkPhoneNo();
   });

   $("#btnSend").click(function() {
       sendSmsButton();
       return false;
   });

   
   //endregion

   $("#btnJoin").click(function(event) {
       clickcr(this, 'sup.signup', '', '', event);
       submitClose();
       if(idFlag && pwFlag && authFlag) {
           mainSubmit();
       } else {
           setTimeout(function() {
               mainSubmit();
           }, 700);
       }
   });

});


function checkId(event) {
   if(idFlag) return true;

   var id = $("#id").val();
   var oMsg = $("#idMsg");
   
   var data = {id};

   if ( id == "") {
       showErrorMsg(oMsg,"필수 정보입니다.");
       return false;
   }

   var isID = /^[a-z0-9][a-z0-9_\-]{5,13}$/;
   if (!isID.test(id)) {
       showErrorMsg(oMsg,"6~14자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
       return false;
   }

   idFlag = false;
   $.ajax({
       type:"POST",
       url: "/proj/ajax/idChk",
       dataType : 'json',
       data : data,
       success : function(result) {
       
           if (result.chk == "Y") {
               if (event == "first") {
                   showSuccessMsg(oMsg, "멋진 아이디네요!");
               } else {
                   hideMsg(oMsg);
               }
               idFlag = true;
           } else {
               showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
           }
       }
   });
   return true;
}

function checkPswd1() {
    if(pwFlag) return true;

    pwFlag = false;
    
    var pw = $("#pw").val();
   
    var oMsg = $("#pw1Msg");

    if (pw == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
    
    var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;
        if (isPW.test(pw)) {
        	showErrorMsg(oMsg,"사용가능 비밀번호입니다.");
        	pwFlag = true;
            return true;
        }else{
        	showErrorMsg(oMsg,"6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
        	return false;
        }
	return true;
}

function checkPswd2() {
    var pswd1 = $("#pw");
    var pswd2 = $("#pw2");
    var oMsg = $("#pw2Msg");
    

    if (pswd2.val() == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
    if (pswd1.val() != pswd2.val()) {
        showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
        pswd2.val("");
        return false;
    } else {
    	showSuccessMsg(oMsg, "비밀번호가 일치합니다!");
        return true;
    }

    return true;
}

function checkName() {
    var oMsg = $("#nameMsg");
    var nonchar = /[^가-힣a-zA-Z0-9]/gi;

    var name = $("#name").val();
    if (name == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
    if (name != "" && nonchar.test(name)) {
        showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
        return false;
    }

    hideMsg(oMsg);
    return true;
}

function checkBirthday() {
    var agentType = "";
    if(agentType == "iOS_App") {
        return true;
    }

    var birthday;
    var yy = $("#yy").val();
    var mm = $("#mm").val();
    var dd = $("#dd").val();
    var oMsg = $("#birthMsg");
    var lang = "ko_KR";

    if (yy == "" && mm == "" && dd == "") {
        showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
        return false;
    }

    if (mm.length == 1) {
        mm = "0" + mm;
    }
    if (dd.length == 1) {
        dd = "0" + dd;
    }

    if(yy == "") {
        showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
        return false;
    }
    if(yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1) {
        showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
        return false;
    }
    if(mm == "") {
        alert(mm);
        showErrorMsg(oMsg,"태어난 월을 선택하세요.");
        return false;
    }
    if(dd == "") {
        showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
        return false;
    }
    if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
        showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
        return false;
    }

    birthday = yy + mm + dd;
    if (!isValidDate(birthday)) {
        showErrorMsg(oMsg,"없는 날짜예요.");
        return false;
    }
    $("#birthday").val(birthday);

    var age = calcAge(birthday);
    if (age < 0) {
        showErrorMsg(oMsg,"미래에서 오셨군요. ^^");
        return false;
    } else if (age >= 100) {
        showErrorMsg(oMsg,"정말이세요?연세가...");
        return false;
    } else if (age < 14) {
        showErrorMsg(oMsg,"만 14세 미만의 어린이는 보호자 동의가 필요합니다.");
        return false;
        
    } else {
        hideMsg(oMsg);
        return true;
    }
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

function calcAge(birth) {
    var date = new Date();
    var year = date.getFullYear();
    var month = (date.getMonth() + 1);
    var day = date.getDate();
    if (month < 10)
        month = '0' + month;
    if (day < 10)
        day = '0' + day;
    var monthDay = month + '' + day;

    birth = birth.replace('-', '').replace('-', '');
    var birthdayy = birth.substr(0, 4);
    var birthdaymd = birth.substr(4, 4);

    var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
    return age;
}

function isValidDate(param) {
    try {
        param = param.replace(/-/g, '');

        // 자리수가 맞지않을때
        if (isNaN(param) || param.length != 8) {
            return false;
        }

        var year = Number(param.substring(0, 4));
        var month = Number(param.substring(4, 6));
        var day = Number(param.substring(6, 8));

        if (month < 1 || month > 12) {
            return false;
        }

        var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
        var maxDay = maxDaysInMonth[month - 1];

        // 윤년 체크
        if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
            maxDay = 29;
        }

        if (day <= 0 || day > maxDay) {
            return false;
        }
        return true;

    } catch (err) {
        return false;
    }
    ;
}


		
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/proj/joinMember">
	<input type="hidden" id="birthday" name="birthday" value="">
	<div class="frame">
		<!-- 아이디 -->
		<div class="each">
			<h3 class="each_title">아이디</h3>
			<span class="box_id"> <input type="text" id="id" name="id"
				class="int" title="ID" maxlength="14">
			</span> <span class="error_next_box" id="idMsg" style="display: none"></span>
		</div>

		<!-- 비밀번호 및 재확인 -->
		<div class="each">
			<h3 class="each_title">비밀번호</h3>
			<span class="box_pw"> <input type="password" id="pw"
				name="pw" class="int" title="비밀번호 입력" maxlength="14">
			</span> 
			<span class="error_next_box" id="pw1Msg" style="display: none">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

			<h3 class="each_title">비밀번호 재확인</h3>
			<span class="box_pwChk"> <input type="password" id="pw2"
				name="pw2" class="int" title="비밀번호 재확인 입력" maxlength="14">
			</span> 
			<span class="error_next_box" id="pw2Msg" style="display: none"></span>
		</div>

		<!-- 이름 -->
		<div class="each">
			<h3 class="each_title">이름</h3>
			<span class="box_name"> <input type="text" id="name"
				name="name" class="int" title="이름" maxlength="40">
			</span> <span class="error_next_box" id="nameMsg" style="display: none"></span>
		</div>

		<!-- 생년월일 -->
		<div class="each birth">
			<h3 class="each_title">생년월일</h3>
			<div class="bir_wrap">
				<div class="bir_yy">
					<span class="ps_box"> <input type="text" id="yy" name="yy"
						placeholder="년(4자)" class="int" maxlength="4"> <label
						for="yy" class="lbl">년(4자)</label>
					</span>
				</div>
				<div class="bir_mm">
					<span class="ps_box"> <select id="mm" name="mm" title="월" class="sel">
							<option>월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select>
					</span><!--ㄴ  -->
				</div>
				<div class=" bir_dd">
					<span class="ps_box"> <input type="text" id="dd" name="dd"
						placeholder="일" class="int" maxlength="2"> <label for="dd"
						class="lbl">일</label>
					</span>
				</div>
			</div>
			<span class="error_next_box" id="birthMsg" style="display: none"></span>
		</div>
		
		
	<!-- 핸드폰 -->
		<div class="each">
			<h3 class="each_title">휴대폰</h3>
			<span class="box_phone"> <input type="text" id="phone"
				name="phone" class="int" title="휴대폰" maxlength="40">
			</span> <span class="error_next_box" id="phoneMsg" style="display: none"></span>
		</div>
        
    <!-- 이메일인증 -->
        <div class="each">
			<h3 class="each_title">이메일</h3>
			<span class="box_email"> <input type="text" id="email"
				name="email" class="int" title="이메일" maxlength="40">
			</span> <span class="error_next_box" id="emailMsg" style="display: none"></span>
		</div>
    
    <div><input type="submit"></div>
    
	</div>
	</form>
	
</body>
</html>
