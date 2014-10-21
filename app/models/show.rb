class Show < ActiveRecord::Base
  attr_accessible :title, :episode_number

  validates :title, presence: true

  has_many :titles, :dependent => :destroy
  has_many :links, :dependent => :destroy
  has_many :questions, :dependent => :destroy

  def self.current_show
  	self.order("created_at DESC").first
  end

  def self.update_current_show(new_show)
    current_show = self.order("created_at DESC").first

    if new_show.nil? && Settings.live_url.nil?
      return current_show
    end

    if current_show.nil? || current_show.title != new_show
    	self.transaction do 
    		current_show = self.order("created_at DESC").lock(true).first

    		if current_show.nil? || current_show.title != new_show
    			current_show = self.create(title: new_show)
    		end
    	end
    end

  	return current_show
  end
end

