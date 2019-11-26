class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @boyfriend = Boyfriend.new
  end
end
