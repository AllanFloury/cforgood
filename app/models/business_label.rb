class BusinessLabel < ActiveRecord::Base
  belongs_to :business
  belongs_to :label
end
