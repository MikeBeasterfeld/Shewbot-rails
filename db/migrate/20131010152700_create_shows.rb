class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.datetime :created_at

      t.timestamps
    end
  end
end
