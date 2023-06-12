class CreateSecondCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :second_categories do |t|
      t.string  :name
      t.references :first_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
