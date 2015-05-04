class Business < ActiveRecord::Base
  has_many     :perks
  belongs_to   :category
  geocoded_by  :address

  has_attached_file :picture,
    styles: { medium: "500x100>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

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
