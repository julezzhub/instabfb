class BoyfriendsController < ApplicationController
  def index
    @boyfriends = Boyfriend.all
  end

  def show
    @boyfriend = Boyfriend.find(params[:id])
  end

  def new
    @boyfriend = Boyfriend.new
  end

  def create
    @boyfriend = Boyfriend.new(boyfriend_params)
    @boyfriend.user = current_user
    if @boyfriend.save
      redirect_to boyfriend_path(@boyfriend)
    else
      render 'new'
    end
  end

  private

  def boyfriend_params
    params.require(:boyfriend).permit(:name, :description)
  end
end
