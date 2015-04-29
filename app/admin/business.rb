ActiveAdmin.register Business do
form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :email
      f.input :category_id
      f.input :description
      f.input :street
      f.input :zipcode
      f.input :city
      f.input :telephone
    end
    f.actions
  end

  permit_params :name, :email, :category_id, :description, :street, :zipcode, :city, :telephone
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
