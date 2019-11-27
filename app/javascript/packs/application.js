import "bootstrap";
import 'ion-rangeslider/css/ion.rangeSlider.min.css';
import "../plugins/flatpickr";
import { initSliders } from './sliders'


$(window).scroll(function(e) {

    // add/remove class to navbar when scrolling to hide/show
    const scroll = $(window).scrollTop();
    if (scroll >= 60) {
        $('.navbar').addClass("navbar-hide");
    } else {
        $('.navbar').removeClass("navbar-hide");
    }
});

initSliders()

