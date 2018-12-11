
<%@page import="net.wishlist.db.WishlistBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->


<link href="./css/default/hSubPage.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/myinfo/mywish_wishlist_shj.css" rel="stylesheet">
<link href="./css/member_mypage/message_list.css" rel="stylesheet">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<style type="text/css">
.content_top_shj html, body, .content_top_shj div, dl, dt, dd,.content_top_shj ul, ol,.content_top_shj li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend,.content_top_shj input, textarea, button, p, blockquote, th, td { margin:0; padding:0;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); }
.content_top_shj html { width:100%; height:100%; }
.content_top_shj body, code { min-width:320px; font-size:13px; line-height:1.2em; color:#1b1b1b; background:#fff; -webkit-text-size-adjust:none;height:100%; }
.content_top_shj html, body{height:100%;}
.content_top_shj code { background:none; display:block; }
.content_top_shj ul li { list-style:none; }
.content_top_shj li { list-style:none; }
.content_top_shj ol { list-style-position:inside; }
.content_top_shj img, fieldset{ border:none; }
.content_top_shj img { vertical-align:middle; }
.content_top_shj hr.layout { display:none; }
.content_top_shj em, address { font-style:normal; }
.content_top_shj ins { text-decoration:none; }
.content_top_shj a { text-decoration:none; color:#000; }
.content_top_shj a:active { text-decoration:none; }
.content_top_shj table { width:100%; table-layout:fixed; border:0 none; border-spacing:0; border-collapse:collapse; }
.content_top_shj table caption { display:none; }
.content_top_shj th, .content_top_shj td { border:0; line-height:18px; }
.content_top_shj legend { height:0; width:0; display:block; text-indent:-9999em; }
.content_top_shj label { cursor:pointer; }

/* html5 */
object, del, sub, var { margin:0; padding:0; }
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }

/* form */
#wishlistForm_hj input[type=text], input[type=password], input[type=number], input[type=tel], textarea {
    padding:7px; font-weight:inherit; border:1px solid #cccccc; border-radius:2px; outline-style:none; line-height:13px; color:#353535;
    -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box;
}
#wishlistForm_hj input[type="file"] { overflow:hidden; max-width:100%; }
#wishlistForm_hj input[type=text], input[type=password], input[type=number], input[type=tel] { height:29px; }
#wishlistForm_hj textarea,#wishlistForm_hj input, select { vertical-align:middle; }
#wishlistForm_hj textarea { resize:none; line-height:1.2em; }
#wishlistForm_hj input[type="button"],#wishlistForm_hj  input[type="text"], input[type="password"], input[type="tel"], input[type="image"], textarea { -webkit-appearance:none; }
#wishlistForm_hj input:checked[type="checkbox"] { background-color:#fff; -webkit-appearance:checkbox; }
#wishlistForm_hj button::-moz-focus-inner { padding:0; border:0; }
#wishlistForm_hj label { margin:0; display:inline-block; min-height:29px; line-height:29px; vertical-align:middle; }
#wishlistForm_hj input[type="radio"],
#wishlistForm_hj input[type="checkbox"] { margin:0 7px 0 0; }
#wishlistForm_hj textarea.disabled { background-color:#ffffff; color:#bfbfbf; }


</style>
<script type="text/javascript" src="./js/myinfo/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="./js/myinfo/wishlist_shj.js"></script>

</head>
<body>
<!-- 헤더  -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더  -->
<hr>
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div> <!-- 인클루드 에러 때문에 넣었음.나중에 지우기 -->
<div id="content">
<!-- 여기서부터 페이지 내용을 적어주세요. -->

<div class="content_top_shj">
<h1 style="float:left;margin:2% 2% 2% 3%;">목록</h1><br><br>
<!-- 변수값:1 --> 

<%

String member_email = (String)session.getAttribute("email");
String list_photo = "No_Image_Available.gif";

 int listcount = ((Integer)request.getAttribute("listcount")).intValue();  


 /* Wishlist.java */
 List Wishlist = (List)request.getAttribute("Wishlist");






%> 

<h3 style="position: relative;
    float: left;
    right: 10%;
    padding: 5% 2% 0 2%;"> <%=listcount %> 개의 리스트</h3>
<!--정렬  -->
<div id="sect_HJ">
<div style="float:right;width: auto;" id="listmenu_shj">
<ul style="" >
   <li class='active has-sub_shj' id="manlist"><a href='#'><span>목록 지우기</span></a>
      <ul>
      <%
      for(int i=0;i<Wishlist.size();i++){
    	 	WishlistBean wb=(WishlistBean)Wishlist.get(i);
      %>
         <li class='has-sub'><a href='./DeleteWishlist.wi?member_email=<%=wb.getMember_email()%>&wishlist_num=<%=wb.getWishlist_num()%>'><span><%=wb.getList_name() %></span></a>       
         </li>
      <%
     	 }
      %>
      </ul>
   </li>
</ul>
</div>
<div style=" float:left;width: auto;"  id="listmenu_shj">
<ul style="width: 100%;" >
	<!-- 변수값:My wish -->
   <li class='active has-sub_shj' id="Addlist" >
   <div><a href="#loginmodal_shj" class="flatbtn_shj" id="modaltrigger_shj">목록 만들기</a></div>
   </li>
</ul>
</div>
<div id="loginmodal_shj" style="display:none;">
	<h2 >목록 만들기</h2>



	<form action="./AddWishlist.wi" method="post" id="wishlistForm_hj" enctype="multipart/form-data">
	<input type="text" name="list_name" id="list_name" size='23' ></input>
	<input type="hidden" name="member_email" id="member_email" value=<%=member_email%>>
	<input type="hidden" name="list_photo" id="list_photo" value=<%=list_photo%>>
	<input type="submit" value="만들기" class="btn_login"></input>
	</form>
	
<!-- 	<div class="login_line">
		<div class="box_in">
		<input type="text" name="id" id="id" size="23">
		<input type="text" name="pw" id="pw" size="23">
		</div>
		
		
		
		<span class="btn_login"><a href="">LOGIN</a></span>
	</div>
	<div class="find_join"><a href="">아이디 / 비밀번호 찾기</a> | <a href="">회원가입</a></div> -->
</div>

<!--모달윈도우부분-->
<script type="text/javascript">
$(function(){
 /*  $('#loginform').submit(function(e){
    return false;
  }); */
  
  $('#modaltrigger_shj').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>


</div>
<!-- <h2>리스트 이름</h2> -->
</div>



  <div class="content_bottom_shj">
<%

/* Wishlist.java */


for(int i=0;i<Wishlist.size();i++){
	WishlistBean wb=(WishlistBean)Wishlist.get(i);

%> 

<a href="./MyWish.wi?wishlist_num=<%=wb.getWishlist_num()%>">
<div id="list_shj" >
	<img src="./img/<%=wb.getList_photo()%>"><div id="explain_shj"><%=wb.getList_name()%></div>
</div>
</a>	
	

<%
} 
%> 

  </div> 
<div class="clear"></div>
<!-- 페이지 내용이 끝나는 부분입니다. -->
</div>
</div>
</div><!-- subpage include 파일에서 나온 div 닫기 태그 -->



<div class="clear"></div>
<hr>
<!-- footer -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer -->
</body>
</html>