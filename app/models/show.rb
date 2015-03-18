class Show < ActiveRecord::Base
  attr_accessible :title, :episode_number, :art

  validates :title, presence: true

  has_many :titles, :dependent => :destroy
  has_many :links, :dependent => :destroy
  has_many :questions, :dependent => :destroy

  def self.current_show
  	self.order("created_at DESC").first
  end

  def self.update_current_show(show_data = [])
    title = show_data[0]
    art = show_data[1]

    current_show = self.order("created_at DESC").first

    if !title.nil? && Settings.live_url.nil?
      return current_show
    end

    if current_show.nil? || current_show.title != title || current_show.created_at < 4.hours.ago
    	self.transaction do 
    		current_show = self.order("created_at DESC").lock(true).first

    		if current_show.nil? || current_show.title != title || current_show.created_at < 4.hours.ago
    			current_show = self.create(title: title, art: art)
    		end
    	end
    end

  	return current_show
  end
end

