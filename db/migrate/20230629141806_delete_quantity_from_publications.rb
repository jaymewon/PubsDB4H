class DeleteQuantityFromPublications < ActiveRecord::Migration[7.0]
  def change
    remove_column :publications, :quantity_on_hand
  end
end
