class Api < ActiveRecord::Base
	before_create :generate_api_key

  attr_accessible :api_key, :name

  validates_presence_of :name

  private

  def generate_api_key
  	begin
	  	self.api_key = SecureRandom.hex
	  end while self.class.exists?(api_key: api_key)
	end

end

