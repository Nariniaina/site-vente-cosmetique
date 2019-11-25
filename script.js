var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 4000); // Change image every 2 seconds
}

filterSelection("all")
function filterSelection(c) {
  //document.getElementById('defautimage').style.display='none';
  var x,y ,i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) AddClass(x[i], "show");
  }
}

function AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}

function show() {
    a = document.getElementById('conteneur1').style.display;
    b = document.getElementById('conteneur2').style.display;
    c = document.getElementById('choix1').style.display;
    d = document.getElementById('choix2').style.display;
    e = document.getElementById('choix3').style.display;
    if (a == "block" && b == "block" && c == "none" && d == "none" && e == "none") {
      document.getElementById('conteneur1').style.display='none';
      document.getElementById('conteneur2').style.display='none';
      document.getElementById('choix1').style.display='block';
      document.getElementById('choix2').style.display='block';
      document.getElementById('choix3').style.display='block';
    }
    else {
      document.getElementById('conteneur1').style.display='block';
      document.getElementById('conteneur2').style.display='block';
      document.getElementById('choix1').style.display='none';
      document.getElementById('choix2').style.display='none';
      document.getElementById('choix3').style.display='none';
    }
  }