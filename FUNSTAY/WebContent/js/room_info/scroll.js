
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
		document.fff.select_people.value=i+j;
		document.fff.text1.value="성인"+i+"명" + " " + "어린이"+j+"명"; 
		var price = document.fff.price11.value;
		var days = document.fff.days00.value;
		var per_price = price*people;
		document.fff.price00.value=price*people;
		document.fff.price22.value=price*people;
		
	}
}

/*인원 텍스트창을 클릭하면 스크롤바가 내려온다*/
$(document).ready(function(){
    $("#textsize_1").click(function(){
        $("#form_1").slideToggle("slow");
    });
});

/*두 날짜간 차이 계산하는 함수*/
function dateDiff(date1, date2) {
	var diffDate_1 = new Date(date1);
	var diffDate_2 = new Date(date2);
	diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}

$(document).ready(function(){
	//$("#textcss1").val()+$("#textcss2").val()
	var strDate1;
	var dat1;
	/*확인 버튼을 누르면 스크롤바가 닫힌다*/
    $("#btn").click(function(){
        $("#form_1").slideToggle("slow");
        //alert("gkgkgk");
        //$(this).append('<intput type="text" value="'+$("#textcss1").val()+$("#textcss2").val()+'" name="sel_people">');
    });
    
    /*가격 조회 버튼*/
    var date = new Date();
    var begin;
    var end;
    var cal_date;
    var add_people;
    var add_price;
    var show_add_price;
    var per_price;
    var fees;
    var sum_price;
    $("#search_price").click(function(){
    	begin=$('#check_in').val();
    	end= $("#check_out").val();
    	alert(dateDiff(end,begin));
    	if($('.select_people').val()>$('.basic_people').val()){
    		add_people=$('.select_people').val()-$('.basic_people').val();
    		add_price = 10000*add_people;
    		show_add_price = "10000x"+add_people;
    		alert("만원 곱하기 초과 인원"+add_price);
    	}else {
    		alert("초관인원 없음")
    		add_price=0;
    		show_add_price = "0";
    	}
    	cal_date=dateDiff(end,begin);
    	$('.days00').val(cal_date);
    	per_price = document.fff.price22.value;
    	cal_price=document.fff.price22.value*cal_date;
    	document.fff.price00.value=cal_price;
    	fees = ((per_price*cal_date)+(add_price))/10;
    	sum_price = (per_price*cal_date)+add_price+fees;
    	$('.sum_price123').html("+기본요금 ₩"+per_price+"x"+cal_date+"일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>> "+per_price*cal_date+"<br>+추가요금 ₩"+add_price+"<br>+수수료 ₩"+fees+"<hr><span style='float:right;'>합계 ₩"+sum_price+"</span>");
    });
    
    // 예약하기 버튼 제어
    $('.reserve_btn1_sg').click(function() {
		if(document.fff.text00.value==0){
			alert("예약 인원을 선택해주세요.");
			return false;
		}if($('#check_in').val()=="" || $('#check_out').val()==""){
			alert("예약 날짜를 선택해주세요.");
			return false;
		}
		begin=$('#check_in').val();
    	end= $("#check_out").val();
    	alert(dateDiff(end,begin));
    	cal_date=dateDiff(end,begin);
    	$('.days00').val(cal_date);
		/*var a = document.fff.text00.value;
		var b = document.fff.R_max_people.value
		if(a<b){
			alert("예약가능 최대인원을 초과 하셨습니다. 최대인원 : "+document.fff.R_max_people.value+"선택인원 : "+document.fff.text00.value);
			return false;
		}*/
	});
    

});
