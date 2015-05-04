class BusinessesController < ApplicationController
  def index
    skip_policy_scope
    @perks = Perk.all

    @businesses = Business.all
    # @businesses = Business.near(params[:address], 20)
    @markers = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
      marker.infowindow render_to_string(partial: "/businesses/map_pop", locals: { business: business })
    end
    # @json = User.all.to_gmaps4rails do |business, marker|
    #   marker.infowindow render_to_string(:partial => "/businesses/my_template", :locals => { :object => business})
    #   marker.picture({
    #               :picture => "http://www.blankdots.com/img/github-32x32.png",
    #               :width   => 32,
    #               :height  => 32
    #              })
    #   marker.title   "i'm the title"
    #   marker.sidebar "i'm the sidebar"
    #   marker.json({ :id => business.id, :foo => "bar" })
    # end
  end

 # authorize @business for other actions

  def show
    @business = Business.find(params[:id])
    @markers = Gmaps4rails.build_markers(@business) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
    end
    skip_authorization
  end

  def new
    @business = Business.new
    skip_authorization
  end

  def create

  end

  def business_params
      params.require(:business).permit(:title, :description, :city, :zipcode, :street, :address, :latitude, :longitude)
  end
end
