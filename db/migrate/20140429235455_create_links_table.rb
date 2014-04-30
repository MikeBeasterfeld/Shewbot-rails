class CreateLinksTable < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :irc_user_id

      t.timestamps
    end
  end

end
