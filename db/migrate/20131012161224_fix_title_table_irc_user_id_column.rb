class FixTitleTableIrcUserIdColumn < ActiveRecord::Migration
  def up
  	rename_column :titles, :ircuser_id, :irc_user_id
  end

  def down
  end
end
