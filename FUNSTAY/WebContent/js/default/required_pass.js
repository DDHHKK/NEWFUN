/*비밀번호  / 핸드폰 번호 제어*/

var right=0;
function change_pw(){
	var chk1 = /\d/;
	var chk2 = /[a-z]/i;
	var pass = document.pw_form.me_pass.value;

	 if(pass.length<6 || pass==null){
	  alert("비밀번호를 입력하십시오(영어,숫자조합 6글자이상)");
	  return false;
	 }
	 if (chk1.test(pass) && chk2.test(pass)){
	 }else{
	  alert("비밀번호는 영어, 숫자 조합입니다.");
	  return false;
	 }
	 if(right == 0){
	  alert("비밀번호가 동일한지 확인하시오");
	  return false;
	 }

	 document.pw_form.submit();
}//regChk()

function passchk(){
	var pass = document.pw_form.me_pass.value;
	 var pass2 = document.pw_form.me_pass_check.value;
	 if (pass2.length == 0 || pass2 == "") {
	  document.pw_form.me_pass_check.value = "비밀번호를 입력하세요";
	  right = 0;
	 } else if (pass != pass2) {
		 document.pw_form.me_pass_check.value = "비밀번호가 다릅니다.";
	  right = 0;
	 } else {   
		 /*document.pw_form.me_pass_check.value = "비밀번호가 동일합니다.";*/
	  right = 1;
	 }
	 return;
}//passchk() 
