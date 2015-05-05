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

  def search
    @category = Category.find(params[:search_category_id]) # trouver la categorie où l'id correspend à la valeur récupérer via le filtre (search_category_id)
    @businesses = @category.businesses # pour faire la relation entre la category et les perks
    @perks = Perk.where(business: @businesses) # retourne les perks liés aux businesses de la category
    authorize @perks
  end

  def show
    @perk = Perk.find(params[:id])
    skip_authorization
  end

  def edit
    @perk = Perk.find(params[:id])
  end

  def update
     @perk = Perk.find(params[:id])
     @perk.state = true
     @perk.save
     authorize @perk
     redirect_to perks_path
     flash[:notice] = "Vous pouvez maintenant bénéficier de #{@perk.title}"
  end


  def perk_params
    params.require(:perk).permit(:title, :details, :state, :business_id)
  end

end
