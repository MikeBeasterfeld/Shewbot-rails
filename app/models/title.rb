class Title < ActiveRecord::Base
  attr_accessible :created_at, :ircuser_id, :show_id, :title, :title_lc

  validates :title, :length => { :maximum => 50 }

  belongs_to :show

  has_one :irc_user
end
