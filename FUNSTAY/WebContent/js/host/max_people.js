
/*1번방 버튼*/

/*인원수 */
var j1=0; //인원수 초기화 

function plus1() { //인원수 증가
	j1+=1;
	document.fr1.num_text1.value=j1;
	return j1;
}

function minus1() { //인원수 감소
	if(j1>0){
	j1-=1;
	}
	document.fr1.num_text1.value=j1;
	return j1;
}


/*2번방 버튼*/

/*인원수 */
var j2=0; //인원수 초기화 

function plus2() { //인원수 증가
	j2+=1;
	document.fr1.num_text2.value=j2;
	return j2;
}

function minus2() { //인원수 감소
	if(j2>0){
	j2-=1;
	}
	document.fr1.num_text2.value=j2;
	return j2;
}



/*3번방 버튼*/

/*인원수 */
var j3=0; //인원수 초기화 

function plus3() { //인원수 증가
	j3+=1;
	document.fr1.num_text3.value=j3;
	return j3;
}

function minus3() { //인원수 감소
	if(j3>0){
	j3-=1;
	}
	document.fr1.num_text3.value=j3;
	return j3;
}


