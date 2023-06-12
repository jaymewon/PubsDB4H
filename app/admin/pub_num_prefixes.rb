ActiveAdmin.register PubNumPrefix do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :prefix, :description, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:prefix, :description, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  config.sort_order = 'prefix_asc'

  index do
    selectable_column
    column  :prefix
    column  :description
    column  :active
    actions
  end

  scope :all, default: true
  scope :active
  scope :inactive

  remove_filter :created_at
  remove_filter :updated_at
end
