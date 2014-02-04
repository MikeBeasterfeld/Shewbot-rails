class AddTitleCountToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :titles_count, :integer

    Show.find_each do |show|
      Show.reset_counters(show.id, :titles)
    end
  end
end
