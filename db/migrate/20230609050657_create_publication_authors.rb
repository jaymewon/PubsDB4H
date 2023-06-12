class CreatePublicationAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :publication_authors do |t|
      t.references  :publication, null: false, foreign_key: true
      t.references  :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end
