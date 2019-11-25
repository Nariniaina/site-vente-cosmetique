function det(a,b,c,d,e,f,g,h,i) {
	return ((a*e*i)+(b*f*g)+(c*d*h)-(c*e*g)-(b*d*i)-(a*f*h));
}

function H(a){
	if (a=="") {a=0;}
	return a;
}
function resolve() {
	$a11 = parseInt(H(document.getElementById('a11').value));
	$a12 = parseInt(H(document.getElementById('a12').value));
	$a13 = parseInt(H(document.getElementById('a13').value));
	$a21 = parseInt(H(document.getElementById('a21').value));
	$a22 = parseInt(H(document.getElementById('a22').value));
	$a23 = parseInt(H(document.getElementById('a23').value));
	$a31 = parseInt(H(document.getElementById('a31').value));
	$a32 = parseInt(H(document.getElementById('a32').value));
	$a33 = parseInt(H(document.getElementById('a33').value));
	$b1 = parseInt(H(document.getElementById('b1').value));
	$b2 = parseInt(H(document.getElementById('b2').value));
	$b3 = parseInt(H(document.getElementById('b3').value));

	$detA = det($a11,$a12,$a13,$a21,$a22,$a23,$a31,$a32,$a33);
	$xval = det($b1,$a12,$a13,$b2,$a22,$a23,$b3,$a32,$a33)/$detA;
	$yval = det($a11,$b1,$a13,$a21,$b2,$a23,$a31,$b3,$a33)/$detA;
	$zval = det($a11,$a12,$b1,$a21,$a22,$b2,$a31,$a32,$b3)/$detA;

	$x = document.getElementById('x');
	$y = document.getElementById('y');
	$z = document.getElementById('z');

	$x.innerText = "x = "+$xval;
	$y.innerText = "y = "+$yval;
	$z.innerText = "z = "+$zval;
}