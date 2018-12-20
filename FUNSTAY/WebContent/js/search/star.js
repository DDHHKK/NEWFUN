
var locked=0;
function show(star)
{
	
	if (locked) {return;}
	
	var i;
	var image;
	var el;
	var e = document.getElementById('startext');
	var stateMsg;

	for( i=1; i<=star; i++)
		{
		image = 'image'+i;
		el = document.getElementById(image);
		el.innerHTML = 'star';
	
		}
	}
	
function noshow(star)
{
	if (locked){ return;}
	
	var i;
	var image;
	var el;
	
	for(i=1; i<=star; i++)
	{
		image = 'image'+i;
		el = document.getElementById(image);
		el.innerHTML = 'star_border';
	}
}

function lock (star)
{
	show(star);
	locked=1;
}

function unlock (star)
{
	
	locked=0;
}

function mark(star)
{
	unlock(5)
	noshow(5);
	
	show(star)
	
	$('.star_shj').attr("value",star);
}

