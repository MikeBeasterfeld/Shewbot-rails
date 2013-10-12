class RemoveVotesCountColumnFromTitleTable < ActiveRecord::Migration
  def up
  	remove_column :titles, :vote_count
  end

  def down
  end
end
