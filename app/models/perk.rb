class Perk < ActiveRecord::Base
  belongs_to :business
  has_many :perk_requests

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
