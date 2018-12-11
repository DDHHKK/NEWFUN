/*아이디 찾기*/
function chk_idform(f){
	if (f.me_name.value=="")
	{
		alert("이름을 입력해주세요.");
		f.me_name.focus();
		return false;
	}
	if (f.me_hp1.options[0].selected==true)
	{
		alert("휴대폰번호 앞 3자리를 선택해주세요.");
		f.me_hp1.focus();
		return false;
	}
	if (f.me_hp2.value=="")
	{
		alert("휴대폰번호 중간 4자리를 입력해주세요.");
		f.me_hp2.focus();
		return false;
	}
	if (f.me_hp3.value=="")
	{
		alert("휴대폰번호 뒤 4자리를 입력해주세요.");
		f.me_hp3.focus();
		return false;
	}

}
/*비밀번호 찾기*/
function chk_pwform(f){
	if (f.me_id.value=="")
	{
		alert("아이디를 입력해주세요.");
		f.me_id.focus();
		return false;
	}
	if (f.me_name.value=="")
	{
		alert("이름을 입력해주세요.");
		f.me_name.focus();
		return false;
	}

}