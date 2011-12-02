require 'digest/sha2'

class Member < ActiveRecord::Base
	validates :first_name, :last_name, :email, :presence => true
	
	validates :password, :confirmation => true
	attr_accessor :password_confirmation
	attr_reader	  :password, :image_url
	
	validate			:password_must_be_present
	
	def name
		name = :last_name + " " + :first_name
		@name = name
	end
	
	def Member.authenticate(last_name, password)
		if member = find_by_name(last_name)
			if member.hashed_password == encrypt_password(password, member.salt)
				member
			end
		end
	end
	
	
	
		
	def Member.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end
	
  # 'password' is a virtual attribute

def password=(password)
	@password = password
	
	if password.present?
		generate_salt
		self.hashed_password = self.class.encrypt_password(password, salt)
	end
end

private
	
		def password_must_be_present
			errors.add(:password, "Missing password") unless hashed_password.present?
		end

		def generate_salt
			self.salt = self.object_id.to_s + rand.to_s
		end
end
 
