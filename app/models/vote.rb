class Vote < ActiveRecord::Base
  attr_accessible :title_id, :voterip

  validates_uniqueness_of :voterip, :scope => :title_id

  validates :title_id, :presence => true

  belongs_to :title, :counter_cache => true
end
