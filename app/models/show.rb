class Show < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true

  has_many :titles

  def self.current_show
  	self.order("created_at DESC").first
  end
end
