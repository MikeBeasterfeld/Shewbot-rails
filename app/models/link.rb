class Link < ActiveRecord::Base
  attr_accessible :created_at, :irc_user_id, :show_id, :url

  validates :url, :presence => true, :length => { :maximum => 255 }
  validates :irc_user_id, :presence => true
  validates :show_id, :presence => true

  validates_uniqueness_of :url, :scope => :show_id, :message => 'Link already submitted'

  belongs_to :irc_user

  after_initialize :set_url_lc

  scope :with_irc_users, lambda { || joins("LEFT OUTER JOIN irc_users ON links.irc_user_id = irc_users.id").select("links.*, irc_users.name AS irc_user_name") }

  def set_url_lc
    if self.url
      self.url = self.url.downcase
    end
  end

end
