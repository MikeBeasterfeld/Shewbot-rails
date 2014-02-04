class AddEpisodeNumberToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :episode_number, :integer
  end
end
