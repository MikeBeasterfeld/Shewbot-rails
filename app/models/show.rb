class Show < ActiveRecord::Base
  attr_accessible :created_at, :title

  validates :title, presence: true

  has_many :titles
end
