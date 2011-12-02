require 'digest/sha2'

class User < ActiveRecord::Base

	attr_accessor :password
	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :image,
									:spouse, :address, :city, :state, :telephone, :cellphone, :zip, :remarks
	validates :last_name, :first_name, :presence => true
	validates :password, 	:presence		=>	 true,
												:confirmation => true,
												:length				=> { :within => 6..40 }


	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
#	validate :password_must_be_present
	
	before_save :encrypt_password

#	def User.authenticate(name, password)
#		if user = find_by_name(name)
#			if user.hashed_password == encrypt_password(password, user.salt)
#				user
#			end
#		end
#	end
	
#	def User.encrypt_password(password, salt)
#		Digest::SHA2.hexdigest(password + "wibble" + salt)
#	end
	
#	def password=(password)
#		@password = password
#		
#		if password.present?
#			generate_salt
#			self.hashed_password = self.class.encrypt_password(password, salt)
#		end
#	end	

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
		
	private
	
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end
		
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end

end
