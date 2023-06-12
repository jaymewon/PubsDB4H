ActiveAdmin.register FirstCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  menu label: '1st Category'
  
  config.sort_order = 'name_asc'

  index do
    selectable_column
    column  :name
    actions
  end

  remove_filter :second_categories
  remove_filter :third_categories
  remove_filter :created_at
  remove_filter :updated_at

end
