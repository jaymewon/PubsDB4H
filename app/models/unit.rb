class Unit < ApplicationRecord
    default_scope {order(:name)}
end
  