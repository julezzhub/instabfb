class BoyfriendsController < ApplicationController
  def index
    @boyfriends = Boyfriend.all
  end

  def show
    @boyfriend = Boyfriend.find(params[:id])
    @images = @boyfriend.images.all
    @review = Review.new
  end

  def new
    @boyfriend = Boyfriend.new
    @image = @boyfriend.images.build
  end

  def create
    @boyfriend = Boyfriend.new(boyfriend_params)
    @boyfriend.user = current_user
    if @boyfriend.save
      params[:images]['link'].each do |photo|
        @image = @boyfriend.images.create!(link: photo)
      end
      redirect_to boyfriend_path(@boyfriend)
    else
      @boyfriend.images.build
      render 'new'
    end
  end

  private

  def boyfriend_params
    params.require(:boyfriend).permit(:name, :description, images_attributes: [:id, :boyfriend_id, :link])
  end
end
