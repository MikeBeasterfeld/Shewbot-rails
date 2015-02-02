class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :admin

  validates :name, :presence => true

  validates_inclusion_of :admin, :in => [true, false]

  has_many :authorizations

  after_initialize :set_defaults

  def set_defaults
  	self.admin ||= false
  end

  before_create :create_remember_token

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

  def admin?
    self.admin
  end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
