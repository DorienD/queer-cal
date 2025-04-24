document.getElementById("main-nav-toggle").addEventListener('click', function(){
    document.body.classList.toggle('-is-menu-open');
    document.getElementById('main-nav').classList.toggle('is-open');
    this.classList.toggle('is-open');
});

$(document).keyup(function(e) {
    if(e.keyCode == 27) { // escape key
        const mainNav = document.getElementById('main-nav');

        if (mainNav.classList.contains('is-open')) {
            mainNav.classList.remove('is-open');
        }
    }
});

Fancybox.bind("[data-fancybox]", {
    Toolbar: {
        display: {
          left: ["infobar"],
          middle: [],
          right: ["close"],
        },
      },
});