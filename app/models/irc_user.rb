class IrcUser < ActiveRecord::Base
  attr_accessible :name

  belongs_to :title
end
