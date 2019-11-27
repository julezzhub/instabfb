class BoyfriendsController < ApplicationController
  def index
    # @boyfriend = Boyfriend.new
    @boyfriends = policy_scope(Boyfriend) #.geocoded #returns boyfriends with coordinates
    # @markers = @boyfriends.map do |boyfriend|
    #   {
    #     lat: boyfriend.latitude,
    #     lng: boyfriend.longitude
    #   }
    # end
    if params.include?(:search) #|| params.include?(:boyfriend)
      # @search = params['search'] || params['boyfriend']
      @location_search = params['search']['location']
      @message = "These Instaboys from #{@location_search} are ready to up your gram"
      @boyfriends = policy_scope(Boyfriend) #.near(@location_search, 10)
      # @likes = @search[:likes].split(";").map(&:to_i)
      # @likes_range = Boyfriend.range_likes(@likes[0], @likes[1])
        # @height = @search['height']
        # @smartphone_model = @search['smartphone_model']
        # @pet = @search['pet']
        # @category = @search['category']
      # @boyfriends = @likes_range.select { |boyfriend| (boyfriend.location == @location_search) }
      if @boyfriends.empty?
        @message = "No Instalovers meeting your standards. Browse some of our other options below."
        @boyfriends
      end
    else
      @message = 'Browse some our best Instagram boyfriends'
      @boyfriends
    end
  end

  def show
    @boyfriend = Boyfriend.find(params[:id])
    @images = @boyfriend.images.all
    @review = Review.new
    @booking = Booking.new
    authorize @boyfriend
  end

  def new
    @boyfriend = Boyfriend.new
    authorize @boyfriend
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
    authorize @boyfriend
  end

  private

  def boyfriend_params
    params.require(:boyfriend).permit(:name, :description, :height, :smartphone_model, :category, :pet, :location, :likes, images_attributes: [:id, :boyfriend_id, :link])
  end
end
