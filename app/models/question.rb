class Question < ActiveRecord::Base
  attr_accessible :irc_user_id, :question, :show_id

  validates :question, :presence => true, :length => { :maximum => 255 }
  validates :irc_user_id, :presence => true
  validates :show_id, :presence => true

  validates_uniqueness_of :question, :scope => :show_id, :message => 'Question already submitted'

  belongs_to :irc_user

  scope :with_irc_users, lambda { || joins("LEFT OUTER JOIN irc_users ON questions.irc_user_id = irc_users.id").select("questions.*, irc_users.name AS irc_user_name") }

end
