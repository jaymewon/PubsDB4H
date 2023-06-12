class FirstCategory < ApplicationRecord
    default_scope {order(:name)}
    has_many    :second_categories
    has_many    :third_categories
end
  