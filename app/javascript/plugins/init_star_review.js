import "jquery-bar-rating";
// import "jquery-bar-rating/dist/themes/bars-pill.css";

const initStarReview = () => {
  $('#review_rating').barrating({
    theme: 'bars-pill'
  });
};

export { initStarReview }
