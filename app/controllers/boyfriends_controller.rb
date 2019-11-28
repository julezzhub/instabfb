class BoyfriendsController < ApplicationController
  def index
    @boyfriend = Boyfriend.new
    @message = 'Browse some of our best Instagram boyfriends'
    unless params['search']
      @boyfriends = policy_scope(Boyfriend).geocoded

    @markers = @boyfriends.map do |boyfriend|
          {
            lat: boyfriend.latitude,
            lng: boyfriend.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { boyfriend: boyfriend }),
            image_url: helpers.asset_url('photographer.png')
          }
    end

    else
      if params[:search][:location].present? #|| params.include?(:boyfriend)
        # @search = params['search'] || params['boyfriend']
        @location_search = params['search']['location']
        @message = "These Instaboys from #{@location_search} are ready to up your gram"
        @boyfriends = policy_scope(Boyfriend).near(@location_search, 20)
          # @height = @search['height']
          # @smartphone_model = @search['smartphone_model']
          # @pet = @search['pet']
          # @category = @search['category']
        # @boyfriends = @likes_range.select { |boyfriend| (boyfriend.location == @location_search) }
        @markers = @boyfriends.map do |boyfriend|
          {
            lat: boyfriend.latitude,
            lng: boyfriend.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { boyfriend: boyfriend }),
            image_url: helpers.asset_url('photographer.png')
          }
        end
        if @boyfriends.empty?
          @message = "No Instalovers meeting your standards. Browse some of our other options below."
          @boyfriends = policy_scope(Boyfriend).geocoded
          @markers = @boyfriends.map do |boyfriend|
            {
              lat: boyfriend.latitude,
              lng: boyfriend.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { boyfriend: boyfriend }),
              image_url: helpers.asset_url('photographer.png')
            }
          end
        end
      else
        @boyfriends = policy_scope(Boyfriend).geocoded
        @markers = @boyfriends.map do |boyfriend|
            {
              lat: boyfriend.latitude,
              lng: boyfriend.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { boyfriend: boyfriend }),
              image_url: helpers.asset_url('photographer.png')
            }
        end
      end
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
    #@likes = params[:boyfriend][:likes].split(";").map(&:to_i)
    #@likes_range = Boyfriend.range_likes(@likes[0], @likes[1])
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
