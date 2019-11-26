 import rangeSlider from 'ion-rangeslider';
 import 'ion-rangeslider/css/ion.rangeSlider.min.css';

 $(".js-range-slider").ionRangeSlider({
    type: 'double',
    min: 0,
    max: 100000,
    from: 2000,
    to: 10000,
});
