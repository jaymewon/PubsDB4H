class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table    :publications do |t|
      t.string      :title, limit: 160, null: false
      t.integer     :pub_number
      t.bigint      :contact_id, null: false
      t.string      :location, limit: 240
      t.date        :expiration
      t.float       :cost 
      t.integer     :quantity_on_hand
      t.references  :pub_num_prefix, null: false, foreign_key: true
      t.references  :status, null: true, foreign_key: true
      t.references  :unit, null: false, foreign_key: true
      t.references  :availability, null: true, foreign_key: true
      t.references  :designer, null: true, foreign_key: true
      t.references  :first_category, null: false, foreign_key: true
      t.references  :second_category, null: true, foreign_key: true
      t.references  :third_category, null: true, foreign_key: true
      t.timestamps

      t.index   :contact_id
    end
  end
end
