class SecondCategory < ApplicationRecord
    default_scope {order(:name)}
    belongs_to  :first_category
    has_many    :third_categories
end