class ThirdCategory < ApplicationRecord
    default_scope {order(:name)}
    belongs_to  :first_category
    belongs_to  :second_category
end