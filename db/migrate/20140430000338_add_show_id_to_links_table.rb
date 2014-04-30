class AddShowIdToLinksTable < ActiveRecord::Migration
  def change
    add_column :links, :show_id, :integer
  end
end
