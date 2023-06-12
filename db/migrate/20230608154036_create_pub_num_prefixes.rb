class CreatePubNumPrefixes < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_num_prefixes do |t|
      t.string  :prefix, limit: 8
      t.string  :description, limit: 32
      t.boolean :active
      t.timestamps
    end
  end
end
