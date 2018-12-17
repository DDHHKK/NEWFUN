/*이메일 중복체크*/

	function idcheck(){
		var email = document.fre.email.value;
		if(email.indexOf('@')==-1 || email.indexOf('.') == -1){
			alert("올바른 이메일 형식을 입력하세요");
			document.fre.email.focus();
			return;
		}
		window.open("MemberEmailCheckAction.me?email="+email,"email_check","top=170, left=710, width=500, height=250");
	}
