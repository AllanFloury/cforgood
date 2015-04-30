class BusinessesController < ApplicationController
  def index
    skip_policy_scope
    @businesses = Business.all
    # @businesses = Business.near(params[:address], 20)
    @markers = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
    end
  end



 # authorize @business for other actions

  def show
    skip_authorization
  end

  def business_params
      params.require(:business).permit(:title, :description, :city  , :address, :latitude, :longitude)
  end
end
