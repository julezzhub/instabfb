import rangeSlider from 'ion-rangeslider';

const initSliders = () => {
	// height
	$(".js-range-slider1").ionRangeSlider({
	    type: 'single',
	    min: 0,
	    max: 250,
	    from: 0,
	});

	// likes
	$(".js-range-slider2").ionRangeSlider({
    type: 'double',
    min: 0,
    max: 100000,
    from: 2000,
    to: 10000,
});
};

export { initSliders };