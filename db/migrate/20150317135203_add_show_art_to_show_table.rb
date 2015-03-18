class AddShowArtToShowTable < ActiveRecord::Migration
  def change
    add_column :shows, :art, :string
  end
end
