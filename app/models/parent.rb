class Parent < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	has_many	:children
	
	geocoded by :full_address

	after validation :geocode

	def full_address
		"#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{zipcode}"
	end

end
