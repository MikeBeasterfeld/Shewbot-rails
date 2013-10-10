class CreateIrcUsers < ActiveRecord::Migration
  def change
    create_table :irc_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
