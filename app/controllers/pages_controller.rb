class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @boyfriend = Boyfriend.new
  end

  def search
    @boyfriends = Boyfriend.all
    @search = params['search']
    @location = @search['location']
    @likes = @search['likes']
    @height = @search['height']
    @smartphone_model = @search['smartphone_model']
    @pet = @search['pet']
    @category = @search['category']

    @boyfriends = Boyfriend.where(location: @location, likes: @likes, height: @height, smartphone_model: @smartphone_model, pet: @pet, category: @category)
  end
end
