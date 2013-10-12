class AddVotesCountColumnToTitleTableWithDefaultCorrectedColumnName < ActiveRecord::Migration
  def change
  	add_column :titles, :votes_count, :integer, :default => 0
  end
end
