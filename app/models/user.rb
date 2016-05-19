class User < ActiveRecord::Base
	#before input to db will change emAil to email
	before_save { self.email = email.downcase }
	# presence validation
	validates :name, presence: true, length: { maximum: 50 }
	# validation email unique
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
end
