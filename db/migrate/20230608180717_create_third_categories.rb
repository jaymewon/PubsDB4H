class CreateThirdCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :third_categories do |t|
      t.string  :name
      t.references :first_category, null: false, foreign_key: true
      t.references :second_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
