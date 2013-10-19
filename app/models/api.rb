class Api < ActiveRecord::Base
	before_create :generate_api_key


  attr_accessible :key, :name

  private

  def generate_api_key
  	begin
	  	self.key = SecureRandom.hex
	  end while self.class.exists?(key: key)
	end

end
