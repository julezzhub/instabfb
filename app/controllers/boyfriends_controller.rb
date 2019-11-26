class BoyfriendsController < ApplicationController
  def index
    if params.include?(:search)
      @search = params['search']
      @location = @search['location']
      @likes = @search[:likes].split(";").map(&:to_i)
      @likes_range = Boyfriend.range_likes(@likes[0], @likes[1])
        # @height = @search['height']
        # @smartphone_model = @search['smartphone_model']
        # @pet = @search['pet']
        # @category = @search['category']
      @boyfriends = @likes_range.select { |boyfriend| (boyfriend.location.upcase == @location.upcase) }
    else
      @boyfriends = Boyfriend.all
    end
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
