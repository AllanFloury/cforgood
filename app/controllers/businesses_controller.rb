class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    @businesses_location = business.near(params[:city].capitalize, 20)
    @markers = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
    end
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
