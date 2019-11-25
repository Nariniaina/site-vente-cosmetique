function ver() {
	var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
	var days = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];

	function faran(mois,ans){
		var b = "no";
		for (var i = 2012; i < 2396; i+=4) {
			if (ans==i) {b="yes";}
		}
		if (mois==1) {
			if (b=="yes"){return 29;}
			else {return 28;}
		}
		else if (mois==3 || mois==5 || mois==8 || mois==10 || mois==11) {return 30;}
		else {return 31;}
	}

	function verif(date,month,year){
		var far = faran(month,year);
		if (date<=0) {
			month-=1;
			date=far-date;
		}

		if (far<date){
			month+=1;
			date-=far;
		}
		if (month>11) {year+=1;month-=12}
		return (days[date-1]+" "+months[month]+" "+year);
	}

	var De = new Date(document.getElementById('der').value);
	var Cy = parseInt(document.getElementById('duree').value);
	var DateE=De.getDate();
	var MonthE=De.getMonth();
	var YearE=De.getFullYear();
	var O = document.getElementById('O');
	var F = document.getElementById('F');
	var ovulation = (DateE-1)+(Cy-14);
	var Favant = ovulation-2;
	var Fapres = ovulation+2;
	O.innerText ="Date d'ovulation : " + verif(ovulation,MonthE,YearE);
	F.innerText ="Jours fertiles : entre ( "+verif(Favant,MonthE,YearE)+" et "+verif(Fapres,MonthE,YearE)+" )";
}