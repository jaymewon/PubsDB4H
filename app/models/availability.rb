class Availability < ApplicationRecord
    default_scope {order(:name)}
end
  