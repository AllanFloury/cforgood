class PerksController < ApplicationController
  def index
    @perks_location = Perk.near(params[:city].capitalize, 20)
    @markers = Gmaps4rails.build_markers(@perks) do |perk, marker|
      marker.lat perk.latitude
      marker.lng perk.longitude
      marker.infowindow render_to_string(partial: "/perks/map_box", locals: { perk: perk })
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
