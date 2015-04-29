class Business < ActiveRecord::Base
  has_many     :perks
  geocoded_by :address
  after_validation :geocode, if: :city_changed?

  def address_changed?
    :street_changed? || :zipcode_changed? || :city_changed?

  end

  def address
    "#{street}, #{zipcode} #{city}"
  end
end
