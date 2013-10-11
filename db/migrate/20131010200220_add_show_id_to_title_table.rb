class AddShowIdToTitleTable < ActiveRecord::Migration
  def change
  	add_column :titles, :show_id, :integer
  end
end
