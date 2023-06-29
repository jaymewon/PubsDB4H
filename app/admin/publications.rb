ActiveAdmin.register Publication do
  decorate_with PublicationDecorator

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :pub_number, :contact_id, :location, :expiration, :cost, :pub_num_prefix_id, :status_id, 
                :unit_id, :availability_id, :designer_id, :first_category_id, :second_category_id, :third_category_id, origination_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :pub_number, :contact_id, :location, :expiration, :cost, :quantity_on_hand, :pub_num_prefix_id, :status_id, :unit_id, :availability_id, :designer_id, :first_category_id, :second_category_id, :third_category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu priority: 1

  index do
    selectable_column
    column 'Prefix', :pub_num_prefix
    column  'Pub #', :pub_number
    column  :title
    column  :code
    column  '1st Category',   :first_category
    column  '2nd Category',   :second_category
    column  '3rd Category',   :third_category
    column  'Contact/Author', :contact
    column  :expiration
    column  :status do |pub|
      status_tag pub.pub_status
    end
    actions
  end

  scope :all_pubs, default: true
  scope :active
  scope :archived
  scope :blank_status

  preserve_default_filters!

  filter  :originations, collection: -> {
    Person.preload(:publications_as_contact).select { |person| not person.publications_as_contact.empty? }
  }

  remove_filter :created_at
  remove_filter :location
  remove_filter :publication_originations
  
  form do |f|
    f.semantic_errors

    f.inputs do
      f.input   :pub_num_prefix
      if f.object.new_record?
        f.input :pub_number, input_html: { value: AdminHelper.next_pub_number }
      else
        f.input :pub_number
      end
      f.input :title
      f.input :first_category, label: '1st Category'
      f.input :second_category, label: '2nd Category'
      f.input :third_category, label: '3rd Category'
      f.input :originations
      f.input :contact, label: 'Contact/Author'
      f.input :location
      f.input :status
      f.input :unit
      f.input :code
      f.input :expiration, :as => :date_select, end_year: Time.now.year+10
      f.input :availability
      f.input :designer
      f.input :cost
    end
    f.actions
  end

  show do 
    attributes_table do
      row :pub_num_prefix
      row :pub_number
      row :title
      row("1st Category") { |r| r.first_category}
      row("2nd Category") { |r| r.second_category}
      row("3rd Category") { |r| r.third_category}
      row :originations
      row("Contact/Author") { |r| r.contact}
      row :location
      row :status do |pub|
        status_tag pub.pub_status
      end
      row :unit 
      row :code 
      row :expiration
      row :availability
      row :designer
      row :cost
      row :created_at
      row :updated_at 
    end
    active_admin_comments
  end

  csv do
    column( :pub_num_prefix ) {|pub| pub.pub_num_prefix.nil? ? "" : pub.pub_num_prefix.name}
    column :pub_number
    column :title
    column :location
    column( :contact ) {|pub| pub.contact.nil? ? "None" : pub.contact.name}
    column :expiration
    column( :availability ) {|pub| pub.availability.nil? ? "unknown" : pub.availability.name}
  end
end
