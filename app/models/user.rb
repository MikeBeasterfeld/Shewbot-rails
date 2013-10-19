class User < ActiveRecord::Base
  attr_accessible :name, :admin

  validates :name, :presence => true

  validates_inclusion_of :admin, :in => [true, false]

  has_many :authorizations

  after_initialize :set_defaults

  def set_defaults
  	self.admin ||= false
  end

end
