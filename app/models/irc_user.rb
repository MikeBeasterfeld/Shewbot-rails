class IrcUser < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :titles


  def self.find_or_create_by_name(name)
		model = self.find(:first, :conditions => ["lower(name) = ?", name.downcase]) 
		model ||= self.create(:name => name)
  end

end
