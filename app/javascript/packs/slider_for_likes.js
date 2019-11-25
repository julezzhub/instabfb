 import rangeSlider from 'ion-rangeslider';
 import 'ion-rangeslider/css/ion.rangeSlider.min.css';

 $(".js-range-slider").ionRangeSlider({
    type: 'single',
    min: 500,
    max: 10000,
    from: 2000,
    skin: 'round',
});
