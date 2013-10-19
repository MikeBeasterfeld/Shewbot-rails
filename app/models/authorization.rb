class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id

  validates :provider, :uid, :presence => true

  belongs_to :user
end
