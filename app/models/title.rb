class Title < ActiveRecord::Base
  attr_accessible :created_at, :irc_user_id, :show_id, :title, :title_lc, :votes_count

  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :irc_user_id, :presence => true
  validates :show_id, :presence => true

  belongs_to :show
  belongs_to :irc_user

  has_many :votes

end
