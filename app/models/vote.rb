class Vote < ActiveRecord::Base
  attr_accessible :title_id, :voterip

  belongs_to :title
end
