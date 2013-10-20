class Api < ActiveRecord::Base
	after_initialize :generate_api_key

  attr_accessible :api_key, :name

  validates_presence_of :name, :api_key

  validates_length_of :api_key, :is => 32

  private

  def generate_api_key
  	begin
	  	self.api_key = SecureRandom.hex
	  end while self.class.exists?(api_key: api_key)
	end

end

