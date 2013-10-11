class Show < ActiveRecord::Base
  attr_accessible :created_at, :title

  has_many :titles
end
