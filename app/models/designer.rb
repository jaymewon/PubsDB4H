class Designer < ApplicationRecord
    default_scope {order(:name)}
end
  