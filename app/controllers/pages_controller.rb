class PagesController < ApplicationController
  def home
    skip_authorization
    @perks = Perk.all
  end

  def about
  end

  def contact
  end

  def partner
  end

  def mycard
    skip_authorization
  end
end
