class Title < ActiveRecord::Base
  attr_accessible :created_at, :irc_user_id, :show_id, :title, :title_lc

  validates :content, :length => { :maximum => 50 }

  belongs_to :show

  has_one :irc_user
end
