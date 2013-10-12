class AddVotesCountColumnToTitleTable < ActiveRecord::Migration
  def change
  	add_column :titles, :vote_count, :integer
  end
end
