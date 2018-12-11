// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

/*password visibility*/
function myFunction() {
	var x = document.getElementById("myInput1");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}

/*caps lock*/
var input = document.getElementById("myInput");
var text = document.getElementById("text");
input.addEventListener("keyup", function(event) {

if (event.getModifierState("CapsLock")) {
    text.style.display = "block";
  } else {
    text.style.display = "none"
  }
});

/*datepicker*/
$( function() {
    $( "#datepicker1" ).datepicker();
  } );
$( function() {
    $( "#datepicker2" ).datepicker();
  } );