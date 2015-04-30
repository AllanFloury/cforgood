class Business < ActiveRecord::Base
  has_many     :perks
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address_changed?
    :street_changed? || :zipcode_changed? || :city_changed?

  end

  def address
    "#{street}, #{zipcode} #{city}"
  end

  def gmaps4rails_infowindow
      "#{link_to 'Business' , business_path}"
  end
end
