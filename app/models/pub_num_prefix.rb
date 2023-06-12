class PubNumPrefix < ApplicationRecord
    default_scope {order(:prefix)}

    def name
        prefix
    end

    scope :active, -> { where( active: true ) }
    scope :inactive, -> { where( active: false ) }
end
  