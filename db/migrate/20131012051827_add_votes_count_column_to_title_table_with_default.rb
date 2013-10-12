class AddVotesCountColumnToTitleTableWithDefault < ActiveRecord::Migration
  def change
  	add_column :titles, :vote_count, :integer, :default => 0
  end
end
