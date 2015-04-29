class PerksController < ApplicationController
  def index
    skip_policy_scope
    @perks = Perk.all
    # @perks = perks.find(params[:business_id])
    # @perks_location = Perk.near(params[:city].capitalize, 20)
    # @markers = Gmaps4rails.build_markers(@perks) do |perk, marker|
    #   marker.lat perk.latitude
    #   marker.lng perk.longitude
  end

  def show
  end

  def perk_params
    params.require(:perk).permit(:title, :details, :state, :business_id)
  end
end
