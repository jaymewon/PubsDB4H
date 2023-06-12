class RemoveActiveColumnFromFirstCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :first_categories, :active
  end
end
