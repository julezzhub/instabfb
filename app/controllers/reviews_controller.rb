class ReviewsController < ApplicationController
  def create
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
    @boyfriend = Boyfriend.new(review_params)
    @review.boyfriend = @boyfriend
    if @review.save
      redirect_to boyfriend_path(@boyfriend)
    else
      render 'reviews/new'
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
