class RenamePubAuthorToPubsOrigination < ActiveRecord::Migration[7.0]
  def change
    rename_table :publication_authors, :publication_originations
  end
end
