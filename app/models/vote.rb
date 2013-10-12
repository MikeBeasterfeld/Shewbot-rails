class Vote < ActiveRecord::Base
  attr_accessible :title_id, :voterip

  belongs_to :title, :counter_cache => true
end
