class PublicationAuthor < ApplicationRecord
    belongs_to  :publication
    belongs_to  :person
end
  