<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(function() {
	$('.select_btn').click(function(){
		var rooms = $('.select_rooms').val();
		

		for(var j=5; j>rooms; j--){
			$('.room'+(j+1)+'_single').val('싱글침대 개수를 선택하세요');
			$('.room'+(j+1)+'_double').val('더블침대 개수를 선택하세요');
			$('.room'+(j+1)+'_bunk').val('이층침대 개수를 선택하세요');
			$('.room'+j+'').css({
				"display":"none"
			});
		}
		alert($('.room3_single').val());
		for(var i=0; i<=rooms; i++){
			$('.room'+(i+1)+'').css({
				"display":"block"
			});
		}
		
	});
});
</script>
<body>


<select class="select_rooms">
	<option>방 개수 선택</option>
	<option value="0">1</option>
	<option value="1">2</option>
	<option value="2">3</option>
	<option value="3">4</option>
	<option value="3">4</option>
	<option value="3">4</option>
	<option value="3">4</option>
	<option value="9">10</option>
</select>
<button class="select_btn">선택하기</button>

<table class="room1" border="1" style="display:none;">
<tr>
	<td class="td1">
		<b>방 1</b>
	</td>
	<td class="td">
		<img src="./img/icon/single_bed-512.png" width="30px">
		<select class="room1_single">
		<option selected>싱글침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		</select><br>
       			
		<img src="./img/icon/icon_bed__45215.png" width="30px">
		<select class="room1_double">
		<option selected>더블침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		</select><br>
       			
		<img src="./img/icon/3365-200.png" width="30px">
		<select class="room1_bunk">
		<option selected>이층침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		</select>
	</td>
	<td class="td1">
		<input type="number" value="2" name="num_text1">
		<input type="button" name="del_room" value="X" id="del_btn">
	</td>
</tr>
</table>

<table class="room2" border="1" style="display:none;">
<tr>
	<td class="td1">
		<b>방 2</b>
	</td>
	<td class="td">
		<img src="./img/icon/single_bed-512.png" width="30px">
		<select class="room2_single">
		<option selected>싱글침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		</select><br>
       			
		<img src="./img/icon/icon_bed__45215.png" width="30px">
		<select class="room2_double">
		<option selected>더블침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		</select><br>
       			
		<img src="./img/icon/3365-200.png" width="30px">
		<select class="room2_bunk">
		<option selected>이층침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		</select>
	</td>
	<td class="td1">
		<input type="number" value="2" name="num_text1">
		<input type="button" name="del_room" value="X" id="del_btn">
	</td>
</tr>
</table>

<table class="room3" border="1" style="display:none;">
<tr>
	<td class="td1">
		<b>방 3</b>
	</td>
	<td class="td">
		<img src="./img/icon/single_bed-512.png" width="30px">
		<select class="room3_single">
		<option selected>싱글침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		</select><br>
       			
		<img src="./img/icon/icon_bed__45215.png" width="30px">
		<select class="room3_double">
		<option selected>더블침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		</select><br>
       			
		<img src="./img/icon/3365-200.png" width="30px">
		<select class="room3_bunk">
		<option selected>이층침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		</select>
	</td>
	<td class="td1">
		<input type="number" value="2" name="num_text1">
		<input type="button" name="del_room" value="X" id="del_btn">
	</td>
</tr>
</table>

<table class="room4" border="1" style="display:none;">
<tr>
	<td class="td1">
		<b>방 4</b>
	</td>
	<td class="td">
		<img src="./img/icon/single_bed-512.png" width="30px">
		<select class="room4_single">
		<option selected>싱글침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		</select><br>
       			
		<img src="./img/icon/icon_bed__45215.png" width="30px">
		<select class="room4_double">
		<option selected>더블침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		</select><br>
       			
		<img src="./img/icon/3365-200.png" width="30px">
		<select class="room4_bunk">
		<option selected>이층침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		</select>
	</td>
	<td class="td1">
		<input type="number" value="2" name="num_text1">
		<input type="button" name="del_room" value="X" id="del_btn">
	</td>
</tr>
</table>

<table class="room5" border="1" style="display:none;">
<tr>
	<td class="td1">
		<b>방 5</b>
	</td>
	<td class="td">
		<img src="./img/icon/single_bed-512.png" width="30px">
		<select class="room5_single">
		<option selected>싱글침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		</select><br>
       			
		<img src="./img/icon/icon_bed__45215.png" width="30px">
		<select class="room5_double">
		<option selected>더블침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		</select><br>
       			
		<img src="./img/icon/3365-200.png" width="30px">
		<select class="room5_bunk">
		<option selected>이층침대 개수를 선택하세요</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		</select>
	</td>
	<td class="td1">
		<input type="number" value="2" name="num_text1">
		<input type="button" name="del_room" value="X" id="del_btn">
	</td>
</tr>
</table>


</body>
</html>