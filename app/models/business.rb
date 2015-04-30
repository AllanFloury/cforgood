class Business < ActiveRecord::Base
  has_many     :perks
  geocoded_by :address
  after_validation :geocode, if: :city_changed?
  has_attached_file :picture,
    styles: { medium: "500x100>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def address_changed?
    :street_changed? || :zipcode_changed? || :city_changed?
  end

  def address
    "#{street}, #{zipcode} #{city}"
  end
end
