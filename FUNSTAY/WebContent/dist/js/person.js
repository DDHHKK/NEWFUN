
/*인원수*/
var i=0; // 유아 인원수 초기화 
var j=0; // 청소년 인원수 초기화 
function add1() {  //어린이 인원수 증가
	i+=1;
	document.fff.text11.value=i;
	return i;
}

function add2() { //성인 인원수 증가
	j+=1;
	document.fff.text12.value=j;
	return j;
}

function cid1() { //어린이 인원수 감소
	if(i>0){
	i-=1;
	}
	document.fff.text11.value=i;
	return i;
}

function cid2() { //성인 인원수 감소
	if(j>0){
	j-=1;
	}
	document.fff.text12.value=j;
	return j;
}

function choice() {   //인원수  확인 버튼 누르면 text창에  값이 표현이 된다.
	if(document.fff.text11.value=="" && document.fff.text12.value=="")
		document.fff.text1.value="선택하세요";
	if(document.fff.text11.value=="" && document.fff.text12.value!="")
		document.fff.text1.value="어린이"+j+"명";
	if(document.fff.text11.value!="" && document.fff.text12.value=="")
		document.fff.text1.value="성인"+i+"명"; 
	if(document.fff.text11.value!="" && document.fff.text12.value!="")
		document.fff.text1.value="성인"+i+"명" + " " + "어린이"+j+"명"; 
}

/*인원 텍스트창을 클릭하면 스크롤바가 내려온다*/
$(document).ready(function(){
    $("#textsize_1").click(function(){
        $("#form_1").slideToggle("slow");
    });
});

/*확인 버튼을 누르면 스크롤바가 닫힌다*/
$(document).ready(function(){
    $("#btn").click(function(){
        $("#form_1").slideToggle("slow");
    });
});

/*랜덤으로 나올 사진들 배열에 넣음*/
var imgUrls = new Array();
imgUrls.push( "img/담양1.png" );
imgUrls.push( "img/벌교1.png" );
imgUrls.push( "img/부산1.png" );
imgUrls.push( "img/속초1.png" );

document.write( "<img src='" + imgUrls[ Math.floor( Math.random() * 4) ] + "' width=400 height=400>"); //랜덤으로 난수발생하여 배열에사진하나를출력
document.write( "<img src='" + imgUrls[ Math.floor( Math.random() * 4) ] + "' width=400 height=400>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
document.write( "<img src='" + imgUrls[ Math.floor( Math.random() * 4) ] + "' width=400 height=400>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
document.write( "<img src='" + imgUrls[ Math.floor( Math.random() * 4) ] + "' width=400 height=400>" ); //랜덤으로 난수발생하여 배열에사진하나를출력
