 import rangeSlider from 'ion-rangeslider';

 const initLikesSlider => { $(".js-range-slider").ionRangeSlider({
    type: 'double',
    min: 0,
    max: 100000,
    from: 2000,
    to: 10000,
});
};
 export { initLikesSlider };