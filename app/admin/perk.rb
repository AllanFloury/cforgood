ActiveAdmin.register Perk do

  permit_params :title, :details, :state, :picture, :business_id

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Identity" do
      f.input :title
      f.input :details
      f.input :state
      f.input :picture, :as => :file
      f.input :business
    end
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
