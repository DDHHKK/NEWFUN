/*비밀번호  / 핸드폰 번호 제어*/

var right=0;
function regChk(){
	var chk1 = /\d/;
	var chk2 = /[a-z]/i;
	var pass = document.fr.pass.value;
	var email = document.fr.email.value;
	 
	 if(email.length==0 || email==""){
	  alert("이메일을 입력하십시오");
	  return false;
	 }
	 if(email.indexOf('@')==-1 || email.indexOf('.') == -1){
		  alert("이메일형식으로 입력하십시오");
		  return false;
	 }
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
	 var name = document.fr.name.value;
	 if(name.length==0 || name==null){
	  alert("이름을 입력하십시오");
	  return false;
	 }
	 var num_regx = /^[0-9]*$/;
	 var phone = document.fr.phone.value;
	 if(phone.length==0 || phone==null){
	  alert("핸드폰번호를 입력하십시오");
	  return false;
	 }
	 if (!num_regx.test(phone)){
	 alert("핸드폰번호는 숫자만 입력가능합니다");
	  return false;
	 }
	 var ckeck = document.fr.req.checked;
	 
	 if(ckeck==false){
	alert("약관동의 체크 해주세요");
	return false;	 
	 }
	 document.fr.submit();
}//regChk()
function passchk(){
	var pass = document.fr.pass.value;
	 var pass2 = document.fr.pass2.value;
	 if (pass2.length == 0 || pass2 == "") {
	  document.fr.chk.value = "비밀번호를 입력하세요";
	  right = 0;
	 } else if (pass != pass2) {
	  document.fr.chk.value = "비밀번호가 다릅니다.";
	  right = 0;
	 } else {   
	  document.fr.chk.value = "비밀번호가 동일합니다.";
	  right = 1;
	 }
	 return;
	}//passchk() 
