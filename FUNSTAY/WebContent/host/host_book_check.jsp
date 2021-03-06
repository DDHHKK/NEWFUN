<%@page import="net.member.db.QnaBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.booking.db.PaymentBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="net.booking.db.BookingBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FunStay</title>

<!-- <!-- 페이지 default 링크 시작 -->
<!-- <link href="./css/default/login.css" rel="stylesheet"> -->
<link href="./css/default/default.css" rel="stylesheet">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<link href="./css/mypage/QnAcheck.css" rel="stylesheet">


<!-- Include CSS for JQuery Frontier Calendar plugin (Required for calendar plugin) -->
<link rel="stylesheet" type="text/css" href="./css/host/cal/jquery-frontier-cal-1.3.2.css" />

<!-- Include CSS for color picker plugin (Not required for calendar plugin. Used for example.) -->
<link rel="stylesheet" type="text/css" href="./css/host/cal/colorpicker.css" />

<!-- Include CSS for JQuery UI (Required for calendar plugin.) -->
<link rel="stylesheet" type="text/css" href="./css/host/cal/smoothness/jquery-ui-1.8.1.custom.css" />

<!--
Include JQuery Core (Required for calendar plugin)
** This is our IE fix version which enables drag-and-drop to work correctly in IE. See README file in js/jquery-core folder. **
-->
<script type="text/javascript" src="./js/host/cal/jquery-core/jquery-1.4.2-ie-fix.min.js"></script>

<!-- Include JQuery UI (Required for calendar plugin.) -->
<script type="text/javascript" src="./js/host/cal/jquery-ui/smoothness/jquery-ui-1.8.1.custom.min.js"></script>

<!-- Include color picker plugin (Not required for calendar plugin. Used for example.) -->
<script type="text/javascript" src="./js/host/cal/colorpicker/colorpicker.js"></script>

<!-- Include jquery tooltip plugin (Not required for calendar plugin. Used for example.) -->
<script type="text/javascript" src="./js/host/cal/jquery-qtip-1.0.0-rc3140944/jquery.qtip-1.0.js"></script>

<!--
	(Required for plugin)
	Dependancies for JQuery Frontier Calendar plugin.
    ** THESE MUST BE INCLUDED BEFORE THE FRONTIER CALENDAR PLUGIN. **
-->
<script type="text/javascript" src="./js/host/cal/lib/jshashtable-2.1.js"></script>

<!-- Include JQuery Frontier Calendar plugin -->
<script type="text/javascript" src="./js/host/cal/frontierCalendar/jquery-frontier-cal-1.3.2.min2.js"></script>

</head>
<body>

<%
MemberDAO md = new MemberDAO();
MemberBean mb = new MemberBean(); 
String email = (String)session.getAttribute("email");
mb=md.getMember(email);

if(email==null){
		    response.sendRedirect("./Main.me");
}
%>



<!-- header  시작-->
<div class="head_dh">
<ul class="header_dh">
<li id="pont1_WS"><a href="./Main.me"><i>FUNSTAY</i></a></li>
<li id="li_2"><input type="text" id="text_1_WS" name="search_info" placeholder="여행하실 지역을 적어주세요">
<input type="button" value="검색" id="btn_1_WS" onclick="abc111()"></li>
</ul>

<ul class="header_dh1">
<li id="li_3"><a href="./HostMain.ho">숙소를 추가해 보세요</a></li>
<li id="li_4"><a href="./FAQ_boardList.fa">FAQ</a></li>

<li id="li_6"><a href="javascript:void(0)" onclick="document.getElementById('light1').style.display='block';document.getElementById('fade1').style.display='block'"><img src="./upload/<%=mb.getProfile_photo()%>" 
	id="img_1_WS" style="border-radius:50%;width:40px;height:40px;"></a>
 <div id="light1" class="white_content_1">
  <div>
  <ul id="list_1_WS">
  	<li id="li_7"><b><%=mb.getEmail()%></b></li>
	<li><a href="./MemberUpdate.me"><b>프로필수정</b></a></li>
	<li><a href="./Booking.bo"><b>예약/결제</b></a></li>
	<li><a href="./MyReserve.bk"><b>나의 예약</b></a></li>
	<li><a href="./Wishlist.wi"><b>찜한숙소</b></a></li>
	<li><a href="./MemberMileage.me"><b>마일리지</b></a></li>
	<li><a href="./MemberQNAlist.me"><b>문의하기</b></a></li>


	<li><a href="./HostPassCheckAction.ho"><b>숙소 관리</b></a></li>
	<li><a href="./HostCash.ho"><b>MY CASH</b></a></li>
	<li><a href="./MemberLogout2.me"><b>로그아웃</b></a></li>

</ul>
</div>
</div>
</ul>


</div>
<hr>

<!-- header  끝-->



<jsp:include page="../include/subpage.jsp"></jsp:include>

<div id="content">
<!-- 페이지내용 시작 -->

<!-- Some CSS for our example. (Not required for calendar plugin. Used for example.)-->
<style type="text/css" media="screen">
/*
Default font-size on the default ThemeRoller theme is set in ems, and with a value that when combined 
with body { font-size: 62.5%; } will align pixels with ems, so 11px=1.1em, 14px=1.4em. If setting the 
body font-size to 62.5% isn't an option, or not one you want, you can set the font-size in ThemeRoller 
to 1em or set it to px.
http://osdir.com/ml/jquery-ui/2009-04/msg00071.html
*/
/* body { font-size: 62.5%; } */
.shadow {
	-moz-box-shadow: 3px 3px 4px #aaaaaa;
	-webkit-box-shadow: 3px 3px 4px #aaaaaa;
	box-shadow: 3px 3px 4px #aaaaaa;
	/* For IE 8 */
	-ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#aaaaaa')";
	/* For IE 5.5 - 7 */
	filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#aaaaaa');
	
	
}
.jFrontierCal {border:1px solid #eee;}

.JFrontierCal {/*border:1px solid blue !important; */}
.JFrontierCal-PrevMonth-Day-Cell {
	width: 14.27% !important;}
.JFrontierCal-Week-Header-Cell{
	width: 14.27% !important;}
.JFrontierCal-Header-Cell{
	width: 14.27% !important;}
.JFrontierCal .JFrontierCal-Header-Cell, .JFrontierCal .JFrontierCal-Header-Cell-Last{
	width: 14.27% !important;}
.JFrontierCal .JFrontierCal-Day-Cell, .JFrontierCal .JFrontierCal-Day-Cell-Last, .JFrontierCal .JFrontierCal-PrevMonth-Day-Cell, .JFrontierCal .JFrontierCal-NextMonth-Day-Cell, .JFrontierCal .JFrontierCal-NextMonth-Day-Cell-Last, .JFrontierCal .JFrontierCal-Day-Cell-Droppable, .JFrontierCal .JFrontierCal-Day-Cell-Today{
	width: 14.27% !important;}
#mycal>div{width:100.1% !important;}

#back_shj{    border-radius: 4%;
    margin-left: 41%;
    padding: 0.5% 2%;
    font-weight: 500;
    color: #666;
    cursor: pointer;
    font-size: 16px;} 
    
.head_dh {
  width:100%;
  height: 100px;
}



h1 {
	/* border: 1px solid black; */
    border-left: 5px solid #cc1d1d;
    padding-left: 7px;
    color: #cc1d1d;
    /* padding: 0px 0; */
    box-sizing: border-box;
    height: 46px;
    /* margin: 3% 0% 1% 30%; */
    margin-bottom:5px;
}



</style>

<script type="text/javascript">



function abc111(){
var search_info = document.getElementById("text_1_WS").value;
location.href='./MemberSearchAction2.me?search_info='+search_info;
return;
}



$(document).mouseup(function (e){
    var container = $('.white_content_1');
    if( container.has(e.target).length === 0){
      container.css('display','none');
    }
  });


var input = document.getElementById("text_1_WS");
input.addEventListener("keyup", function(event) {
  event.preventDefault();
  if (event.keyCode === 13) {
    document.getElementById("btn_1_WS").click();
  }
});




$(document).ready(function(){	

	var clickDate = "";
	var clickAgendaItem = "";
	
	/**
	 * Initializes calendar with current year & month
	 * specifies the callbacks for day click & agenda item click events
	 * then returns instance of plugin object
	 */
	var jfcalplugin = $("#mycal").jFrontierCal({
		date: new Date(),
		dayClickCallback: myDayClickHandler,
		agendaClickCallback: myAgendaClickHandler,
		agendaDropCallback: myAgendaDropHandler,
		agendaMouseoverCallback: myAgendaMouseoverHandler,
		applyAgendaTooltipCallback: myApplyTooltip,
		agendaDragStartCallback : myAgendaDragStart,
		agendaDragStopCallback : myAgendaDragStop,
		dragAndDropEnabled: true
	}).data("plugin");
	
	
/* 	1번결제 방 3개, ㅔ뵤 */
	 <%
	 List<BookingBean> bookinglist = (List)request.getAttribute("bookinglist");
	List<PaymentBean> paymentlist = (List)request.getAttribute("paymentlist");

	for(int i=0;i<bookinglist.size();i++){
		BookingBean bb=(BookingBean)bookinglist.get(i);
		PaymentBean pb = (PaymentBean)paymentlist.get(i);
		Calendar cal_in = Calendar.getInstance();
		cal_in.setTime(bb.getCheck_in());
		Calendar cal_out = Calendar.getInstance();
		cal_out.setTime(bb.getCheck_out());
		
		System.out.println("dddddddddd");
		System.out.println(pb.getPayment_date());

		
	%> 

	var startDateObj = new Date(<%=cal_in.get(Calendar.YEAR )%>,<%=cal_in.get(Calendar.MONTH)%>,<%=cal_in.get(Calendar.DAY_OF_MONTH)%>,12,00,0,0);
	var endDateObj = new Date(<%=cal_out.get(Calendar.YEAR )%>,<%=cal_out.get(Calendar.MONTH)%>,<%=cal_out.get(Calendar.DAY_OF_MONTH)%>,12,00,0,0);
	var what = jQuery.trim($("#email").val());
	var bookingNum = <%=bb.getBooking_num()%>
	jfcalplugin.addAgendaItem(
			"#mycal",
			"예약내역",
			startDateObj,
			endDateObj,	
			false,
			{
		<%
		if(!(pb.getPayment_status().equals("결제취소")))
		{
		%>
		
		부가세 : <%=pb.getFees()%>,
		구매날짜 : "<%=pb.getPayment_date()%>",		
		구매상태 : "<%=pb.getPayment_status()%>",
		체크아웃 : "<%=bb.getCheck_out()%>",
		체크인 : "<%=bb.getCheck_in()%>",
		호스트email :"<%=pb.getHost_email()%>",
		구매번호: "<%=bb.getPayment_num()%>",
		인원수:<%=bb.getPeople()%>+"명",
		합계: <%=pb.getSum_price()%>,
		예약날짜: "<%=bb.getBooking_date()%>",
		 예약상태: "<%=bb.getBooking_status()%>",
		 구매자email:"<%=pb.getMember_email()%>",
		<%
		}
		%>
				

		
				/* 		호스트아이디 pb.payment
				체크인 bb.checkin
				체크아웃 bb.checkout
				구매상태 pb.payment_status
				구매날짜 pb.payment_date
				부가세pb.fees */
				 
			},
			{
				backgroundColor: "#666",//배경색
				foregroundColor: "#fff" //글자색
				
			}
		);
	
	<%
	}
	%>
	var calDate = jfcalplugin.getCurrentDate("#mycal");
	/**
	 * Do something when dragging starts on agenda div
	 */
	function myAgendaDragStart(eventObj,divElm,agendaItem){
		// destroy our qtip tooltip
		if(divElm.data("qtip")){
			divElm.qtip("destroy");
		}	
	};
	
	/**
	 * Do something when dragging stops on agenda div
	 */
	function myAgendaDragStop(eventObj,divElm,agendaItem){
		//alert("drag stop");
	};
	
	/**
	 * Custom tooltip - use any tooltip library you want to display the agenda data.
	 * for this example we use qTip - http://craigsworks.com/projects/qtip/
	 *
	 * @param divElm - jquery object for agenda div element
	 * @param agendaItem - javascript object containing agenda data.
	 */
	function myApplyTooltip(divElm,agendaItem){

		// Destroy currrent tooltip if present
		if(divElm.data("qtip")){
			divElm.qtip("destroy");
		}
		
		var displayData = "";
		var displayData2 ="";
		
		var title = agendaItem.title;
		var startDate = agendaItem.startDate;
		var endDate = agendaItem.endDate;
		var allDay = agendaItem.allDay;
		var data = agendaItem.data;
		displayData += "<br><b>" + title+ "</b><br><br>";
		if(allDay){
			displayData += "(All day event)<br><br>";
		}/* else{
			displayData += "<b>Starts:</b> " + startDate + "<br>" + "<b>Ends:</b> " + endDate + "<br><br>";
		} */
		for (var propertyName in data) {
			displayData += "<b>" + propertyName + ":</b> " + data[propertyName] + "<br>"
		}
		
		displayData2 += "<br><b>" + title+ "</b><br><br>";
		if(allDay){
			displayData2 += "(All day event)<br><br>";
		}/* else{
			displayData += "<b>Starts:</b> " + startDate + "<br>" + "<b>Ends:</b> " + endDate + "<br><br>";
		} */
		for (var propertyName in data) {
			if(propertyName=="호스트email"){break;}
			displayData2 += "<b>" + propertyName + ":</b> " + data[propertyName] + "<br>"
		}
		// use the user specified colors from the agenda item.
		var backgroundColor = agendaItem.displayProp.backgroundColor;
		var foregroundColor = agendaItem.displayProp.foregroundColor;
		var myStyle = {
			border: {
				width: 5,
				radius: 10
				
			},
			padding: 10, 
			textAlign: "left",
			tip: true,
			name: "dark" // other style properties are inherited from dark theme		
		};
		if(backgroundColor != null && backgroundColor != ""){
			myStyle["backgroundColor"] = backgroundColor;
		}
		if(foregroundColor != null && foregroundColor != ""){
			myStyle["color"] = foregroundColor;
		}
		// apply tooltip
		divElm.qtip({
			content: displayData2,
			position: {
				corner: {
					tooltip: "bottomMiddle",
					target: "topMiddle"			
				},
				adjust: { 
					mouse: true,
					x: 0,
					y: -15
				},
				target: "mouse"
			},
			show: { 
				when: { 
					event: 'mouseover'
				}
			},
			style: myStyle
		});

	};

	/**
	 * Make the day cells roughly 3/4th as tall as they are wide. this makes our calendar wider than it is tall. 
	 */
	jfcalplugin.setAspectRatio("#mycal",0.75);

	/**
	 * Called when user clicks day cell
	 * use reference to plugin object to add agenda item
	 */
	function myDayClickHandler(eventObj){
		// Get the Date of the day that was clicked from the event object
		var date = eventObj.data.calDayDate;
		// store date in our global js variable for access later
		clickDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
		// open our add event dialog
		$('#add-event-form').dialog('open');
	};
	
	/**
	 * Called when user clicks and agenda item
	 * use reference to plugin object to edit agenda item
	 */
	function myAgendaClickHandler(eventObj){
		// Get ID of the agenda item from the event object
		var agendaId = eventObj.data.agendaId;		
		// pull agenda item from calendar
		var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);
		clickAgendaItem = agendaItem;
		$("#display-event-form").dialog('open');
	};
	
	/**
	 * Called when user drops an agenda item into a day cell.
	 */
	function myAgendaDropHandler(eventObj){
		// Get ID of the agenda item from the event object
		var agendaId = eventObj.data.agendaId;
		// date agenda item was dropped onto
		var date = eventObj.data.calDayDate;
		// Pull agenda item from calendar
		var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);		
		alert("You dropped agenda item " + agendaItem.title + 
			" onto " + date.toString() + ". Here is where you can make an AJAX call to update your database.");
	};
	
	/**
	 * Called when a user mouses over an agenda item	
	 */
	function myAgendaMouseoverHandler(eventObj){
		var agendaId = eventObj.data.agendaId;
		var agendaItem = jfcalplugin.getAgendaItemById("#mycal",agendaId);
		//alert("You moused over agenda item " + agendaItem.title + " at location (X=" + eventObj.pageX + ", Y=" + eventObj.pageY + ")");
	};
	/**
	 * Initialize jquery ui datepicker. set date format to yyyy-mm-dd for easy parsing
	 */
	$("#dateSelect").datepicker({
		showOtherMonths: true,
		selectOtherMonths: true,
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'yy-mm-dd'
	});
	
	/**
	 * Set datepicker to current date
	 */
	$("#dateSelect").datepicker('setDate', new Date());
	/**
	 * Use reference to plugin object to a specific year/month
	 */
	$("#dateSelect").bind('change', function() {
		var selectedDate = $("#dateSelect").val();
		var dtArray = selectedDate.split("-");
		var year = dtArray[0];
		// jquery datepicker months start at 1 (1=January)		
		var month = dtArray[1];
		// strip any preceeding 0's		
		month = month.replace(/^[0]+/g,"")		
		var day = dtArray[2];
		// plugin uses 0-based months so we subtrac 1
		jfcalplugin.showMonth("#mycal",year,parseInt(month-1).toString());
	});	
	/**
	 * Initialize previous month button
	 */
	$("#BtnPreviousMonth").button();
	$("#BtnPreviousMonth").click(function() {
		jfcalplugin.showPreviousMonth("#mycal");
		// update the jqeury datepicker value
		var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
		var cyear = calDate.getFullYear();
		// Date month 0-based (0=January)
		var cmonth = calDate.getMonth();
		var cday = calDate.getDate();
		$('#monthbox_shj').html(cyear+"."+(cmonth+1));
		// jquery datepicker month starts at 1 (1=January) so we add 1
		$("#dateSelect").datepicker("setDate",cyear+"-"+(cmonth+1)+"-"+cday);
		return false;
	});
	/**1491.220
	 * Initialize next month button
	 */
	$("#BtnNextMonth").button();
	$("#BtnNextMonth").click(function() {
		jfcalplugin.showNextMonth("#mycal");
		// update the jqeury datepicker value
		var calDate = jfcalplugin.getCurrentDate("#mycal"); // returns Date object
		var cyear = calDate.getFullYear();
		// Date month 0-based (0=January)
		var cmonth = calDate.getMonth();
		var cday = calDate.getDate();
		$('#monthbox_shj').html(cyear+"."+(cmonth+1));
		// jquery datepicker month starts at 1 (1=January) so we add 1
		$("#dateSelect").datepicker("setDate",cyear+"-"+(cmonth+1)+"-"+cday);		
		return false;
	});
	



	/**
	 * Initialize add event modal form
	 */
	$("#add-event-form").dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		buttons: {
			'Add Event': function() {

				var what = jQuery.trim($("#what").val());
			
				if(what == ""){
					alert("Please enter a short event description into the \"what\" field.");
				}else{
				
				
				

					$(this).dialog('close');
					var calDate = jfcalplugin.getCurrentDate("#mycal");
					alert(calDate);
					
				}
				
			},
			Cancel: function() {
				$(this).dialog('close');
			}
		},
		open: function(event, ui){
			// initialize start date picker
			$("#startDate").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true,
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: 'yy-mm-dd'
			});
			// initialize end date picker
			$("#endDate").datepicker({
				showOtherMonths: true,
				selectOtherMonths: true,
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: 'yy-mm-dd'
			});
			// initialize with the date that was clicked
			$("#startDate").val(clickDate);
			$("#endDate").val(clickDate);
			// initialize color pickers
			$("#colorSelectorBackground").ColorPicker({
				color: "#333333",
				onShow: function (colpkr) {
					$(colpkr).css("z-index","10000");
					$(colpkr).fadeIn(500);
					return false;
				},
				onHide: function (colpkr) {
					$(colpkr).fadeOut(500);
					return false;
				},
				onChange: function (hsb, hex, rgb) {
					$("#colorSelectorBackground div").css("backgroundColor", "#" + hex);
					$("#colorBackground").val("#" + hex);
				}
			});
			//$("#colorBackground").val("#1040b0");		
			$("#colorSelectorForeground").ColorPicker({
				color: "#ffffff",
				onShow: function (colpkr) {
					$(colpkr).css("z-index","10000");
					$(colpkr).fadeIn(500);
					return false;
				},
				onHide: function (colpkr) {
					$(colpkr).fadeOut(500);
					return false;
				},
				onChange: function (hsb, hex, rgb) {
					$("#colorSelectorForeground div").css("backgroundColor", "#" + hex);
					$("#colorForeground").val("#" + hex);
				}
			});
			//$("#colorForeground").val("#ffffff");				
			// put focus on first form input element
			$("#what").focus();
		},
		close: function() {
			// reset form elements when we close so they are fresh when the dialog is opened again.
			$("#startDate").datepicker("destroy");
			$("#endDate").datepicker("destroy");
			$("#startDate").val("");
			$("#endDate").val("");
			$("#startHour option:eq(0)").attr("selected", "selected");
			$("#startMin option:eq(0)").attr("selected", "selected");
			$("#startMeridiem option:eq(0)").attr("selected", "selected");
			$("#endHour option:eq(0)").attr("selected", "selected");
			$("#endMin option:eq(0)").attr("selected", "selected");
			$("#endMeridiem option:eq(0)").attr("selected", "selected");			
			$("#what").val("");
			//$("#colorBackground").val("#1040b0");
			//$("#colorForeground").val("#ffffff");
		}
	});
	

	/**
	 * Initialize display event form.
	 */
	$("#display-event-form").dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		buttons: {		
			Cancel: function() {
				$(this).dialog('close');
			},
			'Edit': function() {
				alert("Make your own edit screen or dialog!");
			}			
		},
		
		open: function(event, ui){
			if(clickAgendaItem != null){
				var title = clickAgendaItem.title;
				var startDate = clickAgendaItem.startDate;
				var endDate = clickAgendaItem.endDate;
				var allDay = clickAgendaItem.allDay;
				var data = clickAgendaItem.data;
	
				// in our example add agenda modal form we put some fake data in the agenda data. we can retrieve it here.
				$("#display-event-form").append(
					"<br><b>" + title+ "</b><br><br>"		
				);			
			
				for (var propertyName in data) {		
					$("#display-event-form").append("<b>" + propertyName + ":</b> " + data[propertyName] + "<br>");
					if(propertyName =="구매번호"){ $("#display-event-form").append("<br>");}
					}

			

		

				
		
		
		}
		},
				
		close: function() {
			// clear agenda data
			$("#display-event-form").html("");
			
		}
	});	 
	

	$('#monthbox_shj').html(function(){
		var month = jfcalplugin.getCurrentDate("#mycal").getMonth() +1;
		var year = jfcalplugin.getCurrentDate("#mycal").getFullYear();
		return year+"."+month;
	});
	/**
	 * Initialize our tabs
	 */
	$("#tabs").tabs({
		/*
		 * Our calendar is initialized in a closed tab so we need to resize it when the example tab opens.
		 */
		show: function(event, ui){
			if(ui.index == 1){
				jfcalplugin.doResize("#mycal");
				
			}
		}	
	});
	
});



</script>


		

	
	<div id="tabs-2">
	
		<h1>예약 관리</h1>

		<div id="example">

		<!--
		You can use pixel widths or percentages. Calendar will auto resize all sub elements.
		Height will be calculated by aspect ratio. Basically all day cells will be as tall
		as they are wide.
		-->
		
		<div id="toolbar" class="ui-widget-header ui-corner-all" style="padding:3px; vertical-align: middle; white-space:nowrap; overflow: hidden; height: 120px;">
			<button id="BtnPreviousMonth" style="bottom: -55px; left: 10px;">◀</button>
		
				<div id="monthbox_shj" ></div>
			<!-- <button id="back_shj" onclick="location.href='MemberUpdate.me'">Back</button> -->
		
				<button id="BtnNextMonth">▶</button>
		</div>
		
	
		<div id="mycal"></div>

		</div>

		<!-- debugging-->
		<div id="calDebug"></div>

		<!-- Add event modal form -->
		<style type="text/css">
			//label, input.text, select { display:block; }
			fieldset { padding:0; border:0; margin-top:25px; }
			.ui-dialog .ui-state-error { padding: .3em; }
			.validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
		
		
		<div id="display-event-form" title="">
			
		</div>		

		<p>&nbsp;</p>

	</div><!-- end example tab -->
<input type="hidden" value="dd" name="email">

<!-- 문의 글 관리 -->

<div class="QnAcheckList_sg">
	<table class="QnAcheck_table_sg" border="1" style="width: 100%;">
	<tr>
		<td class="qnaheadtd_sg">번호</td>
		<td class="qnaheadtd_sg">제목</td>
		<td class="qnaheadtd_sg">등록일</td>
		<td class="qnaheadtd_sg">답변여부</td>
	</tr>
<%
List<QnaBean> q_list = (List)request.getAttribute("q_list");
for(int i=0;i<q_list.size();i++){
	QnaBean qb = (QnaBean)q_list.get(i);
%>
	<tr>
		<td><%=qb.getQnA_num() %></td>
		<td class="qnaopensub">
			<a href="./MemberQNAcontent.ho?QnA_num=<%=qb.getQnA_num()%>&re_ref=<%=qb.getRe_ref()%>">
				<%-- <%if(qb.getRe_seq()%2==1){%>[답변]<%}else{%>[문의]<%}%> --%>
				<%=qb.getSubject() %>
			</a>
		</td>
		<td><%=qb.getQnA_date() %></td>
		<td>
			<%if(qb.getRe_lev()==1){%>
			답변완료
			<%}
			else{
			%>
			답변중
			<%}%>
		</td>
	</tr>
<%} %>
	</table>


<div>



<p>&nbsp;</p>

<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>
