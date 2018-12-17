
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
	if(document.fff.text11.value!="" && document.fff.text12.value!="") {
		document.fff.text00.value=i+j;
		var people = i+j
		document.fff.text1.value="성인"+i+"명" + " " + "어린이"+j+"명"; 
		var price = document.fff.price11.value;
		var days = document.fff.days00.value;
		document.fff.price00.value=price*people*days;
		
	}
	//if(document.fff.text11.value!="" && document.fff.text12.value!="")
		//document.fff.text00.value=i+j;
}

/*인원 텍스트창을 클릭하면 스크롤바가 내려온다*/
$(document).ready(function(){
    $("#textsize_1").click(function(){
        $("#form_1").slideToggle("slow");
    });
});

/*확인 버튼을 누르면 스크롤바가 닫힌다*/
//var strDate1 = "2015-5-6";
//var strDate2 = "2015-6-25";
//var arr1 = strDate1.split('-');
//var arr2 = strDate2.split('-');
//var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
//var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

$(document).ready(function(){
	//$("#textcss1").val()+$("#textcss2").val()
	var strDate1;
	var dat1;
    $("#btn").click(function(){
        $("#form_1").slideToggle("slow");
        //alert("gkgkgk");
        //$(this).append('<intput type="text" value="'+$("#textcss1").val()+$("#textcss2").val()+'" name="sel_people">');
    });
    
    $(".datepicker--cell").click(function(){
    	alert("호호");
    	/*if($(".check_in").val!=null){
    		strDate1 = $(".check_in").val;
    		var arr1 = strDate1.split('-');
    		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
    		alert(arr1[2]);
    	}if($(".check_out").val!=null){
    		strDate2 = $(".check_out").val;
    		var arr2 = strDate2.split('-');
    		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
    		alert(arr2[2]);
    	}*/
    });
});
