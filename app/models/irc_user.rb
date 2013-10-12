class IrcUser < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :titles
end
