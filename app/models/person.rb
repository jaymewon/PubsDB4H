class Person < ApplicationRecord
    default_scope {order(:last_name, :first_name)}

    has_many    :publication_authors
    has_many    :publications, through: :publication_authors

    has_many    :publications_as_contact, class_name: 'Publication', foreign_key: 'contact_id'

    validates_presence_of   :first_name
    validates_presence_of   :last_name

    validates_length_of :first_name, maximum: 32
    validates_length_of :last_name, maximum: 32

    def name
        last_name + ', ' + first_name
    end

    scope :active, -> { where( active: true ) }
    scope :inactive, -> { where( active: false ) }
end
  