class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string  :first_name, limit: 32
      t.string  :last_name, limit: 32
      t.boolean :active
      t.timestamps
    end
  end
end
