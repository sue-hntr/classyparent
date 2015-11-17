class SchoolHobby < ActiveRecord::Base
	has_many	:children, through: :child_attendances
	has_many	:child_attendances
	
	geocoded_by :full_address

	after_validation :geocode

	def full_address
		"#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{zipcode}"
	end
end
