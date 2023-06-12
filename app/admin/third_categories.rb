ActiveAdmin.register ThirdCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :first_category_id, :second_category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :first_category_id, :second_category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu label: '3rd Category'

  config.sort_order = 'first_category_id_asc'

  remove_filter :created_at
  remove_filter :updated_at

  index do
    column  :name
    column  '1st Category', :first_category
    column  '2nd Category', :second_category
    actions
  end


  form do |f|
    f.inputs do
      f.input :name
      f.input :first_category
      f.input :second_category
    end
    f.actions
  end
end
