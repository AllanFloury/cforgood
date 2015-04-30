class PagesController < ApplicationController
  def home
    @perks = Perk.all
  end

  def about
  end

  def contact
  end

  def perk_params
    params.require(:perk).permit(:title, :details, :state, :business_id)
  end
end
