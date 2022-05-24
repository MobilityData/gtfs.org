function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (var i = 0; i < tabcontent.length; i++) {
      tabcontent[i].classList.remove('show');
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (var i = 0; i < tablinks.length; i++) {
      tablinks[i].classList.remove('active');
    }
    document.getElementsByClassName(cityName)[0].classList.add('show');
    document.getElementsByClassName(cityName)[1].classList.add('show');
    var cuttentTabClass = evt.currentTarget.className.split(" ")[1];
    console.log(cuttentTabClass);
    document.getElementsByClassName(cuttentTabClass)[0].classList.add('active');
    document.getElementsByClassName(cuttentTabClass)[1].classList.add('active');
  }
  
  // Get the element with id="defaultOpen" and click on it
  document.getElementById("defaultOpen").click();