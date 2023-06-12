class Code < ApplicationRecord
    default_scope {order(:name)}
end
  