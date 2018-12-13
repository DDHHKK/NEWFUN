/*비밀번호  / 핸드폰 번호 제어*/

var right=0;
function change_pw(){
	var chk1 = /\d/;
	var chk2 = /[a-z]/i;
	var pass = document.pw_form.me_pass.value;

	 if(pass.length<6 || pass==null){
	  alert("비밀번호를 확인해주세요.(영어,숫자조합 6글자이상)");
	  return false;
	 }
	 if (chk1.test(pass) && chk2.test(pass)){
	 }else{
	  alert("비밀번호는 영어,숫자 조합입니다.");
	  return false;
	 }

	 document.pw_form.submit();
}//regChk()

