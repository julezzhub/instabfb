import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";

const initStarReview = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarReview }
