class ChangeArtShareTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :art_shares, :artwork_shares
  end
end
