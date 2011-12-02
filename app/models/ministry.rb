class Ministry < ActiveRecord::Base
	validates :title, :description, :presence => true
end
