import "bootstrap";
import 'ion-rangeslider/css/ion.rangeSlider.min.css';
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initSliders } from './sliders'

initMapbox();

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

