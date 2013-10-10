class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :title_lc
      t.datetime :created_at
      t.integer :ircuser_id

      t.timestamps
    end
  end
end
