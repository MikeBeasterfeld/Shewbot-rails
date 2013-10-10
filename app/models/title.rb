class Title < ActiveRecord::Base
  attr_accessible :created_at, :ircuser_id, :title, :title_lc
end
