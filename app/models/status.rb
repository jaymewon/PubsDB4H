class Status < ApplicationRecord
    default_scope {order(:name)}

    ARCHIVED        = 1
    CURRENT         = 2
    NEEDS_UPDATE    = 3
    IN_PROGRESS     = 4
    
end
  