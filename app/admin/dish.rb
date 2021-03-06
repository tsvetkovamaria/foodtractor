ActiveAdmin.register Dish do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :price, :image, :place_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :place_id, :label => "Select a place:", :as => :select, :collection => Place.all
      f.input :price
      f.input :image, :as => :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :image do |dish|
      image_tag dish.image.url(:thumb)
    end
    column :name do |dish|
      link_to dish.name, admin_dish_path(dish)
    end
    column :place_id
    column :price
    actions
  end

  show do
    attributes_table do
      row :image do |dish|
       image_tag dish.image.url(:medium)
      end
      row :name
      row :place_id
      row :price
    end
    active_admin_comments
  end

end
