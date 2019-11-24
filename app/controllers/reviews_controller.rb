class ReviewsController < ApplicationController
  def create
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
    @review = Review.new(review_params) # informatino passed through form (with params)
    @review.boyfriend = @boyfriend # boyfriend thats being reviewed
    @review.user = current_user # the review is linked to the current user
    if @review.save
      redirect_to boyfriend_path(@boyfriend)
    else
      render 'boyfriends/show'
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
