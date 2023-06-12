ActiveAdmin.register Person do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  menu priority: 2

  config.sort_order = 'last_name_asc'

  index do
    selectable_column
    column  :last_name
    column  :first_name
    column  :active
    actions
  end

  scope :all, default: true
  scope :active
  scope :inactive

  remove_filter :created_at
  remove_filter :updated_at
end
