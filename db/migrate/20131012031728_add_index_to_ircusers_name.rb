class AddIndexToIrcusersName < ActiveRecord::Migration
  def change
  	add_index :irc_users, :name, unique: true
  end
end
